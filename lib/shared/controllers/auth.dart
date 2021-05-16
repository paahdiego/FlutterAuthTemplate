import 'package:authtemplate/shared/services/auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final stateNotifier = ValueNotifier<AuthState>(AuthState.showSplash);
  bool isAuthenticated = false;

  AuthController() {
    this._init();
  }

  _init() async {
    await Future.delayed(Duration(seconds: 5));
    this.stateNotifier.value = await AuthService.isAuthenticated();
    notifyListeners();
  }

/*
  void setIsAuthenticated(bool value) {
    this.isAuthenticated = value;
    if (!value) {
      AuthService().logout().then((value) => null);
    }
    notifyListeners();
  } */

  void logout() {
    AuthService().logout();
    stateNotifier.value = AuthState.showSplash;
    _init();
    notifyListeners();
  }

  set state(AuthState state) {
    stateNotifier.value = state;
    notifyListeners();
  }

  AuthState get state => stateNotifier.value;
}

enum AuthState {
  authenticated,
  showSplash,
  loading,
  notAuthenticated,
}
