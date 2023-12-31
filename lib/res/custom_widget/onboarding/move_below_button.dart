import 'package:flutter/material.dart';

class ScrollDownImage extends StatelessWidget {
  const ScrollDownImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Image.asset(
          'assets/image/Frame-1.png',
          scale: 1.5,
        ),
        Image.asset(
          'assets/image/Frame-2.png',
          scale: 1.5,
        ),
        Image.asset(
          'assets/image/Frame-3.png',
          scale: 1.5,
        ),
        Image.asset(
          'assets/image/Frame-3.png',
          scale: 1.5,
        ),
        
      ],
    );
  }
}
