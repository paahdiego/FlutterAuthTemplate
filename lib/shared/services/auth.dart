import 'dart:developer';

import 'package:authtemplate/shared/config/connection.dart';
import 'package:authtemplate/shared/controllers/auth.dart';
import 'package:authtemplate/shared/models/jwt.dart';
import 'package:authtemplate/shared/models/login.dart';
import 'package:authtemplate/shared/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<AuthState> isAuthenticated() async {
    final storage = new FlutterSecureStorage();

    final token = await storage.read(key: 'jwt');

    if (token != null) {
      return AuthState.authenticated;
    } else {
      return AuthState.notAuthenticated;
    }
  }

  Future<String?> getToken() async {
    final storage = new FlutterSecureStorage();
    return storage.read(key: 'jwt');
  }

  Future<UserModel> login(LoginModel credentials) async {
    Uri uri = getUri('login');

    try {
      final response = await http.post(
        uri,
        body: credentials.toJson(),
      );

      print("login: " + response.statusCode.toString());

      switch (response.statusCode) {
        case 200:
          log(response.body);

          UserModel _user = UserModel.fromJson(response.body);
          print(_user.name);

          JWTToken _token = JWTToken.fromJson(response.body);
          print(3);
          return await setLocalUser(_user, _token);

        case 403:
          throw ("Email e/ou senha inválidos");
        case 500:
          throw ("Erro no servidor. Tente novamente mais tarde");
        default:
          throw ("Aconteceu um erro inesperado, tente novamente mais tarde");
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<UserModel> setLocalUser(UserModel user, JWTToken token) async {
    final storage = new FlutterSecureStorage();

    storage.delete(key: "jwt");
    storage.write(key: "jwt", value: token.jwt.toString());

    return user;
  }

  Future<bool> logout() async {
    final storage = new FlutterSecureStorage();
    await storage.deleteAll();
    return true;
  }
}
