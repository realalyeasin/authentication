import 'package:authentication/screens/Screen_.dart';
import 'package:authentication/screens/SignIn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => Screen_(),
        '/signin' : (context) => SignIn(),
       // '/signUp' : (context) => SignUp(),
      //  '/home' : (context) => Home()
      },
    );
  }
}
