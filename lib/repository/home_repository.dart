import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_web_app/globledata/global_value.dart';
import 'package:info_web_app/models/comment_model.dart';
import 'package:info_web_app/models/like_model.dart';
import 'package:info_web_app/models/notofication_model.dart';
import 'package:info_web_app/models/post_model.dart';
import 'package:info_web_app/models/profile_model.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseKey{
  static const String postKey = "post";
  static const String commentKey = "comment";
  static const String likeKey = "like";
  static const String userKey = "users";
  static const String reportPostKey = "reportPost";
  static const String reportCommentKey = "reportComment";
  static const String notificationKey = "notification";
  static const String userNotification = "userNotification";
}


class HomeRepository {
final FirebaseAuth _auth = FirebaseAuth.instance;
  final storePostRef = FirebaseFirestore.instance.collection(FirebaseKey.postKey);
  final storeUserRef = FirebaseFirestore.instance.collection(FirebaseKey.userKey);
  final storeReportPostRef = FirebaseFirestore.instance.collection(FirebaseKey.reportPostKey);
  final storeReportCommentRef = FirebaseFirestore.instance.collection(FirebaseKey.reportCommentKey);
  final storeCommentRef = FirebaseFirestore.instance.collection(FirebaseKey.commentKey);
  final storeLikeRef = FirebaseFirestore.instance.collection(FirebaseKey.likeKey);
  final storeNotificationRef = FirebaseFirestore.instance.collection(FirebaseKey.notificationKey);
  final storeUserNotificationRef = FirebaseFirestore.instance.collection(FirebaseKey.userNotification);



  //get all data of specific user 
  Stream<UserProfileModel?> getUserData({String? id}) {
     bool? res;
     String uid = id ?? _auth.currentUser!.uid;
     final followerStream =  storeUserRef.doc(uid).snapshots();
     return followerStream.map((DocumentSnapshot<Map<String, dynamic>> snapshot){
       // debugPrint("${snapshot.data()} is the response of get follower stream");
       UserProfileModel userProfileModel = UserProfileModel.fromJson(snapshot.data() as Map<String, dynamic>);
       return userProfileModel;
     });
  }

 //Follow user
  Future<bool?> followUser(String followingId) async {
    debugPrint("Follow User Called-----------------------------");
    if (followingId == _auth.currentUser!.uid) return false;

    try {
      final currentUserDoc = await storeUserRef.doc(_auth.currentUser!.uid).get();
      final followingUserDoc = await storeUserRef.doc(followingId).get();

      if (currentUserDoc.exists && followingUserDoc.exists) {
        var currentUserData = currentUserDoc.data() as Map<String, dynamic>;
        var followingUserData = followingUserDoc.data() as Map<String, dynamic>;

        UserProfileModel currentUserProfile = UserProfileModel.fromJson(currentUserData);
        UserProfileModel followingUserProfile = UserProfileModel.fromJson(followingUserData);

        List<String> followingList = [...currentUserProfile.followingList!];
        List<String> followerList = [...followingUserProfile.followerList!];

        // Check if the current user is already following the user
        if (followingList.contains(followingId)) {
          debugPrint("Already Followed");
          return false;
        }

        followingList.add(followingId);
        await storeUserRef.doc(_auth.currentUser!.uid).update({'followingList': followingList});

        // Check if the user is already in the follower list of the following user
        if (!followerList.contains(_auth.currentUser!.uid)) {
          followerList.add(_auth.currentUser!.uid);
          await storeUserRef.doc(followingId).update({'followerList': followerList});
        }

         String time = DateTime.now().millisecondsSinceEpoch.toString();

        // Sending Notification
        debugPrint("%%%%%%%%Going to send Notification%%%%%%%%%");
        await sendNotification(ApiNotification(
          type: NotificationType.follow,
          id: time+followingId,
          message: "You are being followed by ",
          sentById: _auth.currentUser!.uid,
          sentByImage: "",
          sentByName: _auth.currentUser!.displayName,
          sentByUsername: _auth.currentUser!.displayName,
          sentToId: followingId,
          time: time,
        ),
      );

        return true;
      } else {
        return false; // Handle the case where one of the documents doesn't exist
      }
    } catch (error) {
      debugPrint('Error in following user: $error');
      return false; // Return false in case of any error
    }
  }


////UnFollow user
  Future<bool?> unFollowUser(String followingId) async {
    if (followingId == _auth.currentUser!.uid) return false;

    try {
      final currentUserDoc = await storeUserRef.doc(_auth.currentUser!.uid).get();
      final followingUserDoc = await storeUserRef.doc(followingId).get();

      if (currentUserDoc.exists && followingUserDoc.exists) {
        var currentUserData = currentUserDoc.data() as Map<String, dynamic>;
        var followingUserData = followingUserDoc.data() as Map<String, dynamic>;

        UserProfileModel currentUserProfile = UserProfileModel.fromJson(currentUserData);
        UserProfileModel followingUserProfile = UserProfileModel.fromJson(followingUserData);

        // Update the current user's followingList
        currentUserProfile.followingList!.removeWhere((id) => id == followingId);
        await storeUserRef.doc(_auth.currentUser!.uid).update({'followingList': currentUserProfile.followingList});

        // Update the following user's followerList
        followingUserProfile.followerList!.removeWhere((id) => id == _auth.currentUser!.uid);
        await storeUserRef.doc(followingId).update({'followerList': followingUserProfile.followerList});

        return true;
      } else {
        return false; // Handle the case where one of the documents doesn't exist
      }
    } catch (error) {
      debugPrint('Error in unfollowing user: $error');
      return false; // Return false in case of any error
    }
  }

