import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:info_web_app/globledata/global_value.dart';
import 'package:info_web_app/models/comment_model.dart';
import 'package:info_web_app/models/like_model.dart';
import 'package:info_web_app/models/post_model.dart';
import 'package:info_web_app/models/profile_model.dart';
import 'package:info_web_app/res/custom_widget/home/appImage_string.dart';
import 'package:info_web_app/res/custom_widget/home/home_color.dart';
import 'package:info_web_app/res/custom_widget/home/home_style.dart';
import 'package:info_web_app/utils/utils.dart';
import 'package:info_web_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class PostFeedSlide extends StatelessWidget {
  final PostModel? postModel;
  const PostFeedSlide({
    super.key,
   this.postModel, 
  });

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<HomeViewModel>(context);
    final _auth = FirebaseAuth.instance;
    final TextEditingController commentController = TextEditingController();
    // debugPrint("****************** postId ${postId}**********************");
    // debugPrint("****************** imageLink ${imageLink}**********************");
    // debugPrint("****************** description ${description}**********************");
    // debugPrint("****************** username ${username}**********************");
    return Container(
     //width:400,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child:
                //Image.asset(AppImages.googly,height: 50,width: 50,),
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                  AppImages.defaultFemaleImg,
                  height: 45,
                  width: 45,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postModel!.postedBy!,
                    style:  AppStyle.sixOneTwoTs,
                  ),
                  Text(
                    //postModel!.time!,
                    formatTimeofMillisecondsSinceEpoch(int.parse(postModel!.time!)),
                    style:  AppStyle.sixOnezeroTs,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                postModel!.description!,
                style:  AppStyle.fiveOneFourTs,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl:
             // AppImages.defaultFemaleImg,
             postModel!.imageLink!,
              // height: 360,
              // width: 614,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              //Like Data
              Consumer<HomeViewModel>(
                builder: (context,likeProvider,child) {
                  return StreamBuilder<PostLikeModel?>(
                    stream: likeProvider.getPostLikeListAPI(postId: postModel!.postId!),
                    builder: (context, snapshot) {
                      //when likeList exist for the post
                       if (snapshot.hasData && snapshot.data != null)
                       {
                        return Row(
                        children: [
                        InkWell( 
                          onTap: () {
                            if(snapshot.data!.likeList!.contains(_auth.currentUser!.uid)){
                               likeProvider.disLike(postId: postModel!.postId!);
                            }
                            else{
                                likeProvider.addLike(postId:postModel!.postId! , postedBy:postModel!.postedBy!);
                            }
                            
                          },

                          onLongPress: () {
                             Utils.showLikeListBottomSheet(context, postModel!.postId);

                          },
                          child: (snapshot.data!.likeList!.contains(_auth.currentUser!.uid)?const Icon(FontAwesomeIcons.solidThumbsUp,color: Colors.red,) :const Icon(FontAwesomeIcons.thumbsUp)),
                        ),
                        const SizedBox(width: 5),
                     Text(
                       snapshot.data!.likeList!.length.toString(),
                        style:  AppStyle.sixOneFourGreyTs,
                      ),
                      ]);
                      }
                       //when likeList does not exist for the post means when their is zero like on the post
                      else {
                        return Row(
                        children: [
                        InkWell( 
                          onTap: () {
                            likeProvider.addLike(postId:postModel!.postId! , postedBy:postModel!.postedBy!);
                            
                          },
                          child: const Icon(FontAwesomeIcons.thumbsUp),
                        ),
                         const SizedBox(width: 5),
                     Text(
                       "0",
                        style:  AppStyle.sixOneFourGreyTs,
                      ),
                      ],);
                      }
                    }
                  );
                }
              ),
              //Comment Data
              const SizedBox(
                width: 15,
              ),
              Consumer<HomeViewModel>(
                builder: (context,commentProvider,child) {
                  return StreamBuilder<PostCommentListModel?>(
                    stream: commentProvider.getPostCommentListAPI(postId: postModel!.postId!),
                    builder: (context, snapshot) {
                      if(snapshot.hasData && snapshot.data != null){
                        return InkWell(
                          onTap: () {
                            Utils.showCommentListBottomSheet(context, snapshot.data!.postCommentList);
                          },
                          child: Row(
                          children: [
                          const ImageIcon(
                          AssetImage(AppImages.commentIcon)),
                          Text(
                          snapshot.data!.postCommentList!.length.toString(),
                          style:  AppStyle.sixOneFourGreyTs,
                            ),
                          ],
                           ),
                        );
                      }
                      else{
                         return Row(
                        children: [
                        const ImageIcon(
                        AssetImage(AppImages.commentIcon),
                      ),
                      Text(
                        "0",
                        style:  AppStyle.sixOneFourGreyTs,
                      ),
                        ],
                      );
                      }
                      
                    }
                  );
                }
              ),
              
              const SizedBox(
                width: 15,
              ),
              const ImageIcon(
                AssetImage("assets/image/report.png"),
              ),
              Text(
                "  report",
                style:  AppStyle.sixOneFourGreyTs,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller:commentController ,
                  onFieldSubmitted: (value) {
                     _provider.addComment(comment: commentController.text.toString().trim(), postId: postModel!.postId!, postedBy: postModel!.postedBy!).then((value){
                      commentController.text = '';
                     });
                  },
                  style: AppStyle.custompoppinNormalTs,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 6.0),
                      child: ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl:
                            AppImages.defaultFemaleImg,
                            height: 15,
                            width: 15,
                          )),
                    ),
                    hintStyle:  AppStyle.sixOnezeroTs,
                    hintText: "write your comments here",
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColors.borderCol,
                            width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColors.borderCol,
                            width: 1)),
                
                  ),
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                   _provider.addComment(comment: commentController.text.toString().trim(), postId: postModel!.postId!, postedBy: postModel!.postedBy!);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                        "assets/image/frame 60 (1).png"
                    ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          Consumer<HomeViewModel>(
            builder: (context,commentProver,child) {
              return StreamBuilder<PostCommentListModel?>(
                stream:commentProver.getPostCommentListAPI(postId: postModel!.postId!),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  }
                  else if(snapshot.hasData && snapshot.data != null){
                    return StreamBuilder<UserProfileModel?>(
                      stream:commentProver.getUserDetails(postModel!.postedBy!),
                      builder: (context, snap) {
                        if(snap.hasData && snap.data != null){
                         return Row(
                        children: [
                         ClipOval(
                           child: CachedNetworkImage(
                              imageUrl:snap.data!.image!,
                              height: 46,
                              width: 46,
                             fit: BoxFit.fill,
                            ),
                         ),const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //to show the latest comment
                                  Text(snap.data!.name!,style: AppStyle.fontSixOneSevenTs ,),
                                  const SizedBox(width: 5),
                                  Text(formatTimeofMillisecondsSinceEpoch(int.parse(snapshot.data!.postCommentList![snapshot.data!.postCommentList!.length-1].time!)),style:  AppStyle.sixOnezeroTs)
                                ],
                              ),
                              Text(snapshot.data!.postCommentList![snapshot.data!.postCommentList!.length-1].comment!,style: AppStyle.fontFiveOneOneTs,)
                            ],
                          ),
                                          
                        ],
                          );
                        }
                        else{
                          return Container();
                        }
                        
                      }
                    );
                  }
                  else{
                    return Container();
                  }
                  
                }
              );
            }
          ),

        ],


      ),
    );
  }
}

