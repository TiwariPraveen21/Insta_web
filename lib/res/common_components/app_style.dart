import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_web_app/res/common_components/app_color.dart';

 class AppStyle {
//   // Bold, 16, whiteBold
//   static TextStyle get whiteBold16 {
//     return const TextStyle(
//       color: AppColors.white,
//       fontSize: 14,
//       fontWeight: FontWeight.w700,
//     );
//   }

//   static TextStyle get blackBold16 {
//     return const TextStyle(
//       color: AppColors.black,
//       fontSize: 14,
//       fontWeight: FontWeight.w700,
//     );
//   }

//   static TextStyle get blackBold24 {
//     return const TextStyle(
//       color: AppColors.black,
//       fontSize: 22,
//       fontWeight: FontWeight.w700,
//     );
//   }

//   static TextStyle get greyRegular20 {
//     return const TextStyle(
//       color: AppColors.grey,
//       fontSize: 18,
//       fontWeight: FontWeight.w400,
//     );
//   }

//   static TextStyle get blackMedium16 {
//     return const TextStyle(
//       color: AppColors.black,
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//     );
//   }

//   // Bold, 14, grey Medium
//   static TextStyle get greyMedium14 {
//     return const TextStyle(
//       color: AppColors.grey,
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//     );
//   }

//   static TextStyle loginTS = const TextStyle(
//       color: AppColors.primaryColor, // Text color
//       fontSize: 16.0, // Font size
//       fontWeight: FontWeight.bold, // Font weight
//       fontFamily: 'Poppins' // Font family
//   );
//   static TextStyle custompoppinTs = GoogleFonts.poppins(
//     textStyle: const TextStyle(
//       fontSize: 28,
//       fontWeight: FontWeight.w700,
//       letterSpacing: 0.5,
//       color: AppColors.primaryColor,
//     ),
//   );
//   static TextStyle custompoppinNormalTs = GoogleFonts.poppins(
//     textStyle: const TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: AppColors.blackNormalTextColor,
//     ),
//   );
//   static TextStyle custompoppinGreyNormalTs = GoogleFonts.poppins(
//     textStyle: const TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//       color: AppColors.greyNormalTextColor,
//     ),
//   );
//   static TextStyle forgetPassTs = GoogleFonts.poppins(
//       textStyle: const TextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.w500,
//         color: AppColors.darkblackTextColor,
//       ));
//   static TextStyle loginButtonTs = GoogleFonts.poppins(
//       textStyle: const TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.w700,
//         color: AppColors.logincardColor,
//       ));
//   static TextStyle orTs = GoogleFonts.poppins(
//       textStyle: const TextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.w600,
//         color: AppColors.darkblackTextColor,
//       ));
//   static TextStyle loginwithOTPTs = GoogleFonts.poppins(
//       textStyle: const TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         color: AppColors.primaryColor,
//         decoration: TextDecoration.underline,
//       ));
//   static TextStyle signupTs = GoogleFonts.poppins(
//       textStyle: const TextStyle(
//         fontSize: 12,
//         fontWeight: FontWeight.w600,
//         color: AppColors.primaryColor,
//         decoration: TextDecoration.underline,
//       ));

//   static TextStyle meetYourbestTs = GoogleFonts.poppins(
//       textStyle: const TextStyle(
//         fontSize: 50,
//         fontWeight: FontWeight.w700,
//         color: AppColors.darkblackTextColor,

//       ));

//   static TextStyle meetYourbestmobTs = GoogleFonts.poppins(
//       textStyle: const TextStyle(
//         fontSize: 35,
//         fontWeight: FontWeight.w700,
//         color: AppColors.darkblackTextColor,

//       ));
//   static TextStyle connectionsmobTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//         fontSize: 35,
//         fontWeight: FontWeight.w700,
//         color: AppColors.primaryColor,

//       ));

//   static TextStyle connectionsTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//         fontSize: 50,
//         fontWeight: FontWeight.w700,
//         color: AppColors.primaryColor,

//       ));
//   static TextStyle buildfastTs = GoogleFonts.roboto(
//       textStyle:  const TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w400,
//         color: AppColors.blackColor,

//       ));
//   static TextStyle infoprofileTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//         fontSize: 25,
//         fontWeight: FontWeight.w500,
//         color: AppColors.blackNormalTextColor,

//       ));

//   static TextStyle tabinfoprofileTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w500,
//         color: AppColors.blackNormalTextColor,

//       ));

//   static TextStyle tabinfoprofileblueTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w500,
//         color: AppColors.primaryColor,


//       ));
//   static TextStyle mobinfoprofileblueTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.w500,
//         color: AppColors.primaryColor,


//       ));
//   static TextStyle mobinfoprofileTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.w500,
//         color: AppColors.blackNormalTextColor,

//       ));

//   static TextStyle providesTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//         fontSize: 25,
//         fontWeight: FontWeight.w500,
//         color: AppColors.primaryColor,

//       ));
//   static TextStyle font500_28Ts = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//         fontSize: 28,
//         fontWeight: FontWeight.w500,


//       ));

//   static TextStyle font500_28bluecolTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//           fontSize: 28,
//           fontWeight: FontWeight.w500,
//           color: AppColors.primaryColor

//       ));
//   static TextStyle font400_14Ts = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           color: AppColors.muteCol


//       ));
//   static TextStyle fontSevenTwoSixTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//           fontSize: 26,
//           fontWeight: FontWeight.w700,
//           color: AppColors.logincardColor


//       ));

//   static TextStyle fontSixThreeZeroTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.w600,
//           color: AppColors.primaryColor


//       ));
//   static TextStyle fontFiveOneTwoTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//         fontSize: 12,
//         fontWeight: FontWeight.w400,



//       ));
  static TextStyle fontSixOneEightTs = GoogleFonts.poppins(
      textStyle:  const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.logincardColor
      ));
//   static TextStyle fontFiveOneEightTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w500,
//           color: AppColors.primaryColor,
//           decoration: TextDecoration.underline
//       ));

//   static TextStyle fontFourOneFourTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//           color: AppColors.logincardColor
//       ));

//   static TextStyle imgTextCol = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//           color: AppColors.muteCol
//       ));

//   static TextStyle fontFourOneFourWhiteMobTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//           fontSize: 10,
//           fontWeight: FontWeight.w400,
//           color: AppColors.logincardColor
//       ));

//   static TextStyle fontSixTwoZeroWhiteTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           color: AppColors.logincardColor
//       ));
//   static TextStyle termConTs = GoogleFonts.poppins(
//       textStyle:  const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w700,
//           color: AppColors.primaryColor

//       ));
  static TextStyle fontSixOneSixBlackTs = GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,

      ));

  static TextStyle sixOneFourGreyTs = GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.greyCol

      ));
  static TextStyle fontSixOneEightBlackTs = GoogleFonts.poppins(
      textStyle:const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ));
//   static TextStyle greyNormal10 = GoogleFonts.poppins(
//       textStyle: const TextStyle(
//           fontSize: 10,
//           fontWeight: FontWeight.w600,
//           color: AppColors.greyCol
//       ));




}