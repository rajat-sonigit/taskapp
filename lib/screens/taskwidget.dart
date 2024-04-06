import 'package:flutter/material.dart';
import 'package:taskmanger/colors/app_colors.dart';

class TaskWiget extends StatelessWidget {
  final String text;
  final Color color;
  const TaskWiget({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
          color: AppColors.textHolder, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: color),
        ),
      ),
    );
  }
}
