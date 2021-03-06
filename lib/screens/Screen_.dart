import 'dart:async';

import 'package:flutter/material.dart';

const String LoggedInKey = 'LoggedIn';

class Screen_ extends StatefulWidget {
  const Screen_({Key? key}) : super(key: key);

  @override
  _Screen_State createState() => _Screen_State();
}

class _Screen_State extends State<Screen_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/welcome.png',
                ),
              ),
            ),
            const Center(
              child: Text(
                'Authentication',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(milliseconds: 2000), () {
      Navigator.pushNamed(context, '/auth');
    });
  }
}
