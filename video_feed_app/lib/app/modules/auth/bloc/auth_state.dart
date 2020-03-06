import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}


// TODO 2 : Créer 4 états d'authentification :
// AuthenticationUninitialized =>  etat initial
// Authenticated =>  utilisateur authentifié
// Unauthenticated =>  utilisateur déconnecté
// AuthenticationLoading =>  authentification en cours

class AuthenticationUninitialized extends AuthenticationState {}
