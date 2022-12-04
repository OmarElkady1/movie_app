import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class BaseUSecase<T, Parametar> {
  Future<Either<Failure, T>> call(Parametar parametar);
}

class NoParametar extends Equatable {
  const NoParametar();
  @override
  List<Object> get props => [];
}
