import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:info_web_app/globledata/global_value.dart';
import 'package:info_web_app/models/comment_model.dart';
import 'package:info_web_app/models/like_model.dart';
import 'package:info_web_app/models/notofication_model.dart';
import 'package:info_web_app/models/post_model.dart';
import 'package:info_web_app/models/profile_model.dart';
import 'package:info_web_app/repository/home_repository.dart';


class HomeViewModel with ChangeNotifier {
  final _myhomeRepo = HomeRepository();
  final _auth = FirebaseAuth.instance;


  bool isPicked = false;
  File? _pickedImage;
  get pickedImage => _pickedImage;
  Uint8List? webImage = Uint8List(8);
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var webSelectedImageBytes = await image.readAsBytes();
        webImage = webSelectedImageBytes;
        _pickedImage = File('a');
        // debugPrint("Image Picked path is ----> ${webImage}");
        isPicked = true;
        notifyListeners();
      } else {
        isPicked = false;
      }
  }



Future<bool?> followUserAPI(String userId)async{
  bool? res;
  await _myhomeRepo.followUser(userId).then((value){
    res =value;
  });
  return res;
}

Future<bool?> unFollowUserAPI(String userId)async{
  bool? res;
  await _myhomeRepo.unFollowUser(userId).then((value){
    res =value;
  });
  return res;
}

Future<bool?> removeUserAPI(String userId)async{
  bool? res;
  await _myhomeRepo.removeFollower(userId).then((value){
    res = value;
  });
  return res;

}


 //get all data of specific user 
Stream<UserProfileModel?> getUserDetails(String userID){
  
  return _myhomeRepo.getUserData(id:userID );
}

 List<UserProfileModel>? res;
//get data all data of  user except me
Future<List<UserProfileModel>?> searchAllUseAPI(String searchText)async{
    _myhomeRepo.searchUsers(searchText).then((value){
      res = value;
    }).onError((error, stackTrace){});

  notifyListeners();
  
  return res;
  
}


bool _loading = false;
  bool get loading => _loading;

  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }



  Future createPost(String text) async {
    debugPrint("Heloo----------------------------------------------------"+text.toString()+"----------->>>>>>>");

    if(loading || (text.toString().trim().isEmpty && !isPicked)) {
      debugPrint("Returning because image is not picked and description is ${text.toString().trim()} and loading is $loading");
      resetImage();
      return;
    }

    debugPrint("Values are isPicked: $isPicked, desc: ${text.toString().trim()} , loading is $loading");
    setLoading(true);

     String? url;
     debugPrint("Going to post");
     if(isPicked){
       url = await uploadImage();
     }
     else {
      url = "";
     }
     debugPrint("< Image Uploaded of post >");
     String? postId;
     await uploadPostInTable(url!,text).then((value){
       postId = value;
       debugPrint("Image Uploaded of post $postId");
     }).onError((error, stackTrace){
       debugPrint("Image Uploaded of post error:$error");
       resetImage();
     });
     debugPrint(" Uploaded in post table");
     await updateInUserProfile(postId!).then((value){
       if(value == true){
         debugPrint("Post Uploaded SuccessFully in user table");
         text = "";
       }
     }).onError((error, stackTrace){
       debugPrint("Image updateInUserProfile error of post $error");
       resetImage();
     });
     resetImage();
    setLoading(false);
  }

  Future<String?> uploadImage() async {
    String? imagePath;
    if (!isPicked) {
       debugPrint("Image not Picked");
       return null;
    } else {
      await _myhomeRepo.uploadPostImageFile(webImage!).then((image){
        debugPrint("Image has been uploaded Url:$imagePath");
        imagePath = image;
      }).onError((error, stackTrace){
        debugPrint("Error while uploading image $error");
        resetImage();
        return null;
      });
    }
    debugPrint("Image Uploaded");
    return imagePath;
  }


  Future<String?> uploadPostInTable(String? url,String text) async {
    debugPrint("Uploading Post in Post table");
    String? postId;
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    String description = text.toString().trim();
    debugPrint("Uploading Post in Post table");
    await _myhomeRepo.uploadPost(PostModel(
    postId: _auth.currentUser!.uid+time, 
    time: time, 
    description: description, 
    postedBy: _auth.currentUser!.uid, 
    likeList: [], 
    commentIdList: [], 
    imageLink: isPicked?url:"", 
    userProfileImage: _auth.currentUser?.photoURL ?? dummyMaleImage, 
    username: _auth.currentUser!.uid, 
    visibility: 1, 
    noOfBlocks: 0, 
    lastComment: "", 
    lastCommentedById: "", 
    lastCommentedByName: "", 
    lastCommentByImage: "")).then((value){
      postId = value;
    }).onError((error, stackTrace){
      debugPrint("Error in Upload Post in Post table $error");
    });
    return postId;
  }

  Future<bool?> updateInUserProfile(String postId) async {
    bool? res;
    await _myhomeRepo.updatePostInProfile(postId).then((value){
      res = value;
    });
    return res;
  }


