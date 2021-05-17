import 'package:authtemplate/core/core.dart';
import 'package:authtemplate/splash/widgets/bouncing_effect.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
