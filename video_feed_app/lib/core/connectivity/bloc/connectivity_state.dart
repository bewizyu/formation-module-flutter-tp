import 'package:equatable/equatable.dart';
import 'package:video_feed_app/core/connectivity/connectivity_status.dart';
import 'package:meta/meta.dart';

class ConnectivityErrorState extends ConnectivityState {
  @override
  String toString() => 'ConnectivityErrorState';
}

@immutable
abstract class ConnectivityState extends Equatable {
  @override
  List<Object> get props => [];
}

class ConnectivityStatusState extends ConnectivityState {
  final ConnectivityStatus connectivity;

  ConnectivityStatusState({@required this.connectivity})
      : assert(connectivity != null);

  @override
  List<Object> get props => [connectivity];

  @override
  String toString() => 'ConnectivityState {connectivity: $connectivity}';
}

class InitialConnectivityState extends ConnectivityState {}
