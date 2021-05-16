import 'package:authtemplate/core/core.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceScreenSize dss = DeviceScreenSize(mediaQuery: MediaQuery.of(context));

    return Container(
      height: dss.displayHeight,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: dss.displayWidth * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: dss.displayWidth * 0.3,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
