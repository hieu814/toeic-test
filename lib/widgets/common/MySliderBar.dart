import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../modules/UserService.dart';
import '../../utils/constant.dart';
import '../widgets.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().getUser();
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.username ?? ""),
            accountEmail: Text(user.email ?? ""),
            onDetailsPressed: () {},
            otherAccountsPictures: [
              IconButton(
                  onPressed: () async {
                    Get.find<AuthController>().logOut();
                  },
                  icon: const Icon(Icons.logout_outlined))
            ],
            currentAccountPicture: CircleAvatar(
              child: DisplayCircleImage(
                url: "",
              ),
            ),
          ),
          DrawerListTile(
            title: "Đóng góp bài giảng",
            icon: Icons.abc_sharp,
            press: () {},
          ),
          DrawerListTile(
            title: "Mở bài giảng",
            icon: Icons.abc_sharp,
            press: () async {},
          ),
          DrawerListTile(
            title: "Thư viện",
            icon: Icons.abc_sharp,
            press: () async {},
          ),
          DrawerListTile(
            title: "Cài đặt",
            icon: Icons.settings,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback? press;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon ?? Icons.warning,
        color: Colors.black,
      ),
      title: Text(
        title,
        //style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
