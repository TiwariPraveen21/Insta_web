import 'package:flutter/material.dart';
import 'package:info_web_app/res/common_components/app_string.dart';
import 'package:info_web_app/res/custom_widget/onboarding/common_textfield.dart';
import 'package:info_web_app/res/provider/auth_forms.dart';
import 'package:info_web_app/res/provider/password_provider.dart';
import 'package:info_web_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  final double? width1;
  final margin1;
 const SignUpForm({super.key, this.width1, this.margin1});

  @override
  Widget build(BuildContext context) {
   
    final passwordVisibilityProvider = Provider.of<PasswordVisibilityProvider>(context);
    final authProvider = Provider.of<FirebaseAuthProvider>(context);
    return Consumer<FirebaseAuthProvider>(
      builder: (context,authprovider, ch) {
        return Container(
          margin: margin1,
          width: width1,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.signup,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 7, 99, 198),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      AppStrings.namemail,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 41)),
                CommonTextField(
                  controller: authProvider.emailCont,
                  focusNode: authProvider.emailfocusNode,
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  hintText: AppStrings.username,
                  prefixIcon: const Icon(
                    Icons.mail_outline_outlined,
                    color: Color.fromARGB(255, 7, 99, 198),
                  ),
                  formvalidator: (val) {
                    if (authProvider.emailCont.text.isEmpty) {
                      return AppStrings.mailempt;
                    }
                    if (!RegExp(AppStrings.mailregex)
                        .hasMatch(authProvider.emailCont.text)) {
                      return AppStrings.mailerr;
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    authProvider.emailfocusNode.unfocus();
                    FocusScope.of(context).requestFocus(authProvider.passwordFocusNode);
                  },
                ),

                const Padding(padding: EdgeInsets.only(top: 20)),
                CommonTextField(
                  controller: authProvider.passCont,
                  focusNode: authProvider.passwordFocusNode,
                  obscureText: !passwordVisibilityProvider.isPasswordVisible,
                  textInputAction: TextInputAction.done,
                  hintText: AppStrings.passhint,
                  labelText: AppStrings.passlabel,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 7, 99, 198),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisibilityProvider.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      passwordVisibilityProvider.togglePasswordVisibility();
                    },
                  ),
                  formvalidator: (val) {
                    if (authProvider.passCont.text.isEmpty) {
                      return AppStrings.passempt;
                    }
                    if (!RegExp(AppStrings.passregex)
                        .hasMatch(authProvider.passCont.text)) {
                      return AppStrings.passerr;
                    }
                    return null;
                  },
                ),

                const Padding(padding: EdgeInsets.only(top: 20)),

                   CommonTextField(
                  controller: authProvider.conPassCont,
                  focusNode: authProvider.conPasswordFocusNode,
                  obscureText: !passwordVisibilityProvider.isPasswordVisible,
                  textInputAction: TextInputAction.done,
                  hintText: AppStrings.confirmpasshint,
                  labelText: AppStrings.passlabel,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 7, 99, 198),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisibilityProvider.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      passwordVisibilityProvider.togglePasswordVisibility();
                    },
                  ),
                  formvalidator: (val) {
                    if (authProvider.conPassCont.text !=  authProvider.passCont.text) {
                      return AppStrings.passmatch;
                    }
                    return null;
                  },
                ),

                const Padding(padding: EdgeInsets.only(top: 20)),

                //signup button
                GestureDetector(
                  onTap: () async{
                   await authProvider.checkUser(context).then((value){
                     Provider.of<AuthFormProvider>(context,listen: false).switchToLogin();
                   }).onError((error, stackTrace){
                     debugPrint(error.toString());
                   });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 19, 132, 253),
                        borderRadius: BorderRadius.circular(15)),
                    child:Center(
                      child: (authprovider.loading == true)?const CircularProgressIndicator(color: Colors.white,):const Text(
                        AppStrings.signup,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                //End of button

                const Padding(padding: EdgeInsets.only(top: 20)),
                
                const Padding(padding: EdgeInsets.only(top: 30)),
                GestureDetector(
                  onTap: () {
                    Provider.of<AuthFormProvider>(context,listen: false).switchToLogin();
                  },
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: AppStrings.alreadyAccount,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    TextSpan(
                        text: AppStrings.logIn,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 7, 99, 198),
                          color: Color.fromARGB(255, 7, 99, 198),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ))
                  ])),
                )
              ],
            ),
          ),
        );
      }
    );
  }

}
