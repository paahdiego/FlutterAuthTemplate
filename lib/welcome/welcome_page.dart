import 'package:authtemplate/core/core.dart';
import 'package:authtemplate/login/login_page.dart';
import 'package:authtemplate/shared/widgets/rounded_button.dart';
import 'package:authtemplate/welcome/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    DeviceScreenSize dss = DeviceScreenSize(mediaQuery: MediaQuery.of(context));

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Edu".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              SvgPicture.asset(
                "assets/icons/chat.svg",
                height: dss.displayHeight * 0.45,
              ),
              SizedBox(
                height: 50,
              ),
              RoundedButton(
                child: Text("LOGIN"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                child: Text("SIGN UP"),
                color: AppColors.kPrimaryLightColor,
                textColor: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
