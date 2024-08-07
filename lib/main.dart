import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wemakescholars/screens/splash_screen.dart';
import 'package:wemakescholars/utils/colors.dart';
import 'package:wemakescholars/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      getPages: RoutesClass.routes,
    );
  }
}
