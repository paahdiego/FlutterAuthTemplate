import 'package:authtemplate/shared/services/auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final stateNotifier = ValueNotifier<AuthState>(AuthState.showSplash);

  AuthController() {
    this._init(4500);
  }

  _init(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    this.stateNotifier.value = await AuthService.isAuthenticated();
    notifyListeners();
  }

  void logout() {
    AuthService().logout();
    stateNotifier.value = AuthState.showSplash;
    _init(1000);
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
