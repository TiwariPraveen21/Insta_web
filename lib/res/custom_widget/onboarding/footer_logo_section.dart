import 'package:flutter/material.dart';
import 'package:info_web_app/res/common_components/app_string.dart';

class BottomLogoSection extends StatelessWidget {
  const BottomLogoSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/image/InfoProfile.png',
          scale: 2,
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        const Text(
          AppStrings.notNormal,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        const Text(
          AppStrings.services,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        const Row(
          children: [
            Image(image: AssetImage('assets/image/Facebook.png')),
            SizedBox(
              width: 20,
            ),
            Image(image: AssetImage('assets/image/LinkedInbottom.png')),
            SizedBox(
              width: 20,
            ),
            Image(image: AssetImage('assets/image/Insta.png')),
          ],
        ),
      ],
    );
  }
}
