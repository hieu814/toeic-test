import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toeic/utils/common_function.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../utils/constant.dart';
import '../../../widgets/common/CommontextBox.dart';

ImagePicker? sl;
File? _image;

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  final ImagePicker _imagePicker = ImagePicker();
  String? oldPassword, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      retrieveLostData();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: Form(
            key: _key,
            child: formUI(),
          ),
        ),
      ),
    );
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _imagePicker.getLostData();
    if (response == null) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image = File(response.file!.path);
      });
    }
  }

  Widget formUI() {
    return Column(
      children: <Widget>[
        const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Đổi mật khẩu',
              style: TextStyle(
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            )),
        CommonTextBox(
          labelText: "Old password",
          onSaved: (val) {
            oldPassword = val;
          },
        ),
        CommonTextBox(
          labelText: "New password",
          onSaved: (val) {
            password = val;
          },
        ),
        CommonTextBox(
          labelText: "Confrim password",
          onSaved: (val) {
            confirmPassword = val;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 40.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: RaisedButton(
              color: kColorFimary,
              child: Text(
                'Đổi mật khẩu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              textColor: Colors.white,
              splashColor: kColorFimary,
              onPressed: _sendToServer,
              padding: EdgeInsets.only(top: 12, bottom: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: kColorFimary)),
            ),
          ),
        ),
      ],
    );
  }

  _sendToServer() async {
    _key.currentState!.save();
    await Get.find<AuthController>()
        .changePassword(
            oldPassword ?? "", password ?? "", confirmPassword ?? "")
        .then((value) {
      if (value) CommonFunction.showPopup("Doi mat Khau Thanh Cong");
    });
  }

  @override
  void dispose() {
    _image = null;
    super.dispose();
  }
}
