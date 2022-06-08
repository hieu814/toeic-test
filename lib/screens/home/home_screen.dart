import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toeic/widgets/common/MySliderBar.dart';

import '../../controllers/home/home_coltroller.dart';
import '../../modules/moduls.dart';
import '../../router/RouteName.dart';
import '../../utils/common_function.dart';
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
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
