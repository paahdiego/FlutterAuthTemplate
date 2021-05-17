import 'dart:convert';

class JWTToken {
  String? jwt;

  JWTToken({
    this.jwt,
  });

  Map<String, dynamic> toMap() {
    return {
      'jwt': jwt,
    };
  }

  factory JWTToken.fromMap(Map<String, dynamic> map) {
    return JWTToken(
      jwt: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JWTToken.fromJson(String source) =>
      JWTToken.fromMap(json.decode(source));
}
