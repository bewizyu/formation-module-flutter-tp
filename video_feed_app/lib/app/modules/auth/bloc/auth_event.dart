import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// TODO 1 : Créer trois events de type AuthenticationEvent :
// AppStarted : un evenement a envoyer lors du demerrage de l'application pour initialiser le state d'authentification
// LoggedIn : un evenement qui prend en parametre un token et qui declanche le changement de state vers Authenticated
// LoggedOut : un evenement qui declanche le changement de state vers Unauthenticated

class AppStarted extends AuthenticationEvent {}

