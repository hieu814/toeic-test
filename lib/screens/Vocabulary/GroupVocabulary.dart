import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../router/RouteName.dart';
import '../../utils/constant.dart';

class GroupVocabulary extends GetView<VocabularyController> {
  final String? title;
  const GroupVocabulary({
    Key? key,
    this.title,
  }) : super(key: key);
//HomeTitleCard
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vocabulary"),
      ),
      body: Obx(() => SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
              itemCount: controller.groupVocabulary.groupVocabularies!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: VocabularyCard(
                        color: randomColor[index],
                        press: () async {
                          Get.toNamed(RouteName.vocabulary,
                              arguments: controller
                                  .groupVocabulary.groupVocabularies![index]);
                        },
                        text: controller.groupVocabulary
                                .groupVocabularies![index].title ??
                            ""),
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
                height: getProportionateScreenWidth(55) * 2,
                width: getProportionateScreenWidth(55) * 10,
                decoration: BoxDecoration(
                  color: HexColor(color ?? "#FFFFFF"),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: invert(HexColor(color ?? "#FFFFFF"))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
