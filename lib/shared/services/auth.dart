import 'dart:convert';

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

  /* Future<String> getToken() async {
    final storage = new FlutterSecureStorage();
    return storage.read(key: 'jwt');
  } */

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
          final responseJson = json.decode(response.body);

          UserModel _user = UserModel.fromJson(response.body);
          print(_user.name);

          JWTToken _token = JWTToken.fromJson(responseJson);
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

  Future<String> getUserName() async {
    final storage = new FlutterSecureStorage();
    return storage.read(key: "name");
  }

  Future<String> getUserId() async {
    final storage = new FlutterSecureStorage();
    return storage.read(key: "userId");
  }

  Future<String> getUserAvatar() async {
    final storage = new FlutterSecureStorage();
    return storage.read(key: "avatarUrl");
  }

  Future<String> getUserEmail() async {
    final storage = new FlutterSecureStorage();
    return storage.read(key: "email");
  }

  Future<UserModel> setLocalUser(UserModel user, JWTToken token) async {
    final storage = new FlutterSecureStorage();

    storage.delete(key: "jwt");
    storage.write(key: "jwt", value: token.jwt.toString());
    Map<String, String> allValues = await storage.readAll();
    print(allValues);

    //await storage.delete(key: "userId");
    /* await storage.write(key: "userId", value: user.userId.toString());
    await storage.delete(key: "avatarUrl");
    await storage.write(key: "avatarUrl", value: user.avatarUrl.toString());
    await storage.delete(key: "email");
    await storage.write(key: "email", value: user.email.toString());
    await storage.delete(key: "name");
    await storage.write(key: "name", value: user.name.toString());
    await storage.delete(key: "companies");
    await storage.write(key: "companies", value: user.companies.toString());
    await storage.delete(key: "permissions");
    await storage.write(key: "permissions", value: user.permissions.toString());
 */
    return user;
  }

  Future<bool> logout() async {
    final storage = new FlutterSecureStorage();
    await storage.deleteAll();
    return true;
  }
}
