import 'package:flutter/material.dart';
import 'package:info_web_app/res/common_components/app_string.dart';

class BottomCopyrightSection extends StatelessWidget {
  const BottomCopyrightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(
          color: Colors.white30,
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(
              AppStrings.copyRightwthicn,
              style: TextStyle(color: Colors.white),
            )),
            Flexible(
                child: Text(
              AppStrings.rights,
              style: TextStyle(color: Colors.white),
            )),
          ],
        )
      ],
    );
    
  }
}
