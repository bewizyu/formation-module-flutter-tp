import 'dart:async';

import 'package:video_feed_app/app/modules/auth/data/repository/user_repository.dart';
import 'package:video_feed_app/app/modules/account/bloc/account_event.dart';
import 'package:video_feed_app/app/modules/account/bloc/account_state.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

class PassportBloc extends Bloc<PassportEvent, PassportState> {
  final UserRepository userRepository;

  PassportBloc({
    @required this.userRepository,
  }) : assert(userRepository != null);

  PassportState get initialState => PassportInitial();

  @override
  Stream<PassportState> mapEventToState(PassportEvent event) async* {
    if (event is CreatePassportPressed) {
      yield PassportCreationLoading();

      try {
        final uid = await userRepository.create(
          username: event.username,
          password: event.password,
          email: event.email,
        );
        yield PassportCreationSuccess(uid: uid);
      } on PlatformException catch (error) {
        yield PassportCreationFailure(error: error);
      } catch (ex) {
        yield PassportCreationFailure(
          error: PlatformException(
            code: null,
            message:
                'An error has occued when creating your account, please try again later',
          ),
        );
      }
    }
  }
}