  Future<bool?> removeFollower(String followerId)async{

    try{
      final currentUserDoc = await storeUserRef.doc(_auth.currentUser!.uid).get();
      final followerUserDoc = await storeUserRef.doc(followerId).get();

      if(currentUserDoc.exists && followerUserDoc.exists){
       var curretUserData = currentUserDoc.data() as Map<String,dynamic>;
       var followerUserData = followerUserDoc.data() as Map<String,dynamic>;

        UserProfileModel currentUserProfile = UserProfileModel.fromJson(curretUserData);
        UserProfileModel followerUserProfile = UserProfileModel.fromJson(followerUserData);

        currentUserProfile.followerList!.removeWhere((id) => id == followerId);
        await storeUserRef.doc(_auth.currentUser!.uid).update({'followerList':currentUserProfile.followerList});

        followerUserProfile.followingList!.removeWhere((id) => id == _auth.currentUser!.uid);
        await storeUserRef.doc(followerId).update({'followingList':followerUserProfile.followerList});
   
        return true;
       
      }else{
        return false;
      }

     
    }  catch(error){
      debugPrint("Error in removing follower");
      return false;
    }
  }



//Search User
Future<List<UserProfileModel>> getUsersExceptCurrentUser() async {

  final QuerySnapshot<Map<String, dynamic>> snapshot =await getAllUsers().first;
    
  final List<UserProfileModel> users = snapshot.docs.map((doc){
     debugPrint("Fetched response is ----> ${doc.data()}");
     for (var i in snapshot.docs){
     debugPrint("User Id ------>   ${i.id}");
     }
    return UserProfileModel.fromJson(doc.data());
  }).toList();

  users.removeWhere((user) => user.uid == _auth.currentUser!.uid);

  return users;
}

 //for getting all users from firestore database
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return storeUserRef.where("id", isNotEqualTo: _auth.currentUser!.uid).snapshots();
  }


  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsersContain(String character) {
    return storeUserRef.where("id", isNotEqualTo: _auth.currentUser!.uid).snapshots();
  }

  Future<List<UserProfileModel>> searchUsers(String searchTerm) async {
  // Convert the searchTerm to lowercase for case-insensitive search
  debugPrint("Searching for $searchTerm");
  String searchTermLower = searchTerm;

  try {
    // Use Firestore query to search for users with matching usernames
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await storeUserRef
        .orderBy('name')
        .startAt([searchTermLower])
        .endAt(['$searchTermLower\uf8ff']) // '\uf8ff' is a Unicode character higher than any letter
        .get();

    // Print the actual query being executed
    debugPrint("Firestore Query: ${querySnapshot.docs.first.data().toString()}");

    // Convert query results to a list of UserProfileModel
    List<UserProfileModel> users = querySnapshot.docs
        .map((doc) {
          debugPrint("Data is ${doc.data()}");
          return UserProfileModel.fromJson(doc.data());
        })
        .toList();

    return users;
  } catch (error) {
    print('Error searching users: $error');
    // Handle the error as needed
    return [];
  }
}

