import 'package:get/get.dart';
import '../../model/AuthUser.dart';
import '../../model/User.dart';
import '../../modules/moduls.dart';
import '../../router/RouteName.dart';

import '../../utils/common_function.dart';
import '../../utils/constant.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  bool isLogged = false;
  late Rx<AuthUser?> _currentUser;
  bool get isLogin => isLogged;
  @override
  void onInit() async {
    super.onInit();
    await locator<UserService>().isLogged().then((isLogged) {
      print("AuthController is auth $isLogged");
      if (!isLogged) {
        Get.offAllNamed(RouteName.loginScreen);
      } else {
        _currentUser = Rx<AuthUser?>(locator<UserService>().currentUser);
        Get.offAllNamed(RouteName.homeScreen);
      }
    });
    // checLogin();
  }

  void checLogin() async {
    await locator<UserService>().isLogged().then((isLogged) {
      if (isLogged) {
        isLogged = true;
        Get.offAllNamed(RouteName.loginScreen);
      } else {
        isLogged = false;
        Get.offAllNamed(RouteName.homeScreen);
      }
    });
  }

  User getUser() {
    User user = User(username: "", email: "");
    if (locator<UserService>().currentUser.user != null) {
      user = locator<UserService>().currentUser.user!;
    }
    return user;
  }

  Future<bool> register(String username, email, password) async {
    try {
      CommonFunction.showLoadingDialog();
      return APIService.requestPOST_No_Token(MyConfig.registerAPI, {
        "username": username,
        "password": password,
        "email": email
      }).then((value) {
        Get.back();
        if (CommonFunction.checkHttpRespond(value)) {
          locator<UserService>().setUser(AuthUser.fromJson(value.body));
          _currentUser = Rx<AuthUser?>(locator<UserService>().currentUser);
          print("register true");
          return true;
        }
        return false;
      });
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    try {
      CommonFunction.showLoadingDialog();
      return APIService.requestPOST_No_Token(
              MyConfig.loginAPI, {"password": password, "username": email})
          .then((value) async {
        Get.back();
        if (CommonFunction.checkHttpRespond(value)) {
          locator<UserService>().setUser(AuthUser.fromJson(value.body));
          print(value.body);
          _currentUser = Rx<AuthUser?>(locator<UserService>().currentUser);
          return true;
        }
        return false;
      });
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> changePassword(
      String oldPass, String newPass, String confirmPass) {
    return APIService.requestPOST(MyConfig.changePassword, {
      "currentPassword": oldPass,
      "newPassword": newPass,
      "confirmNewPassword": confirmPass
    }).then((value) async {
      Get.back();
      if (CommonFunction.checkHttpRespond(value)) {
        locator<UserService>().setUser(AuthUser.fromJson(value.body));
        _currentUser = Rx<AuthUser?>(locator<UserService>().currentUser);
        return true;
      }
      return false;
    });
  }

  logOut() async {
    _currentUser = Rx<AuthUser?>(AuthUser());
    await locator<UserService>().setUser(AuthUser());
    Get.offAllNamed(RouteName.loginScreen);
  }
}
