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
import 'package:info_web_app/res/custom_widget/onboarding/mobile_login_form.dart';
import 'package:info_web_app/res/custom_widget/onboarding/move_below_button.dart';
import 'package:info_web_app/res/custom_widget/onboarding/sign_up_form.dart';
import 'package:info_web_app/res/custom_widget/onboarding/verify_otp_form.dart';
import 'package:info_web_app/res/provider/auth_forms.dart';
import 'package:provider/provider.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});
  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  final ScrollController myscroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 233, 246),
      body: SingleChildScrollView(
        controller: myscroll,
        child: Stack(
          children: [
            const Positioned(
                left: 0,
                child:
                    Image(image: AssetImage('assets/image/Rectangle620.png'))),
            const Positioned(
                right: 0,
                child: Image(
                    width: 620,
                    image: AssetImage('assets/image/Rectangle4.png'))),
            Positioned(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage('assets/image/Frame1.png')),
                            const Padding(padding: EdgeInsets.only(top: 180)),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Meet Your Best\n',
                                        style: TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.w900,
                                            color:
                                                Colors.black.withOpacity(0.8))),
                                    const TextSpan(
                                        text: 'Connections',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 7, 99, 198),
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold))
                                  ])),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  const Text(
                                    AppStrings.build,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const Row(
                                    children: [
                                      Image(
                                          height: 100,
                                          width: 170,
                                          image: AssetImage(
                                              'assets/image/App Store.png')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Image(
                                          height: 100,
                                          width: 170,
                                          image: AssetImage(
                                              'assets/image/Google Play.png')),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 150, top: 100),
                              child: Container(
                                height: 100,
                                width: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 7, 99, 198)),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                      onTap: () {
                                        myscroll.animateTo(
                                          MediaQuery.of(context).size.height -
                                              55,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      child: const ScrollDownImage()),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const Form1(
                      //   width1: 500,
                      //   margin1: EdgeInsets.only(top: 100),
                      // ),
                      Consumer<AuthFormProvider>(
                        builder: (context, value, child) {
                          switch (value.currentForm) {
                            case AuthFormType.login:
                              return Form1(
                                width1: 500,
                                margin1: const EdgeInsets.only(top: 100),
                              );
                            case AuthFormType.signup:
                              return SignUpForm(
                                width1: 500,
                                margin1:const EdgeInsets.only(top: 100),
                              );

                             case AuthFormType.mobileLogin:
                               return MobileLogin(
                                width1: 500,
                                margin1:const EdgeInsets.only(top: 100),
                               ); 
                              case AuthFormType.verifyOtp:
                               return const VerifyOTP(
                                width1: 500,
                                margin1: EdgeInsets.only(top: 100),
                               ); 
                            default:
                              return  Form1(
                                width1: 500,
                                margin1: const EdgeInsets.only(top: 100),
                              );
                          }
                        },
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 140)),
                  const InfoRichtext(),
                  const Padding(padding: EdgeInsets.only(top: 80)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Cards(
                        height1: 250,
                        width1: MediaQuery.of(context).size.width * 0.2,
                        icon1: Icons.feed,
                        title1: AppStrings.cardTitle1,
                        subtitle: AppStrings.cardSubTitle1,
                      ),
                      Cards(
                        height1: 250,
                        width1: MediaQuery.of(context).size.width * 0.2,
                        icon1: Icons.connect_without_contact,
                        title1: AppStrings.cardTitle2,
                        subtitle: AppStrings.cardSubTitle2,
                      ),
                      Cards(
                        height1: 250,
                        width1: MediaQuery.of(context).size.width * 0.2,
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
                                height: 400,
                                image: AssetImage('assets/image/Frame2.png'))),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RichText1(
                              width1: MediaQuery.of(context).size.width * 0.3,
                              span1: AppStrings.you,
                              span2: AppStrings.multi,
                              span3: AppStrings.foryou,
                              bodytext: AppStrings.domain,
                            ),
                            Image.asset(
                              'assets/image/Frame3.png',
                              height: 400,
                              width: 400,
                            )
                          ],
                        )
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
                                height: 300,
                                // width: 250,
                                image: AssetImage('assets/image/Frame4.png'))),
                        Positioned(
                            child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/image/Creative.png',
                                height: 400,
                                width: 400,
                              ),
                              RichText1(
                                width1: MediaQuery.of(context).size.width * 0.3,
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
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                        height: 100,
                                        width: 170,
                                        image: AssetImage(
                                            'assets/image/Google Play.png')),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Image(
                                        height: 100,
                                        width: 170,
                                        image: AssetImage(
                                            'assets/image/App Store.png')),
                                  ],
                                ),
                              ],
                            ),
                            Image(
                              image: AssetImage('assets/image/Transfer.png'),
                              height: 400,
                              width: 400,
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Image(
                        image: AssetImage('assets/image/World.png'),
                        width: 500,
                        height: 500,
                      ),
                      RichText1(
                        width1: MediaQuery.of(context).size.width * 0.3,
                        span1: AppStrings.make,
                        bodytext: AppStrings.best,
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          color: const Color.fromARGB(255, 217, 233, 246),
                          width: MediaQuery.of(context).size.width,
                          height: 420,
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.08,
                            child: Container(
                              // height: MediaQuery.of(context).size.height * 0.7,
                              width: MediaQuery.of(context).size.width,
                              color: const Color.fromARGB(255, 7, 99, 198),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 100,
                                      left: 40,
                                      bottom: 20,
                                      right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const BottomLogoSection(),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const BottomFeatureSection(),
                                              //divider
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              Container(
                                                height: 170,
                                                width: 1,
                                                color: Colors.white30,
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              const BottomLinkSection(),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              Container(
                                                height: 170,
                                                width: 1,
                                                color: Colors.white30,
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              const BottomCompanySection(),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              Container(
                                                height: 170,
                                                width: 1,
                                                color: Colors.white30,
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              const BottomHelpSection(),
                                            ],
                                          )
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 20)),
                                      const BottomCopyrightSection()
                                    ],
                                  )),
                            )),
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 130,
                            child: Card(
                              surfaceTintColor: Colors.white,
                              elevation: 12,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                AppStrings.freeInfoprofile,
                                                style: TextStyle(
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 99, 198)),
                                              ),
                                              const Expanded(child: SizedBox()),
                                              Row(
                                                children: [
                                                  const Text(
                                                    AppStrings.logIn,
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationColor:
                                                            Color.fromARGB(255,
                                                                7, 99, 198),
                                                        color: Color.fromARGB(
                                                            255, 7, 99, 198),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    width: 30,
                                                  ),
                                                  Container(
                                                    height: 40,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 7, 99, 198),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        AppStrings.signup,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 10)),
                                          const Row(
                                            children: [
                                              BottomCardFields(
                                                  checktext: AppStrings
                                                      .multipleProfile),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              BottomCardFields(
                                                  checktext:
                                                      AppStrings.creatives),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              BottomCardFields(
                                                  checktext: AppStrings
                                                      .buildConnections),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
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
