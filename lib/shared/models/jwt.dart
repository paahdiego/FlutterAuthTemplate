class JWTToken {
  String jwt;

  JWTToken({
    this.jwt,
  });

  factory JWTToken.fromJson(Map<String, dynamic> json) {
    return JWTToken(
      jwt: json["token"],
    );
  }
}
