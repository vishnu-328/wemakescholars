import 'package:get/route_manager.dart';
import 'package:wemakescholars/screens/home.dart';
import 'package:wemakescholars/screens/login.dart';
import 'package:wemakescholars/screens/onboarding.dart';
import 'package:wemakescholars/screens/signup.dart';

class RoutesClass {
  static String spalsh = '/';
  static String getRoutePage() => spalsh;
  static List<GetPage> routes = [
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: '/onboarding',
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignupPage(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
  ];
}
