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


class TabletPage extends StatefulWidget {
  const TabletPage({super.key});
  @override
  State<TabletPage> createState() => _TabletPageState();
}

class _TabletPageState extends State<TabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 233, 246),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Positioned(
                left: 0,
                child:
                    Image(image: AssetImage('assets/image/Rectangle620.png'))),
            const Positioned(
                right: 0,
                child: Image(image: AssetImage('assets/image/Rectangle4.png'))),
            Positioned(
                child: Center(
              child: Column(
                children: [
                  const Image(image: AssetImage('assets/image/Frame1.png')),
                  const SizedBox(
                    child: Column(
                      children: [
                        // RichText(
                        //     text: TextSpan(children: [
                        //   TextSpan(
                        //       text: 'Meet Your Best\n',
                        //       style: TextStyle(
                        //           fontSize: 50,
                        //           fontWeight: FontWeight.w900,
                        //           color: Colors.black.withOpacity(0.8))),
                        //   const TextSpan(
                        //       text: '\t\tConnections',
                        //       style: TextStyle(
                        //           color: Color.fromARGB(255, 7, 99, 198),
                        //           fontSize: 50,
                        //           fontWeight: FontWeight.bold))
                        // ])),
                        // const Padding(padding: EdgeInsets.only(top: 20)),
                        // const Text(
                        //   AppStrings.build,
                        //   style: TextStyle(fontSize: 15),
                        // ),
                        MeetYourBest(),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                   Form1(
                    width1: 500,
                    margin1: null,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          height: 180,
                          width: 170,
                          image: AssetImage('assets/image/App Store.png')),
                      SizedBox(
                        width: 20,
                      ),
                      Image(
                          height: 180,
                          width: 170,
                          image: AssetImage('assets/image/Google Play.png')),
                    ],
                  ),
                  const InfoRichtext(),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  
                  Wrap(
                    runSpacing: 10.0,
                    spacing: 10.0,
                    children: [
                      Cards(
                        //height1: 315,
                        width1: MediaQuery.of(context).size.width * 0.30,
                        icon1: Icons.feed,
                        title1: AppStrings.cardTitle1,
                        subtitle: AppStrings.cardSubTitle1,
                      ),
                      Cards(
                        //height1: 315,
                        width1: MediaQuery.of(context).size.width * 0.30,
                        icon1: Icons.connect_without_contact,
                        title1: AppStrings.cardTitle2,
                        subtitle: AppStrings.cardSubTitle2,
                      ),
                      Cards(
                        //height1: 315,
                        width1: MediaQuery.of(context).size.width * 0.30,
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
                              const Padding(padding: EdgeInsets.only(top: 0)),
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
                        const Positioned(
                            child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/image/Transfer.png'),
                              height: 400,
                              width: 400,
                            ),
                            Text(
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
                                    height: 180,
                                    width: 170,
                                    image: AssetImage(
                                        'assets/image/Google Play.png')),
                                SizedBox(
                                  width: 20,
                                ),
                                Image(
                                    height: 180,
                                    width: 170,
                                    image: AssetImage(
                                        'assets/image/App Store.png')),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  const Image(
                    image: AssetImage('assets/image/World.png'),
                    width: 500,
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
                          height: 650,
                        ),
                        Positioned(
                            top: 100,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: const Color.fromARGB(255, 7, 99, 198),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 160,
                                      left: 20,
                                      bottom: 20,
                                      right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const BottomLogoSection(),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  BottomFeatureSection(),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 30)),
                                                  BottomLinkSection(),
                                                ],
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 19)),
                                              Container(
                                                height: 300,
                                                width: 1,
                                                color: Colors.white30,
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 19)),
                                              const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  BottomCompanySection(),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 30)),
                                                  BottomHelpSection(),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 20)),
                                      const BottomCopyrightSection(),
                                    ],
                                  )),
                            )),
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: 500,
                            height: 200,
                            child: Card(
                              surfaceTintColor: Colors.white,
                              elevation: 12,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      AppStrings.freeInfoprofile,
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 7, 99, 198)),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 10)),
                                    const Row(
                                      children: [
                                        BottomCardFields(
                                            checktext:
                                                AppStrings.multipleProfile),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        BottomCardFields(
                                            checktext: AppStrings.creatives),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        BottomCardFields(
                                            checktext:
                                                AppStrings.buildConnections),
                                      ],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
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
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 120,
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
                                                fontSize: 22,
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
              ),
            )),
          ],
        ),
      ),
    );
  }
}
