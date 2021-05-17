import 'package:authtemplate/core/core.dart';

import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget suffixIcon;
  final TextInputAction textInputAction;
  final ValueChanged<String> onFieldSubmitted;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: keyboardType,
        onFieldSubmitted: (_) {},
        textInputAction: textInputAction,
        style: AppTextStyles.inputStyle(),
        decoration: InputDecoration(
          icon: Icon(icon, color: AppColors.kPrimaryColor),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          errorStyle: TextStyle(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
