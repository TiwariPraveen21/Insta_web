import 'package:flutter/material.dart';
import 'package:info_web_app/models/post_model.dart';
import 'package:info_web_app/models/profile_model.dart';
import 'package:info_web_app/res/custom_widget/home/custom_appbar.dart';
import 'package:info_web_app/res/custom_widget/home/footer.dart';
import 'package:info_web_app/res/custom_widget/home/home_style.dart';
import 'package:info_web_app/res/custom_widget/home/add_post_box.dart';
import 'package:info_web_app/res/custom_widget/home/connection_box.dart';
import 'package:info_web_app/res/custom_widget/home/post_feed_slides.dart';
import 'package:info_web_app/view_model/home_view_model.dart';
import 'package:info_web_app/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
    // final _myhomeRepo = HomeRepository();
    //final _auth = FirebaseAuth.instance;

  final TextEditingController searchCont = TextEditingController();
  String preVal = "";
  int item = 10;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<HomeViewModel>(context);
    final profileProvider = Provider.of<ProfileViewModel>(context);
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
              fit: BoxFit.fill,
            ),
          ),

          // Body App Bar
          const CostumAppBar(),

          // Remaining Content
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 15, right: 15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spa,
                children: [
                  Expanded(
                    flex:2,
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
                      ],
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                  flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Consumer<HomeViewModel>(
                              builder: (contex,provider,child) {
                                return StreamBuilder<List<PostModel?>>(
                                  stream: provider.getUserFeed(),
                                  builder: (context, snapshot) {
                                    // if(snapshot.connectionState == ConnectionState.waiting){
                                    //   return const Center(child: CircularProgressIndicator());
                                    // }
                                    if(snapshot.hasData){
                                      List<PostModel?> postsData = snapshot.data!;
                                     return Column(
                                      children: [
                                        //First children is to add post
                                      const AddPostBox(),
                                      //Second children is to show post
                                        ...List.generate(snapshot.data!.length, (index){
                                         return PostFeedSlide(
                                                 postModel: postsData[index],
                                              );
                                        }),
                                      ],
                                    );
                                    }
                                    else{
                                      return const AddPostBox();
                                    }
                                    
                                  }
                                );
                              }
                            )
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                     flex:2,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
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
                                  Text("Followings",style:AppStyle.connectionHeader),
                                
                                    Expanded(
                                    child: StreamBuilder<UserProfileModel?>(
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
                                    ),
                                  ),
                                  Center(child: Text("View All",style: AppStyle.connectionText,))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Expanded(
                          flex: 4,
                          child: HomePageFooter(),
                        ),
                      ],
                    ),
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

