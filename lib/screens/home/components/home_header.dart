import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../router/RouteName.dart';
import '../../../utils/constant.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          Expanded(child: Container()),
          IconBtnWithCounter(
            icon: Icons.analytics_outlined,
            // numOfitem: 3,
            press: () {},
          ),
          IconBtnWithCounter(
            icon: Icons.account_circle_sharp,
            // numOfitem: 3,
            press: () async {
              // Get.reset();
              Get.toNamed(RouteName.profileScreen);
            },
          ),
        ],
      ),
    );
  }
}
