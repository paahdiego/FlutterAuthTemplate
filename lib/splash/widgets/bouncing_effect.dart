import 'package:flutter/material.dart';

class BouncingEffect extends StatefulWidget {
  final Widget child;
  final double animationValue;
  BouncingEffect({
    Key key,
    @required this.child,
    @required this.animationValue,
  }) : super(key: key);

  @override
  _BouncingEffectState createState() => _BouncingEffectState();
}

class _BouncingEffectState extends State<BouncingEffect>
    with TickerProviderStateMixin {
  AnimationController animationController;
  double padding = 0;

  @override
  void initState() {
    padding = widget.animationValue;
    animationController = AnimationController(
      vsync: this,
      value: padding,
      lowerBound: padding,
      upperBound: padding * 1.7,
      duration: Duration(milliseconds: 500),
    );
    animationController.addListener(() {
      setState(() {
        padding = animationController.value;
      });
    });

    super.initState();
  }

  run() {
    if (animationController.isCompleted) return animationController.reverse();
    if (animationController.isDismissed) return animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    run();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: widget.child,
    );
  }
}
