import 'package:flutter/material.dart';

class DeviceScreenSize extends ChangeNotifier {
  double _displayWidth = 0;
  double _displayHeight = 0;
  EdgeInsets _defaultPadding = EdgeInsets.symmetric(horizontal: 0);
  double _defaultPaddingValue = 20;

  final MediaQueryData mediaQuery;

  DeviceScreenSize({
    required this.mediaQuery,
  }) {
    _displayWidth = this.mediaQuery.size.width;
    _displayHeight = this.mediaQuery.size.height;

    if (_displayWidth >= 768) {
      //iPad Pro 9.7 pol
      _defaultPaddingValue *= 2.0;
      _defaultPadding = EdgeInsets.symmetric(horizontal: _defaultPaddingValue);
    } else if (_displayWidth >= 375) {
      //iPhone 11 Pro - x pol 375
      //iPhone 12 - 6.1 pol 390
      _defaultPaddingValue *= 1.5;
      _defaultPadding = EdgeInsets.symmetric(horizontal: _defaultPaddingValue);
    } else {
      //iPhone SE 1st Gen.
      _defaultPadding = EdgeInsets.symmetric(horizontal: _defaultPaddingValue);
    }
  }

  double get displayWidth => this._displayWidth;
  double get displayHeight => this._displayHeight;
  EdgeInsets get defaultPadding => this._defaultPadding;
  double get defaultPaddingValue => this._defaultPaddingValue;
}
