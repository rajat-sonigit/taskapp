import 'package:flutter/material.dart';

class Btnwidget extends StatelessWidget {
  final Color color;
  final String text;
  final Color textcolor;

  const Btnwidget(
      {Key? key,
      required this.color,
      required this.text,
      required this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 25, color: textcolor),
        ),
      ),
    );
  }
}
