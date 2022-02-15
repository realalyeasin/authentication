import 'dart:async';

import 'package:authentication/auth_service.dart';
import 'package:authentication/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Sign In'),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                            onChanged: (text) {},
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), hintText: 'Email'),
                        controller: emailController,
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                            onChanged: (text) {},
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Password'),
                        controller: passController,
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    onPressed: () async {
                      context.read<AuthenticationService>()
                          .signIn(
                        email: emailController.text.trim(),
                        password: passController.text.trim());
                    },
                    child: const Text('Sign In'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/signup'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Have no account yet?'),
                      Text(
                        'Sign Up',
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
