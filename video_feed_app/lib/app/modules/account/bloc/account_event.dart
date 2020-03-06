import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class PassportEvent extends Equatable {
  const PassportEvent();
}

class CreatePassportPressed extends PassportEvent {
  final String username;
  final String email;
  final String password;

  const CreatePassportPressed({
    @required this.username,
    @required this.password,
    @required this.email,
  });

  @override
  List<Object> get props => [username, password, email];

  @override
  String toString() =>
      'CreatePassportPressed { username: $username, password: $password, email ; $email}';
}