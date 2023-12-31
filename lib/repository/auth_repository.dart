import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_web_app/globledata/global_value.dart';
import 'package:info_web_app/models/profile_model.dart';

class FirebaseApi {
  FirebaseAuth auth = FirebaseAuth.instance;

  //signup Using Email Id and password
  Future<bool?> registerUserWithEmailPassword(
      String email, String password, BuildContext context) async {
    bool? res = false;
    UserCredential? userCredential;

    debugPrint("Register Using email --> $email and password --> $password");
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
          userCredential = value;
      debugPrint("Success SignUp");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("SignUp Successfully")));
      if (userCredential != null) {
        final time = DateTime.now().millisecondsSinceEpoch.toString();

        String uid = userCredential!.user!.uid;
        UserProfileModel newUser = UserProfileModel(
          uid: uid,
          image: dummyMaleImage,
          name: uid,
          email: userCredential!.user!.email,
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
          res = true;
        });
      }
    }).onError((error, stackTrace) {
      debugPrint("Error While SignUp $error");
      res = false;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Create Account Error: $error")));
    });
    return res;
  }

  Future<bool?> isLogin() async {
    bool? res;
    res = auth.currentUser != null;
    return res;
  }

  Future getEmail() async {
    return auth.currentUser!.email ?? "";
  }

  Future<bool?> logOut() async {
    bool? res;
    await auth.signOut().then((value) {
      debugPrint("Logout Success");
      res = true;
    }).onError((error, stackTrace) {
      res = false;
    });
    return res;
  }

//Method to send otp
  Future<String?> sendOtp(String phoneNumber) async {
    String? res;
    debugPrint("Going to send otp on $phoneNumber");
    await auth.verifyPhoneNumber(
        phoneNumber: "+91$phoneNumber",
        verificationCompleted: (_) {
          debugPrint("Verification is completed");
        },
        verificationFailed: (e) {
          debugPrint("Error while sending otp $e");
        },
        codeSent: (String verificationId, int? token) {
          debugPrint("Verification code is $verificationId");
          res = verificationId;
        },
        codeAutoRetrievalTimeout: (e) {
          debugPrint("Error is $e");
        });
    debugPrint("OTP sent Success $res");
    return res;
  }

  // Method to verifyOtp
  Future<bool?> verifyOtp(String verification, String otp) async {
    bool? res;
    final  credential = PhoneAuthProvider.credential(
        verificationId: verification, smsCode: otp);
    await auth.signInWithCredential(credential).then((value) async {
      debugPrint("OTP Matched response is $value");
      res = true;
      
      if (value != null) {
        final time = DateTime.now().millisecondsSinceEpoch.toString();

        String uid = value.user!.uid;
        UserProfileModel newUser = UserProfileModel(
          uid: uid,
          image: time,
          name: uid,
          email: uid,
          pass: "",
          gender: "Not Specified",
          joinDate: time,
          username: uid,
          postList: [],
          followerList: [],
          followingList: [],
          mobile: value.user!.phoneNumber,
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
    }).onError((error, stackTrace) {
      debugPrint("Failed Matching OTP $error");
      res = false;
    });
    return res;
  }

//Methos to forgot password
  Future<bool?> forgetPassword(String email) async {
    bool? res;
    await auth.sendPasswordResetEmail(email: email).then((value) {
      res = true;
    }).onError((error, stackTrace) {});
    return res;
  }

//Methos to login using email password
  Future<bool?> loginUsingEmailAndPassword(
      String email, String password) async {
    bool? res;
    debugPrint("Email :$email \n Password: $password");
    await auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      debugPrint("Response is $value");
      res = true;
    }).onError((error, stackTrace) {
      res = false;
      debugPrint("Error is $error");
    });
    return res;
  }

}
