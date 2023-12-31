// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:info_web_app/res/common_components/app_color.dart';
// import 'package:info_web_app/res/common_components/app_style.dart';

// class PersonalProfile extends StatelessWidget {
//   PersonalProfile(
//       {super.key,
//       this.userName = "Praveen",
//       this.email = "praveen@yopmail.com",
//       this.followerList = "1000 followers",
//       this.mobileNum = "1823y489123",
//       this.followingList = "5 followings ",
//       this.joinedDate = "10 months ago",
//       this.name = "Ashish",
//       this.image,
//       this.postList = "200"});

//   String userName;
//   String email;
//   String? image;
//   String name;
//   String mobileNum;
//   String followerList;
//   String followingList;
//   String joinedDate;
//   String postList;

//   @override
//   Widget build(BuildContext context) {
//     debugPrint("My image url is $image");
//     return Container(
//       height: 450,
//       width: 981,
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           color: AppColors.logincardColor,
//           borderRadius: BorderRadius.circular(10)),
//       child: Stack(children: [
//         Container(
//           margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
//           padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
//           decoration: BoxDecoration(
//               border: Border.all(color: AppColors.borderCol, width: 1.5)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   const SizedBox(
//                     width: 120,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Profile",
//                         style: AppStyle.sixOneFourGreyTs,
//                       ),
//                       Text(
//                         name,
//                         style: AppStyle.fontSixOneEightBlackTs,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 2.5,
//                 color: AppColors.lightGreyCol,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "About",
//                 style: AppStyle.sixOneFourGreyTs,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.person_outlined,
//                                 color: AppColors.primaryColor,
//                                 size: 28,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 userName,
//                                 style: AppStyle.fontSixOneSixBlackTs,
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.email_outlined,
//                                 color: AppColors.primaryColor,
//                                 size: 28,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 email.length > 14
//                                     ? email.substring(0, 10) + "..."
//                                     : email,
//                                 style: AppStyle.fontSixOneSixBlackTs,
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.phone,
//                                 color: AppColors.primaryColor,
//                                 size: 28,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 mobileNum,
//                                 style: AppStyle.fontSixOneSixBlackTs,
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     // SizedBox(height: 30,),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.calendar_month,
//                                 color: AppColors.primaryColor,
//                                 size: 28,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 joinedDate,
//                                 style: AppStyle.fontSixOneSixBlackTs,
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.people_outlined,
//                                 color: AppColors.primaryColor,
//                                 size: 28,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 followerList,
//                                 style: AppStyle.fontSixOneSixBlackTs,
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.people_outline,
//                                 color: AppColors.primaryColor,
//                                 size: 28,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 followerList,
//                                 style: AppStyle.fontSixOneSixBlackTs,
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Icon(
//                                 Icons.image_sharp,
//                                 color: AppColors.primaryColor,
//                                 size: 28,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 postList,
//                                 style: AppStyle.fontSixOneSixBlackTs,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         ClipOval(
//           child: CachedNetworkImage(
//               imageUrl: image!,
//               height: 120,
//               fit: BoxFit.cover,
//               placeholder: (context, url) => const CircularProgressIndicator(),
//               errorWidget: (context, url, error) => const Icon(Icons.error),
//               width: 120),
//         ),
//         Positioned(
//             top: 80,
//             left: 80,
//             child: Container(
//               height: 42,
//               width: 42,
//               decoration: const BoxDecoration(
//                   color: AppColors.primaryColor,
//                   boxShadow: [
//                     BoxShadow(
//                         offset: Offset(0, 1.1097561120986938),
//                         blurRadius: 23.304880142211914,
//                         spreadRadius: 0,
//                         color: AppColors.logincardColor)
//                   ],
//                   shape: BoxShape.circle),
//               child: const Center(
//                   child: Icon(
//                 Icons.image_outlined,
//                 color: AppColors.logincardColor,
//                 size: 30,
//               )),
//             ))
//       ]),
//     );
//   }
// }
