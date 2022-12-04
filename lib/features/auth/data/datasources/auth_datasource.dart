import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/features/auth/data/models/login_model.dart';
import 'package:movie_app/features/auth/domain/entities/login.dart';
import 'package:movie_app/features/auth/domain/usecases/login_user.dart';

abstract class LoginRemoteDataSource {
  Future<Login> loginUser(LoginParams params);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<Login> loginUser(LoginParams params) async {
    final response =
        await Dio().post('http://api.mahmoudtaha.com/api/auth/login', data: {
      'email': params.email,
      'password': params.password,
    });
    if (response.statusCode != 200) {
      throw ServerExceptin(
          errorModel: ErrorMessageModel.fromJson(response.data));
    }
    print(response.data['data']);
    return LoginModel.fromJson(response.data['data']);
  }
}
