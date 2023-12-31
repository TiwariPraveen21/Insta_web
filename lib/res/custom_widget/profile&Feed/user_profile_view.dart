import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_web_app/globledata/global_value.dart';
import 'package:info_web_app/models/profile_model.dart';
import 'package:info_web_app/res/custom_widget/home/home_color.dart';
import 'package:info_web_app/res/custom_widget/home/home_style.dart';
import 'package:info_web_app/res/custom_widget/profile&Feed/profile_style.dart';
import 'package:info_web_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';


class PersonalProfile extends StatelessWidget {
 const PersonalProfile(
     {super.key,
       });

 @override
 Widget build(BuildContext context) {
  final _auth = FirebaseAuth.instance;
   return Container(
     height: 450,
     width: 981,
     padding: const EdgeInsets.all(10),
     decoration: BoxDecoration(
         color: AppColors.logincardColor,
         borderRadius: BorderRadius.circular(10)),
     child: Stack(
      children: [
        //First Children of stack
       Container(
         margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
         padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
         decoration: BoxDecoration(
             border: Border.all(color: AppColors.borderCol, width: 1.5)),
         child: Consumer<HomeViewModel>(
           builder: (context,provider,child) {
             return StreamBuilder<UserProfileModel?>(
               stream: provider.getUserDetails(_auth.currentUser!.uid),
               builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){
                 return Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    //First row to show profile and Name of user
                     Row(
                       children: [
                         const SizedBox(
                           width: 120,
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               "Profile",
                               style: AppStyle.sixOneFourGreyTs,
                             ),
                             Text(
                               snapshot.data!.email!,
                               style: ProfilePageStyle.fontSixOneEightBlackTs,
                             ),
                           ],
                         ),
                       ],
                     ),
                 
                     const SizedBox(
                       height: 30,
                     ),

                     //divider
                     Container(
                       height: 2.5,
                       color: AppColors.lightGreyCol,
                       padding: const EdgeInsets.symmetric(vertical: 10),
                     ),
                     const SizedBox(
                       height: 20,
                     ),
                     Text(
                       "About",
                       style: AppStyle.sixOneFourGreyTs,
                     ),
                     const SizedBox(
                       height: 20,
                     ),
                     //For showing all the user data
                     Expanded(
                       child: Consumer<HomeViewModel>(
                         builder: (context,prd,child) {
                           return StreamBuilder<UserProfileModel?>(
                             stream: prd.getUserDetails(_auth.currentUser!.uid),
                             builder: (context, snap) {
                              if(snap.connectionState == ConnectionState.waiting){
                                return const Center(child: CircularProgressIndicator());
                              }
                              else if(snap.hasData){
                              return Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Expanded(
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                        //username
                                         Row(
                                           children: [
                                             const Icon(
                                               Icons.person_outlined,
                                               color: AppColors.primaryColor,
                                               size: 28,
                                             ),
                                             const SizedBox(
                                               width: 10,
                                             ),
                                             Text(
                                               (snap.data!.username != null  && snap.data!.username!.length>10 )?'${snap.data!.username!.substring(0,10)}...':snap.data!.username!,
                                               style: ProfilePageStyle.fontSixOneSixBlackTs,
                                             )
                                           ],
                                         ),
                                         //email
                                         Row(
                                           children: [
                                             const Icon(
                                               Icons.email_outlined,
                                               color: AppColors.primaryColor,
                                               size: 28,
                                             ),
                                             const SizedBox(
                                               width: 10,
                                             ),
                                             Text(
                                               snap.data!.email!,
                                               style: ProfilePageStyle.fontSixOneSixBlackTs,
                                             )
                                           ],
                                         ),
                                         //Mobile Number
                                         Row(
                                           children: [
                                             const Icon(
                                               Icons.phone,
                                               color: AppColors.primaryColor,
                                               size: 28,
                                             ),
                                             const SizedBox(
                                               width: 10,
                                             ),
                                             Text(
                                              (snap.data!.mobile!.isNotEmpty)? snap.data!.mobile! :"No Number",
                                               style: ProfilePageStyle.fontSixOneSixBlackTs,
                                             )
                                           ],
                                         ),
                                       ],
                                     ),
                                   ),
                                                
                                   // SizedBox(height: 30,),
                                   Expanded(
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                        //Time
                                         Row(
                                           children: [
                                             const Icon(
                                               Icons.calendar_month,
                                               color: AppColors.primaryColor,
                                               size: 28,
                                             ),
                                             const SizedBox(
                                               width: 10,
                                             ),
                                             Text(
                                               snap.data!.joinDate!,
                                               style: ProfilePageStyle.fontSixOneSixBlackTs,
                                             )
                                           ],
                                         ),
                                         //following 
                                         Row(
                                           children: [
                                             const Icon(
                                               Icons.people_outlined,
                                               color: AppColors.primaryColor,
                                               size: 28,
                                             ),
                                             const SizedBox(
                                               width: 10,
                                             ),
                                             Text(
                                               snap.data!.followingList!.length.toString(),
                                               style: ProfilePageStyle.fontSixOneSixBlackTs,
                                             )
                                           ],
                                         ),
                                         //Follower
                                         Row(
                                           children: [
                                             const Icon(
                                               Icons.people_outline,
                                               color: AppColors.primaryColor,
                                               size: 28,
                                             ),
                                             const SizedBox(
                                               width: 10,
                                             ),
                                             Text(
                                              snap.data!.followerList!.length.toString(),
                                               style: ProfilePageStyle.fontSixOneSixBlackTs,
                                             )
                                           ],
                                         ),
                                       ],
                                     ),
                                   ),
                                   Expanded(
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                        //Number of Post
                                         Row(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             const Icon(
                                               Icons.image_sharp,
                                               color: AppColors.primaryColor,
                                               size: 28,
                                             ),
                                             const SizedBox(
                                               width: 10,
                                             ),
                                             Text(
                                               snap.data!.postList!.length.toString(),
                                               style: ProfilePageStyle.fontSixOneSixBlackTs,
                                             ),
                                           ],
                                         ),
                                                
                                       ],
                                     ),
                                   )
                                 ],
                               );
                              }
                               else{
                                return const Center(child: Text("No data"));
                             }
                             }
                             
                           );
                         }
                       ),
                     ),
                 
                     // SizedBox(height: 30,),
                   ],
                 );
                }else{
                  return const Center(child: Text("No data"));
                }
                 
               }
             );
           }
         ),
       ),
        //second Children of stack(profile iamge)
       ClipOval(child: CachedNetworkImage(imageUrl: dummyMaleImage, height: 120, width: 120,fit: BoxFit.fill,)),

        //Third Children of stack(camera icon over profile)
       Positioned(
           top: 80,
           left: 80,
           child: Container(
             height: 42,
             width: 42,
             decoration: const BoxDecoration(
                 color: AppColors.primaryColor,
                 boxShadow: [
                   BoxShadow(
                       offset: Offset(0, 1.1097561120986938),
                       blurRadius: 23.304880142211914,
                       spreadRadius: 0,
                       color: AppColors.logincardColor)
                 ],
                 shape: BoxShape.circle),
             child: const Center(
                 child: Icon(
                   Icons.image_outlined,
                   color: AppColors.logincardColor,
                   size: 30,
                 )),
           ))
     ]),
   );
 }
}

