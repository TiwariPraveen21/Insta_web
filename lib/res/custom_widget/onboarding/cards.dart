import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final icon1;
  final title1;
  final subtitle;
  final double? width1;
  final double? height1;
  const Cards(
      {super.key,
      this.icon1,
      this.title1,
      this.subtitle,
      this.height1,
      this.width1});
  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        debugPrint('enter');
        setState(() {
          ishover = true;
        });
      },
      onExit: (event) {
        debugPrint('exit');
        setState(() {
          ishover = false;
        });
      },
      onHover: (value) {
        setState(() {
          if (!ishover) {
            ishover = true;
          }
        });
      },
      child: Container(
        width: widget.width1,
        height: widget.height1,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            color: ishover
                ? const Color.fromARGB(255, 7, 99, 198)
                : Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: ishover
                      ? const Color.fromARGB(255, 0, 134, 244)
                      : const Color.fromARGB(255, 7, 99, 198),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    widget.icon1,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 11, bottom: 5),
                child: Text(
                  '${widget.title1}',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ishover
                          ? Colors.white
                          : const Color.fromARGB(255, 7, 99, 198)),
                ),
              ),
              Text(
                '${widget.subtitle}',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: ishover ? Colors.white30 : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
