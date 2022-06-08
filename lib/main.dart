import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toeic/screens/CommonScreen/notFound.dart';
import 'package:toeic/screens/User/components/EditUser.dart';
import 'package:toeic/screens/User/profile_screen.dart';
import 'package:toeic/screens/Vocabulary/GroupVocabulary.dart';
import 'package:toeic/screens/Vocabulary/Vocabulary.dart';
import 'package:toeic/screens/exam/GroupExam.dart';
import 'controllers/controllers.dart';
import 'injection.dart';
import 'modules/UserService.dart';
import 'router/RouteName.dart';
import 'screens/CommonScreen/initialScreen.dart';
import 'screens/User/components/ChangePass_view.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/signin.dart';
import 'screens/login/signup.dart';
import 'utils/constant.dart';

//Get.to(NextScreen());
bool isAuthenticated = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  isAuthenticated = await locator<UserService>().isLogged();
  Get.put(AuthController());
  Get.put(VocabularyController());
  Get.put(AudioPlayerController());
  Get.put(ExamController());
  //AudioPlayerController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: kColorFimary,
            secondary: kSecondaryColor,
          ),
          appBarTheme: AppBarTheme(
              // color: kColorFimary,
              backgroundColor: kSecondaryColor,
              foregroundColor: Colors.white //here you can give the text color
              )),
      initialRoute: RouteName.initialScreen,
      unknownRoute: GetPage(name: '/notfound', page: () => NotFoundScreen()),
      getPages: [
        GetPage(
            name: RouteName.profileScreen, page: () => const ProfileScreen()),
        GetPage(name: RouteName.loginScreen, page: () => const Signin()),
        GetPage(name: RouteName.signUpScreen, page: () => const SignUp()),
        GetPage(
            name: RouteName.initialScreen, page: () => const InitialScreen()),
        GetPage(
            name: RouteName.homeScreen,
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<HomeController>(() => HomeController());
            }),
            // middlewares:  AuthMiddleware(),

            transition: Transition.zoom),
        GetPage(
            name: RouteName.editUserInfor, page: () => const EditUserScreen()),
        GetPage(
            name: RouteName.changePassword,
            page: () => const ChangePassScreen()),
        GetPage(
            name: RouteName.groupVocabulary,
            page: () => const GroupVocabulary(),
            // binding: BindingsBuilder(() {
            //   Get.lazyPut<VocabularyController>(() => VocabularyController());
            // }),

            transition: Transition.zoom),
        GetPage(name: RouteName.vocabulary, page: () => const Vocabulary()),
        GetPage(name: RouteName.groupExam, page: () => const GroupExam()),
      ],
    );
  }
}
