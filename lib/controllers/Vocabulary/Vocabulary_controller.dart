import 'dart:convert';

import 'package:get/get.dart';

import '../../model/models.dart';
import '../../modules/moduls.dart';
import '../../utils/common_function.dart';
import '../../utils/constant.dart';

class VocabularyController extends GetxController {
  static VocabularyController instance = Get.find();
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

  List<String> getGroupVocaBulary() {
    return List<String>.from(groupVocabulary.groupVocabularies!.map((element) {
      return element.title;
    }));
  }
}
