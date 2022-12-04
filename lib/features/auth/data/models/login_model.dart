import 'package:movie_app/features/auth/domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({required super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(token: json['api_token']);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api_token'] = token;

    return map;
  }
}
