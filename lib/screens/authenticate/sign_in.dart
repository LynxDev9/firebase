import 'package:brew_crew/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in to Brew Crew'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Center(
          child: ElevatedButton(
              onPressed: () async {
                dynamic res = await _authService.signAnonym();
                if (res == null) {
                  if (kDebugMode) {
                    print('Sign in Failed');
                  }
                } else {
                  if (kDebugMode) {
                    print('Sign in  $res');
                  }
                }
              },
              child: const Text('Sign in anonymously')),
        ),
      ),
    );
  }
}
