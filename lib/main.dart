import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanger/screens/datacontrollers.dart';
import 'package:taskmanger/screens/homescreen.dart';

void main() {
  Get.lazyPut(() => DataControllers());
  Get.find<DataControllers>().getData();
  runApp(const GetMaterialApp(
    home: Scaffold(
      body: Homescreen(),
    ),
  ));
}
