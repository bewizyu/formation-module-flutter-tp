import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

// TODO 2 : Voir les differentes event du login

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username }';
}

class ResetEmailButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const ResetEmailButtonPressed({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'ResetEmailButtonPressed { username: $username }';
}
