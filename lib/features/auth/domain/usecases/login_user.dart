import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/use_case.dart';
import 'package:movie_app/features/auth/domain/entities/login.dart';
import 'package:movie_app/features/auth/domain/repositories/login_repository.dart';

class LoginUser implements BaseUSecase<Login, LoginParams> {
  final LoginRepository repository;

  LoginUser({required this.repository});

  @override
  Future<Either<Failure, Login>> call(LoginParams params) async {
    return await repository.loginUser(params);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
