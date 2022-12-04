import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/auth/domain/entities/login.dart';
import 'package:movie_app/features/auth/domain/usecases/login_user.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> loginUser(LoginParams params);
  Future<Either<Failure, Login>> fetchCachedToken();
}
