import 'package:flutter/material.dart';
import 'package:flutter_challenge/model/user.dart';
import 'package:flutter_challenge/screens/authentication/authentication.dart';
import 'package:flutter_challenge/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("User: $user");
    // returns either Home or Authentication
    return user == null
        ? Authentication()
        : Home(
            facebookProfile: user,
          );
  }
}
