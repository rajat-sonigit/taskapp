import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanger/colors/app_colors.dart';
import 'package:taskmanger/widgets/btnwidget.dart';

class TaskWi extends StatelessWidget {
  const TaskWi({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Material(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/addtask.jpg"))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
              )
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          TextField(
              maxLines: 1,
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textHolder,
                hintText: "Task Name",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1)),
              )),
          SizedBox(height: MediaQuery.of(context).size.height / 22),
          TextField(
              maxLines: 7,
              controller: detailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textHolder,
                hintText: "Task Details ",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1)),
              )),
          SizedBox(height: MediaQuery.of(context).size.height / 22),
          const Btnwidget(
              color: AppColors.secondaryColor,
              text: "Add Task",
              textcolor: Colors.white)
        ]),
      ),
    );
  }
}
