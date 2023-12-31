import 'package:flutter/material.dart';
import 'package:info_web_app/res/common_components/app_string.dart';

class BottomCompanySection extends StatelessWidget {
  const BottomCompanySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.company,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          AppStrings.aboutUs,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          AppStrings.contactUs,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
