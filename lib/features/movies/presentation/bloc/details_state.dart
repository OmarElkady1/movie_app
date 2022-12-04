part of 'details_bloc.dart';

class DetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState requestState;
  final String detailsMessage;

  final List<Recommendation> recommendation;
  final RequestState recommRequestState;
  final String recommendationMessage;

  const DetailsState(
      {this.movieDetails,
      this.requestState = RequestState.loading,
      this.detailsMessage = '',
      this.recommendation = const [],
      this.recommRequestState = RequestState.loading,
      this.recommendationMessage = ''});
  DetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? requestState,
    String? detailsMessage,
    List<Recommendation>? recommendation,
    RequestState? recommRequestState,
    String? recommendationMessage,
  }) {
    return DetailsState(
      detailsMessage: detailsMessage ?? this.detailsMessage,
      movieDetails: movieDetails ?? this.movieDetails,
      requestState: requestState ?? this.requestState,
      recommendation: recommendation ?? this.recommendation,
      recommRequestState: recommRequestState ?? this.recommRequestState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        requestState,
        detailsMessage,
        recommendationMessage,
        recommRequestState,
        recommendation,
      ];
}
