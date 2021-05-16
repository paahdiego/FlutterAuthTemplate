import 'package:authtemplate/core/core.dart';
import 'package:authtemplate/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: "AuthTemplate",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.kPrimaryColor,
        scaffoldBackgroundColor: AppColors.white,
      ),
      home: LayoutBuilder(builder: (context, constraints) {
        DeviceScreenSize dss =
            DeviceScreenSize(mediaQuery: MediaQuery.of(context));
        return SplashPage(
          animationValue: dss.defaultPaddingValue,
        );
      }),
    );
  }
}
