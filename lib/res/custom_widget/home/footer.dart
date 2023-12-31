import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_web_app/res/custom_widget/home/appImage_string.dart';
import 'package:info_web_app/res/custom_widget/home/home_color.dart';
import 'package:info_web_app/res/custom_widget/home/home_style.dart';
import 'package:info_web_app/res/custom_widget/home/home_feed_string.dart';


class HomePageFooter extends StatelessWidget {
  const HomePageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor
        ) ,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(spacing: 10,runSpacing: 7,
              children: [
                Text("Privacy Policy",style:AppStyle.fourOneFourUnderLineTs,),
                Text("About Us",style:AppStyle.fourOneFourUnderLineTs,),
                Text("Contact Us",style:AppStyle.fourOneFourUnderLineTs,),
                Text("Terms & Conditions",style:AppStyle.fourOneFourUnderLineTs,),
                Text("FAQs",style:AppStyle.fourOneFourUnderLineTs,)
              ],
            ),
            const SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    AppStrings.featureHeadingFooter,
                    style:  AppStyle.fontSixTwoZeroWhiteTs
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                    AppStrings.viewFeedsFooter,
                    style:  AppStyle.fourOneFouroffWhiteColTs
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    AppStrings.makeConnectionFooter,
                    style: AppStyle.fourOneFouroffWhiteColTs
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    AppStrings.createCompanies,
                    style: AppStyle.fourOneFouroffWhiteColTs
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    AppStrings.mobileApp,
                    style:  AppStyle.fourOneFouroffWhiteColTs
                ),
              ],
            ),

            const SizedBox(height: 20,),
            Container(
                constraints: const BoxConstraints(
                    maxWidth: 154
                ),
                child: Image.asset(AppImages.infoProfFooterLogo,)),
            const SizedBox(height: 10,),
            Text("Not a  normal app, its unique!",
              style: GoogleFonts.poppins(
                textStyle:const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1) ,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,

                ),
              ),),
            Text("Services are provided everywhere.",
              style: GoogleFonts.poppins(
                textStyle:const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1) ,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,

                ), ),),
            const SizedBox(height: 20,),
            Container(
                constraints: const BoxConstraints(
                    maxWidth: 154
                ),
                child: Image.asset(AppImages.socialMedia,))
          ],),
      ),
    );
  }

}
