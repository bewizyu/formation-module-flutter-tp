import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

import '../connectivity_status.dart';
import './bloc.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity connectivityRepository;

  @visibleForTesting
  StreamSubscription<ConnectivityResult> connectivitySubscription;

  ConnectivityBloc({
    @required this.connectivityRepository,
  })  : assert(connectivityRepository != null),
        super();

  @override
  ConnectivityState get initialState => InitialConnectivityState();



  @override
  Stream<ConnectivityState> mapEventToState(
    ConnectivityEvent event,
  ) async* {
    if (event is GetConnectitvy) {
      yield* _mapGetConnectivityToState();
    }

    if (event is ConnectivityChanged) {
      yield* _mapConnectivityChangedToState(event.connectivity);
    }
  }

  @override
  void onEvent(ConnectivityEvent event) {

    if (event is StartListenConnectivity) {
      connectivitySubscription =
          connectivityRepository.onConnectivityChanged.listen(
        (ConnectivityResult result) => this.mapEventToState(
          ConnectivityChanged(connectivity: ConnectivityStatus.from(result),),
        ),
      );
    }

    if (event is StopListenConnectivity) {
      connectivitySubscription?.cancel();
    }
  }

  Stream<ConnectivityState> _mapConnectivityChangedToState(
      ConnectivityStatus connectivity) async* {
    yield ConnectivityStatusState(connectivity: connectivity);
  }

  Stream<ConnectivityState> _mapGetConnectivityToState() async* {
    try {
      final result = await connectivityRepository.checkConnectivity();
      yield ConnectivityStatusState(
        connectivity: ConnectivityStatus.from(result),
      );
    } catch (e) {
      yield ConnectivityErrorState();
    }
  }
}
