import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

import '../../../utils/constant.dart';
import '../../../widgets/common/CommontextBox.dart';

File? _image;

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

ImagePicker? sl;

class _EditUserScreenState extends State<EditUserScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String? fullName, phone, mobile, address;

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
          margin: new EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: Form(
            key: _key,
            autovalidateMode: _validate,
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

  _onCameraClick() {
    final action = CupertinoActionSheet(
      message: Text(
        "Add profile picture",
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Choose from gallery"),
          isDefaultAction: false,
          onPressed: () async {},
        ),
        CupertinoActionSheetAction(
          child: Text("Take a picture"),
          isDestructiveAction: false,
          onPressed: () async {
            Navigator.pop(context);
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }

  Widget formUI() {
    return Column(
      children: <Widget>[
        const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Đổi thông tin',
              style: TextStyle(
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            )),
        CommonTextBox(
          labelText: "Full name",
          onSaved: (val) {
            fullName = val;
          },
        ),
        CommonTextBox(
          labelText: "Phone",
          onSaved: (val) {
            phone = val;
          },
        ),
        CommonTextBox(
          labelText: "Address",
          onSaved: (val) {
            address = val;
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

  String? validateMobile(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value!.length == 0) {
      return "Hãy nhập số diện thoại";
    } else if (!regExp.hasMatch(value)) {
      return "Số điện thoại không đúng";
    }
    return null;
  }

  String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value!.length == 0) {
      return "Hãy nhập tên";
    } else if (!regExp.hasMatch(value)) {
      return "Tên không đúng";
    }
    return null;
  }

  _sendToServer() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
    } else {
      setState(() {
        _validate = AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _image = null;
    super.dispose();
  }
}
