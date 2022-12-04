import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/features/auth/presentation/bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => sl<AuthBloc>(),
        child: Center(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, state) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    child: TextFormField(
                      controller: email,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: Colors.blue,
                    child: TextFormField(
                      controller: password,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                      child: const Text(
                        'login',
                        style: TextStyle(color: Colors.amber),
                      ),
                      onPressed: () {
                        AuthBloc.get(context)
                            .add(LoginEvent(email.text, password.text));
                      })
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
