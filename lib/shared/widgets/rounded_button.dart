import 'package:authtemplate/core/core.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color, textColor;

  const RoundedButton({
    Key key,
    this.child,
    this.onPressed,
    this.color = AppColors.kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(29),
              ),
            ),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          ),
          backgroundColor: MaterialStateProperty.all(this.color),
          foregroundColor: MaterialStateProperty.all(this.textColor),
        ),
        onPressed: this.onPressed,
        child: this.child,
      ),
    );
  }
}
