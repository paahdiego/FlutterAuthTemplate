import 'package:flutter/material.dart';

class DeviceScreenSize extends ChangeNotifier {
  //Sizes
  double _displayWidth = 0;
  double _displayHeight = 0;

  //Paddings
  EdgeInsets _defaultPadding = EdgeInsets.zero;
  double _defaultPaddingValue = 20;
  double _paddingTop = 0;
  double _paddingBottom = 0;
  EdgeInsets _safeAreaPadding = EdgeInsets.zero;

  //fonts
  double _defaultFontSize = 14;
  double _titleFontSize = 24;
  double _bodyFontSize = 14;

  final BuildContext context;

  DeviceScreenSize(
    this.context,
  ) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    _displayWidth = _mediaQuery.size.width;
    _displayHeight = _mediaQuery.size.height;

    //values that depends of screen size
    if (_displayWidth >= 768) {
      _defaultPaddingValue *= 2.0;
      //iPad Pro 9.7 pol
    } else if (_displayWidth >= 375) {
      _defaultPaddingValue *= 1.5;
      //iPhone 11 Pro - x pol 375
      //iPhone 12 - 6.1 pol 390
    } else {
      //iPhone SE 1st Gen.
    }
    //Paddings
    _paddingTop = _mediaQuery.padding.top;
    _paddingBottom = _mediaQuery.padding.bottom;
    _defaultPadding = EdgeInsets.symmetric(horizontal: _defaultPaddingValue);
    _safeAreaPadding =
        EdgeInsets.only(top: _paddingTop, bottom: _paddingBottom);
  }
  //ScreenSize
  double get displayWidth => this._displayWidth;
  double get displayHeight => this._displayHeight;
  //Paddings
  EdgeInsets get defaultPadding => this._defaultPadding;
  double get defaultPaddingValue => this._defaultPaddingValue;
  double get paddingTop => this._paddingTop;
  double get paddingBottom => this._paddingBottom;
  EdgeInsets get safeAreaPadding => this._safeAreaPadding;
  //fonts
  double get defaultFontSize => this._defaultFontSize;
  double get titleFontSize => this._titleFontSize;
  double get bodyFontSize => this._bodyFontSize;
}
