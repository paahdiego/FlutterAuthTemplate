import 'package:authtemplate/core/core.dart';
import 'package:authtemplate/shared/controllers/auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>.value(
          value: AuthController(),
        ),
      ],
      child: AppWidget(),
    ),);
