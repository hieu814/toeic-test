import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;
const int RESPOND_SUCCESS = 200;

enum MenuState { home, favourite, message, profile }

enum UserRole { ADMIN, USER, TEA }

enum DeviceType { Mobile, Tablet, Web }

const kColorFimary = Color(0xFF2697FF);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kBorderRadius = 10.0;
const kSpacing = 20.0;
const String messageRegex = '^"message":".*"\$';
const String placeholderUrl =
    "https://2dbags.co/wp-content/uploads/revslider/lookbook1-demo_slider/placeholder-38329_1080x675.jpg";

class MyConfig {
  static const String appName = "Shopping App";
  static const String apiURL = '192.168.2.14:1337'; //PROD_URL
  static const loginAPI = "/auth/local";
  static const registerAPI = "/auth/local/register";
  static const userProfileAPI = "/users/user-Profile";
  static const groupExam = "/group-exams";
  static const exam = "/exams";
  static const getExamType = "/part-types";
  static const questions = "/questions";
  static const questionType = "/question-types";
  static const userInfors = "/user-infors"; //user_infors
  static const vocabularies = "vocabularies"; // /group-vocabularies
  static const groupVocabularies = "/group-vocabularies";
  static const changePassword = "/custom/change-password";
}

class CacheInfor {
  static const String authCache = "login_details";
}

class QuestionType {
  static const String part1 = "listening.part-1-photographs";
  static const String part2 = "listening.part-2-question-response";
  static const String part3 = "listening.part-3-4-conversations-short-talks";
  static const String part4 = "login_details";
  static const String part5 = "login_details";
  static const String part6 = "login_details";
  static const String part7 = "login_details";
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

Color invert(Color color) {
  final r = 255 - color.red;
  final g = 255 - color.green;
  final b = 255 - color.blue;

  return Color.fromARGB((color.opacity * 255).round(), r, g, b);
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

final List<String> randomColor = [
  "#FFFACD",
  "#4B0082",
  "#FAFAD2",
  "#48D1CC",
  "#008080",
  "#008B8B",
  "#FFDAB9",
  "#90EE90",
  "#FA8072",
  "#9966CC",
  "#FF6347",
  "#8A2BE2",
  "#8FBC8F",
  "#000000",
  "#E9967A",
  "#BDB76B",
  "#B0C4DE",
  "#87CEEB",
  "#40E0D0",
  "#FFE4B5",
  "#FF69B4",
  "#32CD32",
  "#7B68EE",
  "#A0522D",
  "#DCDCDC",
  "#B22222",
  "#F5F5DC",
  "#0000FF",
  "#4169E1",
  "#B0E0E6",
  "#8B008B",
  "#2E8B57",
  "#6A5ACD",
  "#DDA0DD",
  "#FFC0CB",
  "#FFE4C4",
  "#4682B4",
  "#FFD700",
  "#1E90FF",
  "#D2691E",
  "#7FFF00",
  "#6495ED",
  "#C71585",
  "#00FFFF",
  "#E0FFFF",
  "#BA55D3",
  "#F0FFF0",
  "#9ACD32",
  "#00FA9A",
  "#A52A2A",
  "#6B8E23",
  "#FF7F50",
  "#7CFC00",
  "#20B2AA",
  "#00BFFF",
  "#B8860B",
  "#DA70D6",
  "#ADD8E6",
  "#FFFFE0",
  "#FF0000",
  "#FFF8DC",
  "#A9A9A9",
  "#FF1493",
  "#CD5C5C",
  "#556B2F",
  "#000080",
];
