import 'package:flutter/material.dart';
import 'package:flutter_challenge/model/user.dart';
import 'package:flutter_challenge/screens/wrapper.dart';
import 'package:flutter_challenge/service/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
            title: "Flutter Challenge",
            theme: ThemeData(
              fontFamily: 'NotoSans',
              primaryColor: Color(0xff27274F),
            ),
            home: Wrapper()));
  }
}
