import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:info_web_app/models/comment_model.dart';
import 'package:info_web_app/models/like_model.dart';
import 'package:info_web_app/models/profile_model.dart';
import 'package:info_web_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class Utils {

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static errorMessage(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 3,
    gravity: ToastGravity.TOP_LEFT
    
    );
  }



  static snakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  //This is used to shift the control from one text field to its next one when we hit Enter on clkick done from keyboard
  static void fieldFocusChange(
      BuildContext context, FocusNode currFocus, FocusNode nextFocus) {
    currFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

//Loader
  static void showLoadingDialog(BuildContext context, String title) {
    AlertDialog loadingDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      //backgroundColor: AppColor.bkgroundClr,
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            //Lottie.asset('assets/images/loading_cat.json'),
            const SizedBox(
              height: 30,
            ),
            Text(title),
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return loadingDialog;
        });
  }

  static void showAlertDialog(BuildContext context, String title, String content, Function() ontap, String buttontext) {
    AlertDialog alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      //backgroundColor: AppColor.bkgroundClr,
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
        TextButton(onPressed: ontap, child: Text(buttontext)),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }



static void showUserSearchDialog(BuildContext context, List<UserProfileModel> users,Future<bool?> Function(String) onTapCallback) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title:const Text('User Search Results'),
        content: SizedBox(
          width: 500,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Adjust border color as needed
                  borderRadius:const BorderRadius.all(Radius.circular(8.0))),
                   margin:const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.grey)
                    ),
                    child:const Center(
                      child:Icon(Icons.person,color:Colors.grey,),
                    ),
                  ),
                  trailing:InkWell(
                    onTap: () {
                      onTapCallback(user.uid!);
                    },
                    child: const Icon(Icons.person_add_alt)),
                  title: Text(user.email ?? 'Unknown'),
                  subtitle: Text(user.username ?? 'No profile'),
                  // onTap: () {
                  //   // Handle the user tap, you can navigate to the user's profile or perform any other action
                  //   // Example: Navigator.pushNamed(context, '/user_profile', arguments: user.id);
                  // },
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child:const Text('Close'),
          ),
        ],
      );
    },
  );
}

static void showCommentListBottomSheet( BuildContext context,List<Comment>? commentData,) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(         
          padding: const EdgeInsets.all(16),
          child:ListView.builder(
              itemCount: commentData!.length,
              itemBuilder:(context, index) {
               return ListTile(
                leading: const CircleAvatar(),
                title: Text(commentData[index].commentedBy!),
                subtitle: Text(commentData[index].comment!),
               );
            })
        );
      },
    );
  }

  static void showLikeListBottomSheet(BuildContext context, postId){
    showModalBottomSheet(context: context, builder:(
      BuildContext context) {
      return Consumer<HomeViewModel>(
        builder: (context,likeProvider,child) {
          return StreamBuilder<PostLikeModel?>(
            stream: likeProvider.getPostLikeListAPI(postId: postId),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data!.likeList!.length,
                itemBuilder:(context, index) {
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ListTile(
                    title: Text("${snapshot.data!.likeList![index]} ❤️Liked Your Post"),
                   ),
                 );
              });
            }
          );
        }
      );
    });
  }



// static void showUserSearchPopupMenu(
//     BuildContext context, List<UserProfileModel> users, Future<bool?> Function(String) onTapCallback) {
//   showMenu(
//     context: context,
//     position: const RelativeRect.fromLTRB(0, 100, 0, 0),
//     items: users.map((user) {
//       return PopupMenuItem<String>(
//         value: user.uid!,
//         child: Container(
//           width: 300,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           margin: const EdgeInsets.symmetric(vertical: 4.0),
//           padding: const EdgeInsets.all(5),
//           child: ListTile(
//             leading: Container(
//               width: 35,
//               height: 35,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(7),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: const Center(
//                 child: Icon(Icons.person, color: Colors.grey),
//               ),
//             ),
//             trailing: InkWell(
//               onTap: () async {
//                 await onTapCallback(user.uid!);
//                 Navigator.pop(context); // Close the menu after selection
//               },
//               child: const Icon(Icons.person_add_alt),
//             ),
//             title: Text(user.name ?? 'Unknown'),
//             //subtitle: Text(user.username ?? 'No profile'),
//             onTap: () async {
//               await onTapCallback(user.uid!);
//               Navigator.pop(context); // Close the menu after selection
//             },
//           ),
//         ),
//       );
//     }).toList(),
//     elevation: 8.0,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//   );
}




class DeBouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  DeBouncer({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(
      Duration(milliseconds: milliseconds),
      action,
    );
  }
  
}
