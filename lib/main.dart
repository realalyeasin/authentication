import 'package:authentication/auth_service.dart';
import 'package:authentication/screens/Home.dart';
import 'package:authentication/screens/Screen_.dart';
import 'package:authentication/screens/SignIn.dart';
import 'package:authentication/screens/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future<String?> showSnackBar(BuildContext context, String message) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 2000),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) =>
                  context.read<AuthenticationService>().authStateChanges,
              initialData: null)
        ],
        child: MaterialApp(
          title: 'Authentication',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const Screen_(),
            '/auth': (context) => AuthenticationWrap(),
            '/signin': (context) => const SignIn(),
            '/signup': (context) => const SignUp(),
            '/home': (context) => const Home()
          },
        ));
  }
}

class AuthenticationWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();
    if(firebaseuser != null){
      return Home();
    }
    return SignIn();
  }
}
