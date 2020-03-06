import 'dart:async';

import 'package:video_feed_app/app/modules/auth/bloc/auth_event.dart';
import 'package:video_feed_app/app/modules/auth/bloc/auth_state.dart';
import 'package:video_feed_app/app/modules/auth/data/repository/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasUserLoggedIn();

      if (hasToken) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistUser(event.token);
      yield Authenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.logoutUser();
      yield Unauthenticated();
    }
  }
}
