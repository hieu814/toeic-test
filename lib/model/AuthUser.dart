import 'dart:convert';

import 'User.dart';

class AuthUser {
  User? user;
  String? jwt;
  AuthUser({
    this.user,
    this.jwt,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (user != null) {
      result.addAll({'user': user!.toJson()});
    }
    if (jwt != null) {
      result.addAll({'jwt': jwt});
    }

    return result;
  }

  String getUserID() {
    return user?.id ?? "";
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      user: map['user'] != null ? User.fromJson(map['user']) : null,
      jwt: map['jwt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthUser.fromJson(String source) =>
      AuthUser.fromMap(json.decode(source));
}
