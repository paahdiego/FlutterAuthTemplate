import 'package:authtemplate/core/core.dart';
import 'package:authtemplate/login/widgets/background.dart';
import 'package:authtemplate/shared/controllers/auth.dart';
import 'package:authtemplate/shared/models/login.dart';
import 'package:authtemplate/shared/services/auth.dart';
import 'package:authtemplate/shared/widgets/rounded_button.dart';
import 'package:authtemplate/shared/widgets/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool invisiblePassword = true;
  IconData invisiblePasswordIcon = Icons.visibility_off;

  AuthController controller;

  @override
  void initState() {
    super.initState();
  }

  Future<void> login() async {
    try {
      if (_formKey.currentState.validate()) {
        setState(() {
          controller.state = AuthState.loading;
        });

        LoginModel login = LoginModel(
          email: emailController.text,
          password: passController.text,
        );

        try {
          var response = await AuthService().login(login);
          print(response.userId);
          setState(() {
            controller.state = AuthState.authenticated;
          });
          if (Navigator.canPop(context)) Navigator.of(context).pop();
        } catch (error) {
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              backgroundColor: Colors.red,
              message: "$error",
            ),
          );
          setState(() {
            controller.state = AuthState.notAuthenticated;
          });
        }
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    DeviceScreenSize dss = DeviceScreenSize(mediaQuery: MediaQuery.of(context));
    controller = Provider.of<AuthController>(context);
    return Scaffold(
      body: Background(
        child: Form(
          key: _formKey,
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
                  icon: Icons.person,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "digite o e-mail";
                    }
                    return null;
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
                  controller: passController,
                  obscureText: invisiblePassword,
                  suffixIcon: IconButton(
                      splashColor: AppColors.transparent,
                      icon: Icon(
                        invisiblePasswordIcon,
                        color: invisiblePassword
                            ? AppColors.deactivatedSuffixButton
                            : AppColors.activatedSuffixButton,
                      ),
                      onPressed: () {
                        setState(() {
                          invisiblePassword = !invisiblePassword;
                          if (invisiblePassword) {
                            invisiblePasswordIcon = Icons.visibility_off;
                          } else {
                            invisiblePasswordIcon = Icons.visibility;
                          }
                        });
                      }),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "digite a senha";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RoundedButton(
                onPressed: () async {
                  await login();
                },
                child: controller.state != AuthState.loading
                    ? Text(
                        "LOGIN",
                        style: AppTextStyles.roundedButtonStyle(),
                      )
                    : SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: AppColors.kPrimaryLightColor,
                          valueColor: new AlwaysStoppedAnimation<Color>(
                            AppColors.kPrimaryColor,
                          ),
                          strokeWidth: 2.5,
                        ),
                      ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "esqueci minha senha",
                  style: AppTextStyles.textButtonStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
