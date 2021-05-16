import 'package:authtemplate/core/core.dart';
import 'package:authtemplate/home/home.dart';
import 'package:authtemplate/shared/controllers/auth.dart';
import 'package:authtemplate/splash/splash_page.dart';
import 'package:authtemplate/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

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
        return Consumer<AuthController>(
          builder: (context, authController, _) {
            print(authController.state);
            if (authController.state == AuthState.authenticated) {
              return HomePage();
            } else if (authController.state == AuthState.notAuthenticated) {
              return WelcomePage();
            } else {
              return SplashPage();
            }
          },
        );
      }),
    );
  }
}
