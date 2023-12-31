import 'package:flutter/material.dart';
class Responsive extends StatelessWidget{
  final dynamic mobileScreen;
  final  dynamic tabletScreen;
  final  dynamic desktopScreen;
  
  const Responsive({super.key,
  required this.mobileScreen,
  required this.tabletScreen,
  required this.desktopScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
    builder:(context, constraints){
      if (constraints.maxWidth < 700) {
        //Mobile layout
        return mobileScreen;
      }

      else if (constraints.maxWidth >= 700 && constraints.maxWidth<900){
        //Desktop or large tablet layout
        return tabletScreen;
      }
      else{
        //Small tablets and medium sized desktops
        return desktopScreen;
      }
    }
  );
  }
  
}