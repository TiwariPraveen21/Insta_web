
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyConnectionsListBox extends StatelessWidget{
  const EmptyConnectionsListBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
                child: Image.asset("assets/image/empty.png"))
        ],
      ),
      ),
    );
  }
}

