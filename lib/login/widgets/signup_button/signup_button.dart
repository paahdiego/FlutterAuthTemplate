import 'package:authtemplate/core/core.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SignUpButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceScreenSize dss = DeviceScreenSize(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an Account?",
          style: AppTextStyles.body(dss.defaultFontSize),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            "Sign up",
            style: AppTextStyles.textButtonStyle(dss.defaultFontSize),
          ),
        ),
      ],
    );
  }
}
