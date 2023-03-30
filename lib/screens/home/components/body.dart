import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toeic/screens/home/components/section_title.dart';

import '../../../controllers/controllers.dart';
import '../../../router/RouteName.dart';
import '../../../utils/constant.dart';
import 'HomeTitleCard.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends GetWidget<HomeController> {
  const Body({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            const DiscountBanner(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Obx(
              (() => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: SectionTitle(
                            title: "Full Test",
                            press: () async {
                              Get.toNamed(RouteName.groupExam);
                            }),
                      ),
                      //Get.find<VocabularyController>()
                      SizedBox(height: getProportionateScreenWidth(20)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              Get.find<ExamController>()
                                  .groupExam
                                  .groupexams!
                                  .length,
                              (index) {
                                return HomeTitleCard(
                                  press: () async {
                                    // Get.toNamed(RouteName.vocabulary,
                                    //     arguments: controller.groupVocabulary
                                    //         .groupVocabularies![index]);
                                  },
                                  color: randomColor[index + 10],
                                  text: Get.find<ExamController>()
                                      .groupExam
                                      .groupexams![index]
                                      .name,
                                ); // here by default width and height is 0
                              },
                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            const Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Obx(
              (() => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: SectionTitle(
                            title: "Vocabulary",
                            press: () async {
                              Get.toNamed(RouteName.groupVocabulary);
                            }),
                      ),
                      //Get.find<VocabularyController>()
                      SizedBox(height: getProportionateScreenWidth(20)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              Get.find<VocabularyController>()
                                  .groupVocabulary
                                  .groupVocabularies!
                                  .length,
                              (index) {
                                return HomeTitleCard(
                                  press: () async {
                                    Get.toNamed(RouteName.vocabulary,
                                        arguments: controller.groupVocabulary
                                            .groupVocabularies![index]);
                                  },
                                  color: randomColor[index + 2],
                                  text: Get.find<VocabularyController>()
                                      .groupVocabulary
                                      .groupVocabularies![index]
                                      .title,
                                ); // here by default width and height is 0
                              },
                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
