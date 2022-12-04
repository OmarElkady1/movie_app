part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
}

class GetMovieDetailsEvent extends DetailsEvent {
  final int id;

  const GetMovieDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetMovieRecommendationEvent extends DetailsEvent {
  final int id;

  const GetMovieRecommendationEvent(this.id);
  @override
  List<Object> get props => [id];
}
