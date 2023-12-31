import 'package:flutter/material.dart';
import 'package:info_web_app/res/common_components/app_string.dart';

class BottomFeatureSection extends StatelessWidget {
  const BottomFeatureSection({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.feature,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          AppStrings.feed,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          AppStrings.makeconnection,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          AppStrings.createVisiting,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          AppStrings.createprofile,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
