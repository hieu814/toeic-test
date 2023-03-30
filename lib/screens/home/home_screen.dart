import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home/home_coltroller.dart';
import '../../utils/constant.dart';
import '../../widgets/common/coustom_bottom_nav_bar.dart';
import 'components/body.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
    SizeConfig().init(context);
    return Scaffold(
      key: scaffolKey,
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