Future sendNotification(ApiNotification notification) async {
      // Adding Notification in the Notification Table
      debugPrint("Going to send notification with value ${notification.toMap()}");
      await storeNotificationRef.doc(notification.id).set(notification.toMap()).then((value){}).onError((error, stackTrace){
        debugPrint("Error at top $error");
      });
      debugPrint(" sent notification with value ${notification.toMap()}");
      // Getting the List of Notification of the user 
      // final notificationSnaps =  await getNotification(notification.sentToId!);
      // if(notificationSnaps.exist){
          // final notifications = notificationSnaps.data() as Map<String, dynamic>;
          // NotificationList notificationList = NotificationList.fromJson(notifications);
          // notificationList.notificationIds!.add(notification.id!);
          try {
            await storeUserNotificationRef.doc(notification.sentToId).update({'notificationIds': FieldValue.arrayUnion([notification.id!])}).then((value){
            
          });
          } catch (e) {
            debugPrint("Document not get error $e");
            try {
              await storeUserNotificationRef.doc(notification.sentToId).set({'notificationIds': [notification.id!]}).then((value) {

            });
            } catch (e) {
              debugPrint("Still get error $e");
            }
          }
      // }
      // else {
      //   debugPrint("Doc not exist error ${notificationSnaps.}");
          
      // }
    
  }
  
  Future getNotification(String userId) async {
    final notification =  await storeUserNotificationRef.doc(userId).get();
    return notification;
  }

  Future<String?> uploadPostImageFile(Uint8List? pickedImage) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    String timeId = DateTime.now().microsecondsSinceEpoch.toString();
    debugPrint("Upload Image api called");
    Reference ref = FirebaseStorage.instance.ref('/post_images/$uid/$timeId');
    return await uploadFileWithReference(ref, pickedImage);
  }

  Future<String?> uploadProfileImage(Uint8List? pickedImage) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    debugPrint("Upload Profile Image api called");
    Reference ref = FirebaseStorage.instance.ref('/profile_image/$uid');
    return await uploadFileWithReference(ref, pickedImage);
  }

  // Upload image on given reference and image link will be return
  Future<String?> uploadFileWithReference(Reference ref, Uint8List? pickedImage)  async {
    UploadTask task = ref.putData(pickedImage!);
    String imUrl = "";
    await (await task).ref.getDownloadURL().then((value){
      debugPrint("Image url is $value");
      imUrl = value;
    }).onError((error, stackTrace){});
    debugPrint("Post Image url is:$imUrl");
    return imUrl;
  }

  Future<String?> uploadPost(PostModel model) async {
    String? postId;
    await storePostRef.doc(model.postId).set(model.toMap()).then((value) {
      postId = model.postedBy! + model.time.toString();
      debugPrint("Post Uploaded ${model.toMap().toString()} -----------");
    }).onError((error, stackTrace) {});

    return postId;
  }

  Future<bool?> updatePostInProfile(String postId) async {
    final userDoc = await storeUserRef.doc(_auth.currentUser!.uid).get();
    bool? res = false;
    if (userDoc.exists) {
      var doc = userDoc.data() as Map<String, dynamic>;
      UserProfileModel userProfileModel = UserProfileModel.fromJson(doc);
      userProfileModel.postList!.add(postId);
      await storeUserRef.doc(_auth.currentUser!.uid).update({'postList': userProfileModel.postList!}).then((value) {
        res = true;
      }).onError((error, stackTrace) {});
    }
    return res;
  }



