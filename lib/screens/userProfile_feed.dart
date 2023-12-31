import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_web_app/models/profile_model.dart';
import 'package:info_web_app/res/custom_widget/home/connection_box.dart';
import 'package:info_web_app/res/custom_widget/home/custom_appbar.dart';
import 'package:info_web_app/res/custom_widget/home/home_style.dart';
import 'package:info_web_app/res/custom_widget/profile&Feed/personal_profile_box.dart';
import 'package:info_web_app/res/custom_widget/profile&Feed/tab_bar.dart';
import 'package:info_web_app/view_model/home_view_model.dart';
import 'package:info_web_app/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
 const ProfilePage({super.key});

 @override
 State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 @override
 Widget build(BuildContext context) {
  final provider = Provider.of<HomeViewModel>(context);
    final profileProvider = Provider.of<ProfileViewModel>(context);
    final _auth = FirebaseAuth.instance;
   Size size = MediaQuery
       .of(context)
       .size;

   return Scaffold(
     backgroundColor: Colors.white,
     body: Stack(
       children: [
         // Background Image
         Positioned(
           top: -20,
           child: Image.asset(
             'assets/image/rectangle.png',
             width: size.width,
             // height: size.height * 0.7,
             fit: BoxFit.fill,
           ),
         ),
         const CostumAppBar(),
         // Remaining Content
         Padding(
           padding: const EdgeInsets.only(top: 90, left: 15, right: 15),
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
             child: Row(
               children: [
                 Expanded(
                   flex:1,
                   child: Column(
                     children: [
                       Expanded(
                         child: Container(
                           constraints: const BoxConstraints(
                           ),
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10),
                               border: Border.all(width: 1,color: Colors.grey.shade200)

                           ),
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Follower",style:AppStyle.connectionHeader),
                                 Expanded(
                                   child: StreamBuilder<UserProfileModel?>(
                                      stream: profileProvider.getUserDetails(),
                                      builder: (context,snapshot) {
                                        if(snapshot.data == null || !snapshot.hasData || snapshot.hasError){
                                          return Container();
                                        }
                                        else{
                                         return ListView.builder(
                                            itemCount:(snapshot.data!.followerList!.isEmpty)?0:snapshot.data!.followerList!.length,
                                            itemBuilder:(context,index){
                                              return StreamBuilder<UserProfileModel?>(
                                                stream: provider.getUserDetails(snapshot.data!.followerList![index]),
                                                builder: (context, snap) {
                                                   if(snap.data == null || !snap.hasData || snap.hasError){
                                                    return Container();
                                                   }
                                                   else{
                                                    return ConnectionsListBox(
                                                    name: snap.data!.name!,
                                                    imageurl: snap.data!.image!,
                                                    onTapCallback: () {
                                                       provider.removeUserAPI(snap.data!.uid!);
                                                    },
                                                  );
                                                   }
                                                  
                                                }
                                              );
                                            });
                                        }
                                       
                                      }
                                    ),
                                 ),
                                 Center(child: InkWell(
                                     onTap: (){

                                     },
                                     child: Text("View All",style: AppStyle.connectionText,)))
                               ],
                             ),
                           ),



                         ),
                       ),
                       const SizedBox(height: 20,),
                       Expanded(
                         child: Container(
                           constraints: const BoxConstraints(
                           ),
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10),
                               border: Border.all(width: 1,color: Colors.grey.shade200)

                           ),
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Following",style:AppStyle.connectionHeader),
                                 Expanded(
                                   child:StreamBuilder<UserProfileModel?>(
                                      stream: profileProvider.getUserDetails(),
                                      builder: (context, snapshot) {
                                        if(!snapshot.hasData || snapshot.data == null ||snapshot.hasError){
                                          return Container();
                                        }
                                        else{
                                          return ListView.builder(
                                            itemCount:(snapshot.data!.followingList!.isEmpty)?0:snapshot.data!.followingList!.length,
                                            itemBuilder:(context,index){
                                              return StreamBuilder<UserProfileModel?>(
                                               stream:provider.getUserDetails(snapshot.data!.followingList![index]),
                                               builder: (context, snap) {
                                                 if(snap.hasError || !snap.hasData || snap.data == null){
                                                   return Container();
                                                 }
                                                 else{
                                                   return ConnectionsListBox(
                                                   name: snap.data!.name! ?? "UserName",
                                                   imageurl: snap.data!.image!,
                                                   onTapCallback: () {
                                                     provider.unFollowUserAPI(snap.data!.uid!);
                                                   },
                                                   
                                                 );
                                                 }
                                                 
                                               }
                                              );
                                            });
                                        }
                                      }
                                    )
                                 ),
                                 Center(child: InkWell(
                                     onTap: (){

                                     },
                                     child: Text("View All",style: AppStyle.connectionText,)))
                               ],
                             ),
                           ),



                         ),
                       ),
                     ],
                   ),
                 ),
                 const SizedBox(width: 15,),
                 Expanded(
                   flex: 4,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Consumer<HomeViewModel>(
                         builder: (context,profileProvider,child) {
                           return StreamBuilder<UserProfileModel?>(
                             stream: profileProvider.getUserDetails(_auth.currentUser!.uid),
                             builder: (context, snapshot) {
                              if(snapshot.connectionState == ConnectionState.waiting){
                                return const Center(child: CircularProgressIndicator());
                              }
                              if(snapshot.hasData && snapshot.data != null){
                                return ButtonPersonal1(
                                   onPressed: (){},
                                   name: snapshot.data!.name!,
                                   imagePath: 'assets/image/amity_logo.png'
                               );
                              }
                              else{
                               return Container();
                              }
                               
                             }
                           );
                         }
                       ),
                       const SizedBox(height: 10,),
                       const Expanded(
                        child: CustomTabBar()),
                     ],
                   )

                 ),

               ],
             ),
           ),
         ),
       ],
     ),
   );
 }
}

