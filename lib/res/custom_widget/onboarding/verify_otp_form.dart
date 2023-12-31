import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_web_app/res/common_components/app_string.dart';
import 'package:info_web_app/res/custom_widget/onboarding/common_textfield.dart';
import 'package:info_web_app/res/provider/auth_forms.dart';
import 'package:info_web_app/res/routes/app_route_constants.dart';
import 'package:info_web_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class VerifyOTP extends StatelessWidget {
  final double? width1;
  final margin1;
  const VerifyOTP({super.key, this.width1, this.margin1});

  @override
  Widget build(BuildContext context) {
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
                      AppStrings. otpVerification,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 7, 99, 198),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      AppStrings.otpNumber,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 41)),
                CommonTextField(
                  controller: authProvider.otpController,
                  focusNode: authProvider.otpFocusNode,
                  obscureText: false,
                  textInputAction: TextInputAction.done,
                  hintText: AppStrings.otpVerify,
                  prefixIcon: const Icon(
                    Icons.phone_iphone_outlined,
                    color: Color.fromARGB(255, 7, 99, 198),
                  ),
                ),

                const Padding(padding: EdgeInsets.only(top: 20)),

                //verify button
                GestureDetector(
                  onTap: () async{
                    await authProvider.verifyOtp().then((value){
                    //  Provider.of<AuthFormProvider>(context,listen: false).switchToVerifyOTP();
                    if(value == true){
                    context.goNamed(MyAppRouteConstants.page2RouteName);
                    }
                    }).onError((error, stackTrace) {
                     debugPrint(error.toString());
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 19, 132, 253),
                        borderRadius: BorderRadius.circular(15)),
                    child:Center(
                      child:(authprovider.loading == true)?const CircularProgressIndicator(color: Colors.white):const Text(
                        AppStrings.verify,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
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
