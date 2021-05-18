import 'dart:convert';

import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String? userId;
  String? name;
  UserModel(
    this.userId,
    this.name,
  );

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['userId'],
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
