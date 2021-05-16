import 'package:authtemplate/core/core.dart';
import 'package:authtemplate/splash/widgets/bouncing_effect.dart';
import 'package:authtemplate/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    /* Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    }); */

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.kPrimaryColor),
        child: Center(
          child: BouncingEffect(
            child: SvgPicture.asset(AppIcons.chat),
            animationValue: 20,
          ),
        ),
      ),
    );
  }
}
