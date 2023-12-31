import 'package:flutter/material.dart';
import 'package:info_web_app/res/common_components/app_string.dart';

class InfoRichtext extends StatelessWidget {
  const InfoRichtext({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          AppStrings.info,
            style: TextStyle(
                wordSpacing: 2,
                letterSpacing: 1.5,
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
        RichText(
            text: const TextSpan(
              children: [
            TextSpan(
              text:AppStrings.wht,
              style: TextStyle(
                wordSpacing: 2,
                letterSpacing: 1.5,
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600)
            ),    
          TextSpan(
              text: AppStrings.provide,
              style: TextStyle(
                  wordSpacing: 2,
                  letterSpacing: 1.5,
                  color: Color.fromARGB(255, 7, 99, 198),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: AppStrings.you1,
              style: TextStyle(
                  wordSpacing: 2,
                  letterSpacing: 1.5,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black))
        ]))
      ],
    );
  }
}
