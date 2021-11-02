import 'package:flutter/material.dart';
import 'package:flutter_challenge/screens/authentication/login.dart';
import 'package:flutter_challenge/screens/authentication/signup.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignIn = true;

  // toggle authentication view
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? LogIn(toggleView: toggleView)
        : SignUp(toggleView: toggleView);
  }
}
