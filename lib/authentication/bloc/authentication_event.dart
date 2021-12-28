part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class OnFieldChanged extends AuthenticationEvent {
  final Map userField;
  OnFieldChanged({required this.userField});

  @override
  List get props => [userField];
}