import 'package:flutter/material.dart';
import 'package:info_web_app/res/common_components/app_string.dart';

class MeetYourBest extends StatelessWidget {
  const MeetYourBest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          AppStrings.title1,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.08, 
              fontWeight: FontWeight.w900,color: Colors.black.withOpacity(0.8)),
        ),
          Text(
          AppStrings.title2,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.08,
              fontWeight: FontWeight.bold,
              color:const Color.fromARGB(255, 7, 99, 198)),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
         const Text(
          AppStrings.build,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}