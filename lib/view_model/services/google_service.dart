import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:info_web_app/models/profile_model.dart';
import 'package:info_web_app/repository/auth_repository.dart';

class AuthServices {
  Future isUserAlreadyLogin() async {
    bool? res;
    res = await FirebaseApi().isLogin();
    return res;
  }
}

class GoogleAuthService {

  //gooogle signin
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static Future<User?> handleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        // User canceled the sign-in process
        return null;
      }

      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
       UserCredential ? authResult ;
     await _auth.signInWithCredential(credential).then((value) {
        authResult = value;
      }).onError((error, stackTrace){
        debugPrint(error.toString());
      });
      User? user = authResult!.user;

     if (user != null) {
        final time = DateTime.now().millisecondsSinceEpoch.toString();
        String uid = authResult!.user!.uid;
        UserProfileModel newUser = UserProfileModel(
          uid: uid,
          image: authResult!.user!.photoURL,
          name:authResult!.user!.displayName,
          email:authResult!.user!.email,
          pass: "",
          gender: "Not Specified",
          joinDate: time,
          username: uid,
          postList: [],
          followerList: [],
          followingList: [],
          mobile: "",
        );
        //Also update chat user model in firebase
        await FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            .set(newUser.toMap())
            .then((value) {
          debugPrint("New User created");
          // Navigator.popUntil(context, ModalRoute.withName('login'));
          // Navigator.pushNamed(context, RoutesName.completeProfile, arguments: {
          //   'chatuser': newUser,
          //   'firebaseUser': userCredential!.user
          // });
        }).onError((error, stackTrace) {});
      }

      debugPrint("My Email Address is ${user!.email}");
      return user;
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }
}

