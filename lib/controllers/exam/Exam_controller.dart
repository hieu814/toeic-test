import 'dart:convert';

import 'package:get/get.dart';

import '../../model/models.dart';
import '../../modules/moduls.dart';
import '../../utils/common_function.dart';
import '../../utils/constant.dart';

class ExamController extends GetxController {
  static ExamController instance = Get.find();
  final Rx<GroupExam> _groupExam = Rx<GroupExam>(GroupExam(groupexams: []));
  GroupExam get groupExam => _groupExam.value;

  @override
  void onInit() async {
    super.onInit();
    await APIService.requestGET(MyConfig.groupExam).then((respond) {
      if (CommonFunction.checkHttpRespond(respond)) {
        _groupExam.value =
            GroupExam.fromJson(json.decode('{"groupexams":${respond.body}}'));
      }
    });

    // checLogin();
  }
}
