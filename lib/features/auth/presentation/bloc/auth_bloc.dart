import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/features/auth/domain/entities/login.dart';
import 'package:movie_app/features/auth/domain/usecases/login_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  static AuthBloc get(context) => BlocProvider.of(context);
  AuthBloc({required this.loginUser}) : super(const AuthState()) {
    on<LoginEvent>((event, emit) async {
      final result = await loginUser
          .call(LoginParams(email: event.email, password: event.password));
      result.fold((l) {
        emit(state.copyWith(
            loginRequestState: RequestState.erorr, message: l.message));
      }, (r) {
        emit(state.copyWith(login: r, loginRequestState: RequestState.loaded));
      });
    });
  }
}
