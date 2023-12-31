import 'package:flutter/material.dart';
import 'package:info_web_app/repository/auth_repository.dart';
import 'package:info_web_app/view_model/services/google_service.dart';

class FirebaseAuthProvider extends ChangeNotifier {
  //int _authStateIndex = 0;
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController conPassCont = TextEditingController();
  final TextEditingController phoneNumberCont = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  
  final FocusNode emailfocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
   final FocusNode conPasswordFocusNode = FocusNode();
   final FocusNode otpFocusNode = FocusNode();
  final FocusNode buttonFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();

  @override
  void dispose() {
    emailCont.dispose();
    passCont.dispose();
    phoneNumberCont.dispose();
    otpController.dispose();
    emailfocusNode.dispose();
    passwordFocusNode.dispose();
    buttonFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    super.dispose();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool val) async {
    _loading = val;

    notifyListeners();
  }

// Created Object of class FireBaseAPI class
  final FirebaseApi _api = FirebaseApi();

// Create account using Email Id and Password
Future<bool?> checkUser(BuildContext context) async {
    String email =  emailCont.text.trim();
    String password = passCont.text.trim();
    String cpassword = conPassCont.text.trim();
    bool? res;
    if (email == "" || password == "" || cpassword == "") {
      debugPrint("Please fill all the remaining feilds");
      // Utils.showAlertDialog(
      //     context, "Error", "Please fill all the remaining feilds");
    } else if (password != cpassword) {
      debugPrint("Password doesn't match");
      // Utils.showAlertDialog(context, "Error", "Password doesn't match");
    } else {
      // print("Data uploading....");
      await createAccount(context,email,password).then((value){
          res = value;
      });
    }
    return res;
  }

  Future createAccount(BuildContext context,String email,String password) async {
    setLoading(true);
    bool? res;
    debugPrint("Email is $email password is $password");
    await _api.registerUserWithEmailPassword(email, password, context).then((value) {
      if (value == true) {
        debugPrint("Register Success");
        emailCont.text = "";
        passCont.text = "";
        res = value;
      }
      
    }).onError((error, stackTrace) {
      debugPrint("Register Failed!");
      res = false;
      //CustomToast(context: context, message: "Create Account Error $error");
    });
    setLoading(false);
    return res;
  }

  getEmail() async {
    return await _api.getEmail();
  }
  
// Logout User
  Future<bool?> logout(VoidCallback? onTap) async {
    bool? res;
    debugPrint("Going to logout Provider");
    setLoading(true);
    await _api.logOut().then((value) {
      if (value == true) {
        res = value;
        if (onTap != null) onTap();
      } else {
        debugPrint("Error -->$value");
      }
    }).onError((error, stackTrace) {
      debugPrint("Error $error");
    });
    setLoading(false);
    return res;
  }

//Method to send otp
  static String? verificationCode;
  Future<bool?> sendOtp() async {
    String phoneN = phoneNumberCont.text.toString().trim();
    bool? res;
    setLoading(true);
    await _api.sendOtp(phoneN).then((value) {
      verificationCode = value;
      res = true;
    }).onError((error, stackTrace) {});
    setLoading(false);
    return res;
  }

  Future<bool?> verifyOtp() async {
    bool? res;
    String otp = otpController.text.toString().trim();
    setLoading(true);
    debugPrint("Verify OTP");
    if (otp.length < 6) return res;
    await _api.verifyOtp(verificationCode ?? "", otp).then((value) {
      res = value;
    }).onError((error, stackTrace) {
      debugPrint("Error while verify otp $error");
    });
    setLoading(false);
    return res;
  }

  Future<bool?> forgetPassword() async {
    bool? res;
    String email = emailCont.text.toString().trim();
    setLoading(true);
    await _api.forgetPassword(email).then((value) {
      res = true;
      debugPrint("Success in sending otp to the mail for forget password");
    }).onError((error, stackTrace) {
      debugPrint("Error while sending forget Password otp send");
    });
    setLoading(false);
    return res;
  }

  Future<bool?> loginUsingEmailAndPassword(BuildContext context) async {
    setLoading(true);
    String email = emailCont.text.toString().trim();
    String password = passCont.text.toString().trim();
    bool? res;
    await _api.loginUsingEmailAndPassword(
      email,
      password,
    ).then((value) {
      res = value;
      if (value == true) {
        debugPrint("Login Success Using Email and Password");
        emailCont.text = "";
        passCont.text = "";
      } else {
        debugPrint("Login failed! Using Email and Password");
      }
    }).onError((error, stackTrace) {});
    setLoading(false);
    return res;
  }

  GoogleAuthService service = GoogleAuthService();
  Future<bool?> googleLogin() async {
    bool? res;
    await GoogleAuthService.handleSignIn().then((value) {
      debugPrint("Google Login Success");
      emailCont.text = "";
      passCont.text = "";
      res = true;
    }).onError((error, stackTrace) {
      debugPrint("Google Login Failed!");
      res = false;
    });
    return res;
  }
}