import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:movie_app/features/auth/domain/entities/login.dart';
import 'package:movie_app/features/auth/domain/repositories/login_repository.dart';
import 'package:movie_app/features/auth/domain/usecases/login_user.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  LoginRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Login>> loginUser(LoginParams params) async {
    try {
      final remoteData = await remoteDataSource.loginUser(params);
      return Right(remoteData);
    } on ServerExceptin catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Login>> fetchCachedToken() {
    // TODO: implement fetchCachedToken
    throw UnimplementedError();
  }
}
