import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

abstract class PassportState extends Equatable {
  const PassportState();

  @override
  List<Object> get props => [];
}

class PassportInitial extends PassportState {}

class PassportCreationLoading extends PassportState {}

class PassportCreationFailure extends PassportState {
  final PlatformException error;

  const PassportCreationFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'PassportCreationFailure { error: $error }';
}

class PassportCreationSuccess extends PassportState {
  final String uid;

  const PassportCreationSuccess({@required this.uid});

  @override
  List<Object> get props => [uid];

  @override
  String toString() => 'PassportCreationSuccess { uid: $uid }';
}