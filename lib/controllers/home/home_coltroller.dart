import 'dart:convert';

import 'package:get/get.dart';

import '../../model/models.dart';
import '../../modules/moduls.dart';
import '../../utils/common_function.dart';
import '../../utils/constant.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  final _count = 0.obs;
  int get count => _count.value;
  void increase() {
    _count.value++;
  }

  final Rx<GroupExam> _groupExam = Rx<GroupExam>(GroupExam(groupexams: []));
  final Rx<GroupVocabulary> _groupVocabulary =
      Rx<GroupVocabulary>(GroupVocabulary(groupVocabularies: []));

  GroupVocabulary get groupVocabulary => _groupVocabulary.value;

  @override
  void onInit() async {
    super.onInit();

    await APIService.requestGET(MyConfig.groupVocabularies).then((respond) {
      if (CommonFunction.checkHttpRespond(respond)) {
        _groupVocabulary.value = GroupVocabulary.fromJson(
            json.decode('{"group-vocabularies":${respond.body}}'));
      }
    });

    // checLogin();
  }
}
