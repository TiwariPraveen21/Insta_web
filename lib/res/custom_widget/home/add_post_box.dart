import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_web_app/res/common_components/app_color.dart';
import 'package:info_web_app/res/custom_widget/home/appImage_string.dart';
import 'package:info_web_app/res/custom_widget/home/home_style.dart';
import 'package:info_web_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class AddPostBox extends StatelessWidget {
  const AddPostBox({super.key});
  @override
  Widget build(BuildContext context) {
    //final selectImageProvider = Provider.of<SelectImageProvider>(context);
    final _homeviewModel = Provider.of<HomeViewModel>(context);
    final descController  = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
          color: AppColors.logincardColor,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Color.fromRGBO(0, 0, 0, 0.02),
              blurRadius: 21,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "update your activity",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: AppColors.blackNormalTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    height: 25,
                    width: 54,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderCol),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Post",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: AppColors.blackNormalTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Blog",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppColors.muteCol,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<HomeViewModel>(
            builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderCol, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Expanded(
                          child: TextFormField(
                            controller: descController,
                            style: AppStyle.custompoppinNormalTs,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0, vertical: 6.0),
                                  child: ClipOval(
                                      child: CachedNetworkImage(
                                    imageUrl: AppImages.defaultFemaleImg,
                                    height: 20,
                                    width: 20,
                                  )),
                                ),
                                contentPadding: const EdgeInsets.all(30),
                                hintStyle: AppStyle.sixOnezeroTs,
                                hintText: "start writing your post here",
                                border: InputBorder.none),
                            maxLines: null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Image to show when image is picked from Image picker
                    value.isPicked
                        ? Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: kIsWeb
                                        ? Image.memory(
                                            value.webImage!,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.file(value.pickedImage)),
                              ),
                              //reset image
                              Positioned(
                                right: 3,
                                top: 3,
                                child: InkWell(
                                  onTap: () {
                                    value.resetImage();
                                  },
                                  child: Container(
                                    padding:const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.logincardColor,
                                        border: Border.all(
                                            width: 2,
                                            color: AppColors.borderCol)),
                                    child: const Icon(
                                      Icons.close,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        _homeviewModel.pickImage();
                      },
                      child: const Icon(Icons.image_sharp,
                          color: Color.fromRGBO(114, 178, 249, 1))),
                  const SizedBox(
                    width: 6,
                  ),
                  const Icon(
                    Icons.video_call_outlined,
                    color: Color.fromRGBO(114, 178, 249, 1),
                    size: 30,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Icon(
                    Icons.link,
                    color: Color.fromRGBO(114, 178, 249, 1),
                    size: 30,
                  )
                ],
              ),
              InkWell(
                onTap: () async{
                      //make post
                      String desc = descController.text.toString().trim();
                      
                        await _homeviewModel.createPost(desc).then((value) {
                           desc = '';
                        });
                    },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(114, 178, 249, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "post",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

       