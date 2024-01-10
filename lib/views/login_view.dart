import 'package:app/bloc/app_bloc.dart';
import 'package:app/bloc/app_event.dart';
import 'package:app/extensions/if_debugging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginView extends HookWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(
      text: 'iron@man.jarvis'.ifDebugging,
    );
    final passwordController = useTextEditingController(
      text: '12345678'.ifDebugging,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email here',
              ),
              keyboardAppearance: Brightness.dark,
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter your password here',
              ),
              keyboardAppearance: Brightness.dark,
              obscureText: true,
              obscuringCharacter: '*',
            ),
            TextButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                context.read<AppBloc>().add(
                  AppEventLogIn(
                    email: email,
                    password: password,
                  ),
                );
              },
              child: const Text(
                'Log in',
              ),
            ),
            TextButton(
              onPressed: () {
                
                context.read<AppBloc>().add(
                  const AppEventGoToRegistration(),
                );
              },
              child: const Text(
                'Not Registered yet? Registered here!',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
