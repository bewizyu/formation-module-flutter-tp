import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class ConnectivityStatus extends Equatable {
  final ConnectivityResult connectivityResult;
  final isOffline;

  ConnectivityStatus({this.connectivityResult, this.isOffline = false});

  /// Create [ConnectivityStatus] from [ConnectivityResult]
  factory ConnectivityStatus.from(ConnectivityResult c) {
    return ConnectivityStatus(
      connectivityResult: c,
      isOffline: ConnectivityResult.none == c,
    );
  }

  @override
  List<Object> get props => [connectivityResult, isOffline];
}
