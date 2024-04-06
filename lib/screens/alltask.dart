import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanger/colors/app_colors.dart';
import 'package:taskmanger/screens/taskwidget.dart';
import 'package:taskmanger/widgets/btnwidget.dart';

class Alltask extends StatelessWidget {
  const Alltask({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = ["Try harder", "Try Smarter"];
    final leftEdit = Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color.fromARGB(255, 3, 37, 65).withOpacity(0.7),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
    final rightEdit = Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color.fromARGB(255, 151, 27, 27).withOpacity(0.7),
      child: const Icon(
        Icons.delete_forever,
        color: Colors.white,
      ),
    );

    return Scaffold(
        body: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: MediaQuery.of(context).size.height / 3.2,
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 20, top: 40),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/header1.jpg"))),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: const Row(children: [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.home,
              color: AppColors.secondaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.add,
              color: AppColors.secondaryColor,
            ),
            SizedBox(
              width: 200,
            ),
            Icon(
              Icons.calendar_month_sharp,
              color: AppColors.secondaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "2",
              style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),
            )
          ]),
        ),
        Flexible(
          child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: leftEdit,
                  secondaryBackground: rightEdit,
                  onDismissed: (DismissDirection direction) {
                    print("Afer Dismiss");
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      showBottomSheet(
                          context: context,
                          builder: (_) {
                            return Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 33, 23, 90),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              height: 550,
                              child: const Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Btnwidget(
                                          color: AppColors.mainColor,
                                          text: "view",
                                          textcolor: Colors.white),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Btnwidget(
                                          color: AppColors.mainColor,
                                          text: "Edit",
                                          textcolor: Colors.white)
                                    ]),
                              ),
                            );
                          });
                      return false;
                    } else {
                      return Future.delayed(const Duration(seconds: 1),
                          () => direction == DismissDirection.endToStart);
                    }
                  },
                  key: ObjectKey(index),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TaskWiget(
                      text: myData[index],
                      color: Colors.blueGrey,
                    ),
                  ),
                );
              }),
        )
      ],
    ));
  }
}
