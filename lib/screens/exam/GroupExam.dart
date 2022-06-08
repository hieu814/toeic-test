import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../router/RouteName.dart';
import '../../utils/constant.dart';

class GroupExam extends GetView<ExamController> {
  final String? title;
  const GroupExam({
    Key? key,
    this.title,
  }) : super(key: key);
//HomeTitleCard
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exams"),
      ),
      body: Obx(() => Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
              itemCount: controller.groupExam.groupexams!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: VocabularyCard(
                        color: randomColor[index],
                        press: () async {
                          Get.toNamed(RouteName.vocabulary,
                              arguments:
                                  controller.groupExam.groupexams![index]);
                        },
                        text:
                            controller.groupExam.groupexams![index].name ?? ""),
                  ),
                  onTap: () {},
                );
              },
            ),
          )),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}

class VocabularyCard extends StatelessWidget {
  const VocabularyCard(
      {Key? key, required this.text, required this.press, this.color})
      : super(key: key);

  final String? text, color;
  final GestureTapCallback press;
//'assets/images/place_holder.jpg',
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: getProportionateScreenWidth(55) * 10,
          child: Column(
            children: [
              Container(
                // padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                height: 60,
                width: getProportionateScreenWidth(55) * 10,
                decoration: BoxDecoration(
                  color: Colors.grey, //HexColor(color ?? "#FFFFFF"),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/icons/exam_icon.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      text!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: invert(HexColor(color ?? "#FFFFFF"))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
