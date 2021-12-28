import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_training/authentication/bloc/authentication_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return Column(
                      children: [
                        _form(context),
                        SizedBox(height: 30),
                        Text(
                          'Value listner: ${state.user["userField"]["name"]
                          ?? "Unknown"}'
                        )
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}

Widget _form(context) {
  return BlocBuilder<AuthenticationBloc, AuthenticationState>(
    builder: (context, state) {
      return Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Name",
              ),
              onChanged: (String? value) {
                Map _userField = state.user["userField"] ?? {"name": value};
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(OnFieldChanged(userField: _userField));
              },
            )
          ],
        ),
      );
    },
  );
}
