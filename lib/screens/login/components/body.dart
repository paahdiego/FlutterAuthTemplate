import 'package:authtemplate/components/rounded_input_field.dart';
import 'package:authtemplate/constants.dart';
import 'package:authtemplate/screens/login/components/background.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          SizedBox(
            height: 40,
          ),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(
            height: 20,
          ),
          RoundedInputField(
            hintText: "Password",
            icon: Icons.lock,
            onChanged: (value) {
              print(value);
            },
          ),
        ],
      ),
    );
  }
}