Stream<PostModel?> getCurrentPostDetails(String postId) {
    final postSnapshots = storePostRef.doc(postId).snapshots();
    return postSnapshots.map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      PostModel post = PostModel.fromJson(snapshot.data() as Map<String, dynamic>);
      return post;
    });
  }

  Stream<List<PostModel>> getUserFeedWithDetails() {
    String uid = _auth.currentUser!.uid;
    final followerStream = storeUserRef.doc(uid).snapshots();
    debugPrint("Fetching followerStream for user: $uid");

    return followerStream.asyncMap((DocumentSnapshot<Map<String, dynamic>> snapshot) async {
      UserProfileModel userProfileModel = UserProfileModel.fromJson(snapshot.data()!);
      // debugPrint( "Fetched following ids: ${userProfileModel.followingList!.length}");
      // debugPrint("Following ids are: ${userProfileModel.followingList}");

      List<PostModel> posts = [];
      List<String> postIdList = [];
      if(userProfileModel.postList!.isNotEmpty){
        postIdList.addAll(userProfileModel.postList!);
      }

      for (String followingId in userProfileModel.followingList ?? []) {
        final followingsSnapshot = await storeUserRef.doc(followingId).get();
        if (followingsSnapshot.exists) {
          UserProfileModel followingUserProfile = UserProfileModel.fromJson(followingsSnapshot.data()!);
          // debugPrint("Fetching posts for user: $followingId");


          if(followingUserProfile.postList!.isNotEmpty){
            postIdList.addAll(followingUserProfile.postList!);
          }

        }
        else {
          debugPrint("Error in followingsSnapshot ${followingsSnapshot.reference}");
        }
      }
      try{
        for (String postId in postIdList) {
        debugPrint("Fetching details of postId $postId");
        final postSnapshot = await storePostRef.doc(postId).get();
        if (postSnapshot.exists) {
          // debugPrint( "Fetched Post Details for user $followingId, post ID $postId are ${postSnapshot.data()!}");
          try{
            PostModel thisPost = PostModel.fromJson(postSnapshot.data()!);
            //Use this method for adding post when post List is empty
            if (posts.isNotEmpty) {
              posts.add(thisPost);
              debugPrint("Post Added!");
            } 
             //Use this method for adding post when post List is not empty
            else {
              posts = [thisPost];
            }
          } catch(e){
            debugPrint("Error in adding data $e");
          }

        } else {
          debugPrint('Error during fetching feed data ${postSnapshot.data()}');
        }
      }} catch (e){
        debugPrint("Error While Fetching post $e");
      }
      // debugPrint("Fetched ${posts.length} posts");
      posts.sort((a, b) {
        int aTime = int.parse(a.time!);
        int bTime = int.parse(b.time!);
        return aTime >= bTime? 0:1; // For descending order (latest first)
        // For ascending order (oldest first): return timeA.compareTo(timeB);
      });
      return posts;
    });
  }



Future commentOnPost({required Comment comment}) async {
    final commentList = await getCommentSnap(comment.postId!);
    bool isCommentAdded = false;
    if (commentList.exists) {
      // debugPrint("Likes list is $likes");
      await storeCommentRef.doc(comment.postId).update({'postCommentList': FieldValue.arrayUnion([comment.toJson()])}).then((value) {
        // debugPrint("Post Updated SuccessFully");
        isCommentAdded = true;
      }).onError((error, stackTrace) {
        // debugPrint("Error while updating like in post");
      });
      if(isCommentAdded) {
        await updateLastCommentOnPost(postId: comment.postId!, time: comment.time!, commentedById: comment.commentedBy!, lastComment: comment.comment!);
        await storePostRef.doc(comment.postId).update({'commentList': FieldValue.arrayUnion([comment.toJson()])});
      }
      debugPrint("${commentList.data()}");
    }
    else{
      debugPrint("Either it is a first comment or comment table not exist");
      await storeCommentRef.doc(comment.postId).set({'postCommentList': FieldValue.arrayUnion([comment.toJson()])}).then((value) {
        debugPrint("Comment Updated SuccessFully");
        isCommentAdded = true;
      }).onError((error, stackTrace) {
        debugPrint("Error while updating comment in post");
      });

      if(isCommentAdded ){
        await updateLastCommentOnPost(postId: comment.postId!, time: comment.time!, commentedById: comment.commentedBy!, lastComment: comment.comment!);
        await storePostRef.doc(comment.postId).update({'commentList': FieldValue.arrayUnion([comment.toJson()])});
      }
    }
  }

  Future updateLastCommentOnPost({required String postId,required String commentedById, required String lastComment, required String time}) async {
    await storePostRef.doc(postId).update({'lastComment' : lastComment, 'lastCommentedById' : commentedById, 'lastCommentedByName':time}).then((value){
      debugPrint("Updated Last comment on Post $postId");
    }).onError((error, stackTrace){
      debugPrint("Error in Update Last comment on Post $postId error is $error");
    });
  }

  getCommentSnap(String postId) async {
    final commentList = await storeCommentRef.doc(postId).get();
    return commentList;
  }


