import 'package:authentication/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'SignIn.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late User user;

  @override
  void initState() {
    setState(() {
      user = context.read<AuthenticationService>().getUser()!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignIn()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children:  [
          Center(
            child: Text('Home'),
          ),
          Text(user.email.toString())
        ],
      ),
    );
  }
}
