import 'package:flutter/material.dart';

class RichText1 extends StatelessWidget {
  final width1;
  final String? span1;
  final String? span2;
  final String? span3;
  final String? bodytext;
  const RichText1({super.key,this.width1,this.span1,this.span2,this.span3,this.bodytext});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text:  TextSpan(children: [
            TextSpan(
                text: span1,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            TextSpan(
                text: span2,
                style: const TextStyle(
                    color: Color.fromARGB(255, 7, 99, 198),
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
            TextSpan(
                text: span3,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ])),
          const Padding(padding: EdgeInsets.only(top: 20)),
           Text(
            '$bodytext',
            style: const TextStyle(fontWeight: FontWeight.w100, fontSize: 16,color:Colors.black),
          ),
        ],
      ),
    );
  }
}
