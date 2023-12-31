import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_web_app/models/post_model.dart';
import 'package:info_web_app/res/custom_widget/home/home_color.dart';
import 'package:info_web_app/res/custom_widget/home/post_feed_slides.dart';
import 'package:info_web_app/res/custom_widget/profile&Feed/user_profile_view.dart';
import 'package:info_web_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey.shade200)),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTab("Profile", 0),
                const SizedBox(
                  width: 20,
                ),
                buildTab("Feeds", 1),
              ],
            ),
          ),
          Container(
            height: 3,
            color: AppColors.lightGreyCol,
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                // Profile Tab Content
                Container(
                  child: Center(
                    child: PersonalProfile(),
                  ),
                ),
                // Feeds Tab Content
                Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Expanded(
                            child: Consumer<HomeViewModel>(
                                builder: (context, provider, child) {
                              return StreamBuilder<List<PostModel?>>(
                                  stream: provider.getUserFeed(),
                                  builder: (context, snapshot) {
                                    if(snapshot.connectionState == ConnectionState.waiting){
                                       return const Center(child: CircularProgressIndicator(),);
                                    }
                                    else if(snapshot.hasData){
                                    return ListView.builder(
                                        //  physics: const NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          List<PostModel?> postData = snapshot.data!;
                                          return Container(
                                              margin: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                          Colors.grey.shade200),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              //Fed slides on UserProfile Screen
                                              child:PostFeedSlide(
                                                 postModel: postData[index],
                                              ));
                                        });
                                    }
                                    else{
                                      return const Center(child: Text("No data Found"));
                                    }
                                    
                                  });
                            }),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: Container())
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          //  borderRadius: BorderRadius.horizontal(right: Radius.circular(10),left: Radius.circular(10)),
          border: Border(
            bottom: BorderSide(
              color: _currentIndex == index
                  ? AppColors.primaryColor
                  : AppColors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: _currentIndex == index
                  ? AppColors.blackNormalTextColor
                  : AppColors.greyCol,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
