import 'package:flutter/material.dart';

class AppImages {
  static String get loginBottom => "assets/images/login_bottom.png";
  static String get mainBottom => "assets/images/main_bottom.png";
  static String get mainTop => "assets/images/main_top.png";
  static String get signupTop => "assets/images/signup_top.png";

  static Future<void> loadCache(BuildContext context) {
  
    return Future.wait([
      precacheImage(Image.asset(AppImages.loginBottom).image, context),
      precacheImage(Image.asset(AppImages.mainBottom).image, context),
      precacheImage(Image.asset(AppImages.signupTop).image, context),
      precacheImage(Image.asset(AppImages.mainTop).image, context),
    ]);
  }
}
