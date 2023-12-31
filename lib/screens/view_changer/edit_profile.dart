// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:info_web_app/models/profile_model.dart';
// import 'package:info_web_app/res/common_components/app_color.dart';
// import 'package:info_web_app/view_model/home_view_model.dart';
// import 'package:provider/provider.dart';

// class EditProfile extends StatelessWidget {
//   EditProfile({super.key});
//   TextEditingController nameCont = TextEditingController();
//   TextEditingController emailCont = TextEditingController();
//   TextEditingController userNameCont = TextEditingController();
//   TextEditingController mobileNoCont = TextEditingController();
//   TextEditingController desCont = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     String dob;
//     String gender;
//     return Consumer<HomeViewModel>(
//       builder: (context, editProfileAndProfile, child) {
//         return StreamBuilder<UserProfileModel?>(
//           stream: editProfileAndProfile.getUserDetails(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData && snapshot.data != null) {
//               final userData = snapshot.data!;
//               nameCont.text = userData.name ?? "";
//               emailCont.text = userData.email ?? "";
//               userNameCont.text = userData.username ?? "";
//               mobileNoCont.text = userData.mobile ?? "";
//               //desCont.text = userData.about ?? "";
//               //dob = userData.dob ?? "";
//               gender = userData.gender ?? "";
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(20),
//                     height: 410,
//                     decoration: BoxDecoration(
//                       color: AppColors.logincardColor,
//                       border: Border.all(color: AppColors.borderCol),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
// // crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Column(
//                             children: [
//                               Text(
//                                 AppTexts.profile,
//                                 style: GoogleFonts.poppins(
//                                   textStyle: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 height: 3,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 21, 110, 182),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                             height: 2,
//                             decoration: BoxDecoration(
//                               color: AppColors.lightGreyCol,
//                             )),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Consumer<HomeViewModel>(
//                           builder: (context, value, child) {
//                             return Stack(children: [
//                               Container(
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                           width: 2,
//                                           color: AppColors.borderCol)),
//                                   child: value.isPicked
//                                       ? CircularNetworkImage(
//                                           imageUrl: AppLink.defaultFemaleImg,
//                                           height: 126,
//                                           width: 126,
// //fit: BoxFit.cover,
//                                         )
//                                       :
// //Image.memory(value.webImage!)
//                                       CircularNetworkImage(
//                                           imageUrl: AppLink.defaultFemaleImg,
//                                           height: 126,
//                                           width: 126,
// //fit: BoxFit.cover,
//                                         )),
//                               Positioned(
//                                   top: 80,
//                                   left: 85,
//                                   child: InkWell(
//                                       onTap: value.pickImageFromDevice,
//                                       child: BlueCircularImage()))
//                             ]);
//                           },
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                                 child: CustomTextField(
//                               borderCol: AppColors.greyCol,
//                               enBorderCol: AppColors.borderCol,
//                               customController: nameCont,
//                               hintext: AppTexts.enterName,
//                               prefixicon: Icons.person,
//                               iconCol: AppColors.primaryColor,
//                               customValidator: Utils.isValidName,
//                             )),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Expanded(
//                                 child: CustomTextField(
//                               borderCol: AppColors.greyCol,
//                               enBorderCol: AppColors.borderCol,
//                               customController: userNameCont,
//                               hintext: AppTexts.enterUsername,
//                               prefixicon: Icons.person_4_outlined,
//                               iconCol: AppColors.primaryColor,
//                               customValidator: Utils.isValidName,
//                             )),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: CustomDropdownFormField<String>(
// // prefIcon: ,
//                                 label: AppTexts.selectGender,
//                                 items: [
//                                   AppTexts.genderOption1,
//                                   AppTexts.genderOption2,
//                                   AppTexts.genderOption3
//                                 ],
//                                 onChanged: (String? value) {
// // print('Selected Gender: $value');
//                                 },

//                                 hintText: AppTexts.selectGender,
//                                 borderColor: AppColors.borderCol,
//                                 dropdownIconColor: AppColors.primaryColor,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Expanded(
//                               child: CustomDropdownFormField<DateTime>(
//                                 label: AppTexts.selectDate,
//                                 items: [], // You can leave this empty for date picker
//                                 onChanged: (DateTime? value) {
// // print('Selected Date: $value');
//                                 },
//                                 hintText: AppTexts.selectDate,
//                                 borderColor: AppColors
//                                     .borderCol, // Customize border color
//                                 dropdownIconColor: AppColors
//                                     .primaryColor, // Customize dropdown icon color
//                                 useDatePicker:
//                                     true, // Use date picker instead of dropdown
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     height: 150,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: AppColors.borderCol, width: 2),
//                       color: AppColors.logincardColor,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           AppTexts.tagLine,
//                           style: GoogleFonts.poppins(
//                             textStyle: TextStyle(
//                               color: Color.fromRGBO(158, 159, 160, 1),
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           height: 2,
//                           decoration: BoxDecoration(
//                             color: AppColors.lightGreyCol,
//                           ),
//                         ),
// // SizedBox(
// // height: 20,
// // ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         CustomTextField(
//                           customController: desCont,
//                           borderCol: AppColors.greyCol,
//                           enBorderCol: AppColors.borderCol,
//                           hintext: AppTexts.writeDes,
//                           prefixicon: Icons.edit_note,
//                           iconCol: AppColors.primaryColor,
// //customValidator: Utils.isValidName,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     height: 150,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: AppColors.borderCol, width: 2),
//                       color: AppColors.logincardColor,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           AppTexts.contactInfo,
//                           style: GoogleFonts.poppins(
//                             textStyle: TextStyle(
//                               color: Color.fromRGBO(158, 159, 160, 1),
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           height: 2,
//                           decoration: BoxDecoration(
//                             color: AppColors.lightGreyCol,
//                           ),
//                         ),
// // SizedBox(
// // height: 20,
// // ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                                 child: CustomTextField(
//                               borderCol: AppColors.greyCol,
//                               enBorderCol: AppColors.borderCol,
//                               customController: mobileNoCont,
//                               hintext: AppTexts.enterMobNum,
//                               prefixicon: Icons.phone,
//                               iconCol: AppColors.primaryColor,
//                               customValidator: Utils.isValidph,
//                             )),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Expanded(
//                                 child: CustomTextField(
//                               borderCol: AppColors.greyCol,
//                               enBorderCol: AppColors.borderCol,
//                               customController: emailCont,
//                               hintext: AppTexts.enterMobNum,
//                               prefixicon: Icons.email,
//                               iconCol: AppColors.primaryColor,
//                               customValidator: Utils.isValidEmailNull,
//                             )),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       editProfileAndProfile
//                           .updateProfile(
//                               name: nameCont.text.toString().trim(),
//                               username: userNameCont.text.toString().trim(),
//                               gender: gender.toString().trim(),
//                               dob: dob.toString().trim(),
//                               about: desCont.text.toString().trim(),
//                               mobile: mobileNoCont.text.toString().trim(),
//                               email: emailCont.text.toString().trim())
//                           .then((value) {
// //isEdit = true;
//                         context.goNamed(MyAppRouteConstants.profilePageRoute,
//                             pathParameters: {
//                               'uid': FirebaseAuth.instance.currentUser!.uid,
//                             });
//                       }).onError((error, stackTrace) {});
//                     },
//                     child: Container(
//                       constraints: BoxConstraints(maxHeight: 56, maxWidth: 278),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Color.fromRGBO(7, 99, 198, 1),
//                       ),
//                       child: Center(
//                           child: Text(
//                         AppTexts.save,
//                         style: AppStyle.sixOneSixwhite,
//                       )),
//                     ),
//                   )
//                 ],
//               );
//             } else {
//               return SizedBox(
//                 child: Text("hsddjfhdjhsjhjs"),
//               );
//             }
//           },
//         );
//       },
//     );
//   }
// }
