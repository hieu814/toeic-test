import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toeic/utils/constant.dart';

class CommonFunction {
  static void showLoadingDialog() {
    Get.dialog(Dialog(
      // The background color
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            // The loading indicator
            CircularProgressIndicator(),
            SizedBox(
              height: 15,
            ),
            // Some text
            Text('Loading...')
          ],
        ),
      ),
    ));
  }

  static bool checkHttpRespond(dynamic respond) {
    if (respond.statusCode == RESPOND_SUCCESS) {
      return true;
    } else {
      Get.defaultDialog(
          title: "Error",
          middleText: getErrorRespondMessage(respond.body),
          onConfirm: () {
            Get.back();
          });
      return false;
    }
  }

  static void showPopup(String title) {
    Get.defaultDialog(
        middleText: title,
        onConfirm: () {
          Get.back();
        });
  }

  static String getErrorRespondMessage(String body) {
    String sub = '"message":"';
    if (body.contains(sub)) {
      String data = body.substring(body.indexOf(sub) + sub.length, body.length);
      if (data.isNotEmpty) {
        return (data.split('"')[0]);
      }
    }
    return "";
  }
}
