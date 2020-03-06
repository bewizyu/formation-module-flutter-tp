import 'dart:async';

import 'package:video_feed_app/app/modules/auth/bloc/auth_bloc.dart';
import 'package:video_feed_app/app/modules/auth/bloc/auth_event.dart';
import 'package:video_feed_app/app/modules/auth/data/repository/user_repository.dart';
import 'package:video_feed_app/app/modules/login/bloc/login_event.dart';
import 'package:video_feed_app/app/modules/login/bloc/login_state.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } on PlatformException catch (error) {
        yield LoginFailure(error: error);
      } catch (ex) {
        yield LoginFailure(
            error: PlatformException(code: null, message: ex.toString()));
      }
    } else if (event is ResetEmailButtonPressed) {
      yield LoginLoading();

      try {
        await userRepository.resendVerificationEmail(
          username: event.username,
          password: event.password,
        );

        yield LginResetSuccess();

        yield LoginInitial();
      } catch (ex) {
        // Nothing to do here
      }
    }
  }
}
