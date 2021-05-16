import 'package:authtemplate/shared/controllers/auth.dart';
import 'package:authtemplate/shared/services/auth.dart';
import 'package:authtemplate/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("HOME PAGE"),
          RoundedButton(
            onPressed: () {
              Provider.of<AuthController>(context, listen: false).logout();
            },
            child: Text("LOGOUT"),
          )
        ],
      )),
    );
  }
}
