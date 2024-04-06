import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanger/colors/app_colors.dart';
import 'package:taskmanger/screens/alltask.dart';
import 'package:taskmanger/screens/task.dart';
import 'package:taskmanger/widgets/btnwidget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/welcome.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: const TextSpan(
                    text: "Hello",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: "\nLet's Start your Day ,with an Slime ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  )
                ])),
            SizedBox(height: MediaQuery.of(context).size.height / 2),
            InkWell(
              onTap: () {
                Get.to(() => const Alltask(),
                    transition: Transition.fade,
                    duration: const Duration(seconds: 1));
              },
              child: const Btnwidget(
                  color: AppColors.mainColor,
                  text: "View All",
                  textcolor: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 22,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const TaskWi(),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 500));
              },
              child: const Btnwidget(
                  color: Colors.white,
                  text: "Add Task",
                  textcolor: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
