import 'package:authtemplate/core/core.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
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
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton>
    with TickerProviderStateMixin {
  AnimationController animationController;
  double _scale = 1;

  Key teste;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.05,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {
          _scale = 1 - animationController.value;
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void _tapDown(TapDownDetails details) {
    print("down");
    animationController.forward();
  }

  void _tapUp(/* TapUpDetails details */) {
    print("up");
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    DeviceScreenSize dss = DeviceScreenSize(mediaQuery: MediaQuery.of(context));

    return Container(
      width: dss.displayWidth * 0.8,
      child: GestureDetector(
        onTapDown: _tapDown,
        onTap: widget.onPressed,
        child: Transform.scale(
          scale: _scale,
          child: TextButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(3.5),
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
              backgroundColor: MaterialStateProperty.all(this.widget.color),
              foregroundColor: MaterialStateProperty.all(this.widget.textColor),
            ),
            onPressed: () {
              widget.onPressed();
              _tapUp();
            },
            child: this.widget.child,
          ),
        ),
      ),
    );
  }
}
