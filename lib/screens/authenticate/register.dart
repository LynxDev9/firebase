import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleShowSignIn;
  const Register({super.key, required this.toggleShowSignIn});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //email & password state
  String _email = '';
  String _password = '';
  //error msg
  String _error = '';
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Sign up to Brew Crew'),
              actions: [
                TextButton.icon(
                  onPressed: () => widget.toggleShowSignIn(),
                  icon: const Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            body: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              inputDecoration.copyWith(hintText: 'Email'),
                          onChanged: (value) => setState(() {
                            _email = value;
                          }),
                          validator: (value) => (value == null || value == '')
                              ? 'Enter an email'
                              : null,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: inputDecoration.copyWith(
                            hintText: 'Password',
                          ),
                          obscureText: true,
                          onChanged: (value) => setState(() {
                            _password = value;
                          }),
                          validator: (value) => ((value?.length ?? 0) < 6)
                              ? 'Enter an password 6+ chars long'
                              : null,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              UserModel? res =
                                  await _auth.register(_email, _password);
                              if (res == null) {
                                setState(() {
                                  _isLoading = false;
                                  _error = 'Invalid registration';
                                });
                              }
                            }
                          },
                          label: const Text('Sign up'),
                          icon: const Icon(Icons.person_add),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          _error,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 14),
                        )
                      ],
                    ))));
  }
}
