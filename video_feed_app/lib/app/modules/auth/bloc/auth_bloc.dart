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
      // TODO 3 : au demarrage de l'app verifier si l'utilisateur est deja authentifié (utiliser userRepository.hasUserLoggedIn)
      // si l'utilisateur est authentifié envoyer sur le stream de retours le state Authenticated sinon envoyer Unauthenticated (utiliser yield pour pousser des event sur le stream)
    }

    // TODO 4 :  event is LoggedIn
    // => envoyer AuthenticationLoading
    // => persister le token retourné
    // => envoyer Authenticated

    // TODO 5 :  event is LoggedOut
    // => envoyer AuthenticationLoading
    // => deconnecter l'utilisateur
    // => envoyer Unauthenticated
  }
}
