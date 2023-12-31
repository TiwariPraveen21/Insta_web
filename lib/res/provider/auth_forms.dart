import 'package:flutter/material.dart';

enum AuthFormType {
  login,
  signup,
  mobileLogin,
  forgotPassword,
  verifyOtp
}

class AuthFormProvider with ChangeNotifier {
  AuthFormType _currentForm = AuthFormType.login;

  AuthFormType get currentForm => _currentForm;

  void switchToLogin() {
    _currentForm = AuthFormType.login;
    notifyListeners();
  }

  void switchToSignup() {
    _currentForm = AuthFormType.signup;
    notifyListeners();
  }
  void switchToMobileLogin(){
    _currentForm = AuthFormType.mobileLogin;
    notifyListeners();
  }

  void switchToForgotPassword() {
    _currentForm = AuthFormType.forgotPassword;
    notifyListeners();
  }

  void switchToVerifyOTP(){
    _currentForm = AuthFormType.verifyOtp;
    notifyListeners();
  }
}
