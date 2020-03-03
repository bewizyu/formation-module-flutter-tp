import 'package:equatable/equatable.dart';
import 'package:video_feed_app/core/connectivity/connectivity_status.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConnectivityEvent extends Equatable {
  @override
  List<Object> get props => [];

}

class ConnectivityChanged extends ConnectivityEvent {
  final ConnectivityStatus connectivity;

  ConnectivityChanged({
    this.connectivity,
  })  : assert(connectivity != null);

  @override
  List<Object> get props => [connectivity];

  @override
  String toString() => 'ConnectivityChanged {connectivity: $connectivity}';
}

class GetConnectitvy extends ConnectivityEvent {
  @override
  String toString() => 'GetConnectitvy';
}

class StartListenConnectivity extends ConnectivityEvent {
  @override
  String toString() => 'StartListenConnectivity';
}

class StopListenConnectivity extends ConnectivityEvent {
  @override
  String toString() => 'StopListenConnectivity';
}
