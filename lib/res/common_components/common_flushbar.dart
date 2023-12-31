import 'dart:async';
import 'package:flutter/material.dart';
class CustomToast {
  static void showToast(BuildContext context, String message) {
    OverlayEntry overlayEntry;
    OverlayState overlay = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: 16.0,
        left: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style:const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Timer(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}