void resetImage(){
    isPicked = false;
    webImage = null;
    _pickedImage = null;
    setLoading(false);
    notifyListeners();
  }

 Stream<List<PostModel?>> getUserFeed(){
    return _myhomeRepo.getUserFeedWithDetails();
  }
 Stream<UserProfileModel?> getUserProfile(String id){
    return _myhomeRepo.getUserData(id: id);
  }



Future addComment({required String comment,required String postId, bool isReplied = false, required String postedBy}) async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    String userId = _auth.currentUser!.uid;
    bool isAdded = false;
    await _myhomeRepo.commentOnPost(comment: Comment(id: time+userId, comment: comment, time:  time, postId: postId, commentedBy: userId, isEdited: false, isReplied: isReplied, isVisible: true, replies: [], report: [])).then((value) {
      debugPrint("Comment Added Successfully");
      isAdded = true;
    }).onError((error, stackTrace){
      debugPrint("Error in Adding Comment $error");
    });
    if(isAdded){
      await _myhomeRepo.sendNotification(ApiNotification(time: time, id: time+userId, sentToId: postedBy, sentByUsername: "", sentByName: "", sentByImage: "", sentById: userId, message: "Created Comment on your post ", type: NotificationType.comment, activityId: postId)).then((value){
        debugPrint("Notification Added Successfully");
      }).onError((error, stackTrace){
        debugPrint("Error in Adding Notification on Comment $error");
      });
    }
  }

  getFeedCommentList({required String postId}) async {
     return _myhomeRepo.getPostCommentList( postId: postId);
  }

  Future addLike({required String postId, required String postedBy}) async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    String userId = _auth.currentUser!.uid;
    bool isAdded = false;
    await _myhomeRepo.likeOnPost(postId: postId, postedById: _auth.currentUser!.uid).then((value){
      debugPrint("Like Added Successfully...");
      isAdded = true;
    }).onError((error, stackTrace){
      debugPrint("Error on Adding Like");
    });
    if(isAdded){
      debugPrint("Sending notification for like");
      await _myhomeRepo.sendNotification(ApiNotification(time: time, 
      id: time+userId, 
      sentToId: postedBy,
       sentByUsername: "", sentByName: "", sentByImage: "", sentById: userId, message: "Liked your post ", type: NotificationType.like, activityId: postId)).then((value){
        debugPrint("Notification Added Successfully for like");
      }).onError((error, stackTrace){
        debugPrint("Error in Adding Notification on like $error");
      });
    }
    debugPrint("Sent notification for like");
  }

  disLike({required String postId}) async {
    await _myhomeRepo.dislikeOnPost(postId: postId, postedById: _auth.currentUser!.uid).then((value){
      debugPrint("DisLike Added Successfully");
    }).onError((error, stackTrace){
      debugPrint("Error on Adding DisLike");
    });
  }


Stream<PostLikeModel?> getPostLikeListAPI({required String postId}){
  return _myhomeRepo.getPostLikeList(postId: postId);
}
Stream<PostCommentListModel?> getPostCommentListAPI({required String postId}){
  return _myhomeRepo.getPostCommentList(postId: postId);
}

Future updateProfile({required String name, required String username, required String gender, required String dob, required String about, required String mobile, required String email}) async {
await _myhomeRepo.updateProfileData(name: name, username: username, gender: gender, dob: dob, about: about, mobile: mobile, email: email);
}


}