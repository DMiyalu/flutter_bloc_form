import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_training/authentication/data/authentication_model.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState(
    user: authenticationModel()
  )) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<OnFieldChanged>((event, emit) {
      print('userField: ${event.userField}');
    });
  }
}
