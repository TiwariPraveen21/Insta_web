import 'package:flutter/material.dart';
import 'package:info_web_app/res/common_components/app_string.dart';
import 'package:info_web_app/res/custom_widget/onboarding/cards.dart';
import 'package:info_web_app/res/common_components/info_richtext.dart';
import 'package:info_web_app/res/common_components/rich_text.dart';
import 'package:info_web_app/res/custom_widget/onboarding/footer_card_fields.dart';
import 'package:info_web_app/res/custom_widget/onboarding/footer_company_section.dart';
import 'package:info_web_app/res/custom_widget/onboarding/footer_copyright_section.dart';
import 'package:info_web_app/res/custom_widget/onboarding/footer_feature_section.dart';
import 'package:info_web_app/res/custom_widget/onboarding/footer_help_section.dart';
import 'package:info_web_app/res/custom_widget/onboarding/footer_link_section.dart';
import 'package:info_web_app/res/custom_widget/onboarding/footer_logo_section.dart';
import 'package:info_web_app/res/custom_widget/onboarding/login_form.dart';
import 'package:info_web_app/res/custom_widget/onboarding/meet_your_best.dart';


class MobilePage extends StatefulWidget {
  const MobilePage({super.key});
  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 217, 233, 246),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const Positioned(
                  left: 0,
                  child: Image(
                      image: AssetImage('assets/image/Rectangle620.png'))),
              Positioned(
                  right: 0,
                  top: 70,
                  child: Image(
                      width: MediaQuery.of(context).size.width * 0.95,
                      image: const AssetImage('assets/image/Rectangle4.png'))),
              Positioned(
                  child: Column(
                children: [
                  const Image(image: AssetImage('assets/image/Frame1.png')),
                  const SizedBox(
                    child: Align(
                      alignment: Alignment.center,
                      child: MeetYourBest(),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Form1(
                    width1: MediaQuery.of(context).size.width * 0.9,
                    margin1: null,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          image:
                              const AssetImage('assets/image/App Store.png')),
                      const SizedBox(
                        width: 20,
                      ),
                      Image(
                          //height: 150,
                          //width: 140,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          image:
                              const AssetImage('assets/image/Google Play.png')),
                    ],
                  ),
                  const InfoRichtext(),
                  const Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Cards(
                        height1: 250,
                        width1: 200,
                        icon1: Icons.feed,
                        title1: AppStrings.cardTitle1,
                        subtitle: AppStrings.cardSubTitle1,
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Cards(
                        height1: 250,
                        width1: 200,
                        icon1: Icons.connect_without_contact,
                        title1: AppStrings.cardTitle2,
                        subtitle: AppStrings.cardSubTitle2,
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Cards(
                        height1: 250,
                        width1: 200,
                        icon1: Icons.person,
                        title1: AppStrings.cardTitle3,
                        subtitle: AppStrings.cardSubTitle3,
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    child: Stack(
                      children: [
                        Container(),
                        const Positioned(
                            left: 0,
                            child: Image(
                                height: 550,
                                // width: 250,
                                image: AssetImage('assets/image/Frame2.png'))),
                        Positioned(
                            child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/image/Frame3.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                              // const Padding(padding: EdgeInsets.only(top: 30)),
                              RichText1(
                                width1: MediaQuery.of(context).size.width * 0.6,
                                span1: AppStrings.you,
                                span2: AppStrings.multi,
                                span3: AppStrings.foryou,
                                bodytext: AppStrings.domain,
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    child: Stack(
                      children: [
                        Container(),
                        const Positioned(
                            right: 0,
                            top: 100,
                            child: Image(
                                height: 500,
                                // width: 250,
                                image: AssetImage('assets/image/Frame4.png'))),
                        Positioned(
                            child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/image/Creative.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                              RichText1(
                                width1: MediaQuery.of(context).size.width * 0.6,
                                span1: AppStrings.bE,
                                span2: AppStrings.creative,
                                span3: AppStrings.community,
                                bodytext: AppStrings.produce,
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    color: const Color.fromARGB(255, 7, 99, 198),
                    child: Stack(
                      children: [
                        Container(),
                        Positioned(
                            left: 0,
                            child: Image.asset(
                              'assets/image/Frame5.png',
                              height: 150,
                              width: 150,
                            )),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.asset(
                              'assets/image/Frame6.png',
                              height: 150,
                              width: 150,
                            )),
                        Positioned(
                            child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/image/Transfer.png'),
                              height: 400,
                              width: 400,
                            ),
                            const Text(
                              'Download our App from',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                    //height: 150,
                                    //width: 140,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    image: const AssetImage(
                                        'assets/image/Google Play.png')),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image(
                                    //height: 150,
                                    //width: 140,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    image: const AssetImage(
                                        'assets/image/App Store.png')),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  Image(
                    image: const AssetImage('assets/image/World.png'),
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                  RichText1(
                    width1: MediaQuery.of(context).size.width * 0.6,
                    span1: AppStrings.make,
                    bodytext: AppStrings.best,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          color: const Color.fromARGB(255, 217, 233, 246),
                          width: MediaQuery.of(context).size.width,
                          height: 1130,
                        ),
                        Positioned(
                            top: 150,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 3,
                              width: MediaQuery.of(context).size.width,
                              color: const Color.fromARGB(255, 7, 99, 198),
                              child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 162,
                                      left: 20,
                                      bottom: 20,
                                      right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BottomLogoSection(),
                                      Padding(
                                          padding: EdgeInsets.only(top: 30)),
                                      BottomFeatureSection(),
                                      Padding(
                                          padding: EdgeInsets.only(top: 30)),
                                      BottomLinkSection(),
                                      Padding(
                                          padding: EdgeInsets.only(top: 30)),
                                      BottomCompanySection(),
                                      Padding(
                                          padding: EdgeInsets.only(top: 30)),
                                      BottomHelpSection(),
                                      Padding(
                                          padding: EdgeInsets.only(top: 30)),
                                      BottomCopyrightSection(),
                                    ],
                                  )),
                            )),
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 280,
                            child: Card(
                              surfaceTintColor: Colors.white,
                              elevation: 12,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppStrings.freeInfoprofile,
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 7, 99, 198)),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        Row(
                                          children: [
                                            BottomCardFields(
                                              checktext:
                                                  AppStrings.multipleProfile,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        Row(
                                          children: [
                                            BottomCardFields(
                                              checktext: AppStrings.creatives,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        Row(
                                          children: [
                                            BottomCardFields(
                                              checktext:
                                                  AppStrings.buildConnections,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          AppStrings.logIn,
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: Color.fromARGB(
                                                  255, 7, 99, 198),
                                              color: Color.fromARGB(
                                                  255, 7, 99, 198),
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                          //height: 50,
                                          //width: 130,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 7, 99, 198),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              AppStrings.signup,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}


