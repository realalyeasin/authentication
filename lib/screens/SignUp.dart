import 'package:authentication/auth_service.dart';
import 'package:authentication/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Sign Up'),
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
                            border: UnderlineInputBorder(),
                            hintText: 'Email',
                          ),
                          controller: emailController,
                        ),
                      )
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
                          autocorrect: false,
                          obscureText: true,
                          enableSuggestions: false,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Password',
                          ),
                          controller: passController,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () async {
                      final result = await context.read<AuthenticationService>().signUp(
                          email: emailController.text.trim(),
                          password: passController.text.trim(),);
                      showSnackBar(context, result!);
                      if(result == 'Signed Up') {
                        Navigator.popUntil(
                            context, ModalRoute.withName('/auth'));
                      }
                    },
                    child: const Text('Create Account'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Already have an account?'),
                      Text('Sign in')
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
