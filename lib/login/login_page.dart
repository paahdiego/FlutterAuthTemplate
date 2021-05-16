import 'package:authtemplate/core/core.dart';
import 'package:authtemplate/login/widgets/background.dart';
import 'package:authtemplate/shared/widgets/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceScreenSize dss = DeviceScreenSize(mediaQuery: MediaQuery.of(context));

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            SvgPicture.asset(
              AppIcons.login,
              height: dss.displayHeight * 0.35,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: dss.defaultPadding,
              child: RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: dss.defaultPadding,
              child: RoundedInputField(
                hintText: "Password",
                icon: Icons.lock,
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
