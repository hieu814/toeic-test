import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../../model/User.dart';
import '../../../router/RouteName.dart';
import 'profile_menu.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var auth = Get.find<AuthController>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // ProfilePic(),
          buildName(auth.getUser()),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Sửa thông tin",
            icon: "assets/icons/User Icon.svg",
            press: () async {
              Get.toNamed(RouteName.editUserInfor);
            },
          ),
          ProfileMenu(
            text: "Cài đặt",
            icon: "assets/icons/Settings.svg",
            press: () {
              // Navigator.pushNamed(context, RouteName.setting);
            },
          ),
          ProfileMenu(
            text: "Đổi mật khẩu",
            icon: "", //"assets/icons/Question mark.svg",
            iconWidget: const Icon(Icons.password_sharp),
            press: () async {
              Get.toNamed(RouteName.changePassword);
            },
          ),
          ProfileMenu(
            text: "Đăng xuất",
            icon: "assets/icons/Log out.svg",
            press: () async {
              Get.find<AuthController>().logOut();
            },
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) {
    print("-------- buildName");
    return Column(
      children: [
        Text(
          user.username ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.email ?? "No email",
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
