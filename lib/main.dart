import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:authtemplate/core/core.dart';
import 'package:authtemplate/shared/controllers/auth.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthController>.value(
            value: AuthController(),
          ),
        ],
        child: AppWidget(),
      ),
    );