Future likeOnPost({required String postId, required String postedById}) async {
    final postLikeList = await storePostRef.doc(postId).get();
    bool isAdded = false;
    if (postLikeList.exists) {
      // To map method will add the userId in the likes list and return an updated List in map
      await storePostRef.doc(postId).update({
        'likeList' : FieldValue.arrayUnion([postedById]),}).then((value) {
        debugPrint("Like added Successfully");
        isAdded = true;
      }).onError((error, stackTrace) {
        debugPrint("Error while updating like in post $error");
        isAdded = false;
      });
      // debugPrint("${postLikeList.data()}");
    } else {

      debugPrint("Either first time like or Error while getting the likes list ${postLikeList.reference}");
      await storePostRef.doc(postId).set({
        'postLikeList' : FieldValue.arrayUnion([postedById]),}).then((value) {
        debugPrint("Like added Successfully");
        isAdded = true;
      }).onError((error, stackTrace) {
        debugPrint("Error while updating like in post $error");
        isAdded = false;
      });
    }

    if(isAdded){
      addLikeInLikeTable(postId: postId, likedById: _auth.currentUser!.uid);
    }
  }
 
  Future addLikeInLikeTable({required String postId, required String likedById}) async {
    final likeSnaps = await storeLikeRef.doc(postId).get();
    if(likeSnaps.exists){
      await storeLikeRef.doc(postId).update({'likeList':FieldValue.arrayUnion([likedById])});
    }
    else {
      await storeLikeRef.doc(postId).set({'likeList':FieldValue.arrayUnion([likedById])});
    }
  }
  
  Future dislikeOnPost({required String postId, required String postedById}) async {
    final postLikeList = await storePostRef.doc(postId).get();
    bool isDisliked = false;
    if (postLikeList.exists) {
      // To map method will add the userId in the likes list and return an updated List in map
      await storePostRef.doc(postId).update({
        'postLikeList' : FieldValue.arrayRemove([postedById]),}).then((value) {
        debugPrint("Like Removed Successfully");
        isDisliked = true;
      }).onError((error, stackTrace) {
        debugPrint("Error while updating like in post $error");
      });
      // debugPrint("${postLikeList.data()}");
    } else {
      debugPrint(
          "Error while getting the likes list ${postLikeList.reference}");
    }
    if(isDisliked){
      deleteLikeInLikeTable(postId: postId, likedById: _auth.currentUser!.uid);
    }
  }

  Future deleteLikeInLikeTable({required String postId, required String likedById}) async {
    final likeSnaps = await storeLikeRef.doc(postId).get();
    if(likeSnaps.exists){
      await storeLikeRef.doc(postId).update({'likeList':FieldValue.arrayRemove([likedById])});
    }
    else {
      await storeLikeRef.doc(postId).set({'likeList':FieldValue.arrayRemove([likedById])});
    }
  }


Stream<PostCommentListModel?> getPostCommentList({required String postId}) {
    final commentStream =  storeCommentRef.doc(postId).snapshots();
    return commentStream.map((DocumentSnapshot<Map<String, dynamic>> snapshot){
      // debugPrint("Data is ${snapshot.data()}");
      PostCommentListModel postCommentListModel = PostCommentListModel.fromJson(snapshot.data()!);
      return postCommentListModel;
    });
  }


Stream<PostLikeModel?> getPostLikeList({required String postId}) {
    final commentStream =  storeLikeRef.doc(postId).snapshots();
    return commentStream.map((DocumentSnapshot<Map<String, dynamic>> snapshot){
      debugPrint("Data of Like is ${snapshot.data()}");
      PostLikeModel model = PostLikeModel.fromJson(snapshot.data()!);
      return model;
    });
  }

  // Stream<PostCommentListModel?> getPostCommentList({required String postId}) {
  //   final commentStream =  storeCommentRef.doc(postId).snapshots();
  //   return commentStream.map((DocumentSnapshot<Map<String, dynamic>> snapshot){
  //     // debugPrint("Data is ${snapshot.data()}");
  //     PostCommentListModel postCommentListModel = PostCommentListModel.fromJson(snapshot.data()!);
  //     return postCommentListModel;
  //   });
  // }

updateProfileData({required String name,required String username,required String gender,
required String dob,required String about,required String mobile,required String email}) 
async {
String uid = _auth.currentUser!.uid;
await storeUserRef.doc(uid).update({
'name': name,
'username': username,
'gender': gender,
'dob': dob,
'about': about,
'mobile': mobile,
'email': email
});
}




}




