import 'package:flutter/material.dart';
import 'package:flutter_challenge/screens/widgets/custom_button.dart';
import 'package:flutter_challenge/service/auth.dart';

class Home extends StatelessWidget {
  final facebookProfile;
  Home({Key key, this.facebookProfile}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4B4B78),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              facebookProfile.photoUrl != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CircleAvatar(
                          backgroundImage:
                              Image.network(facebookProfile.photoUrl ?? "")
                                  .image,
                          radius: 100),
                    )
                  : Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              border:
                                  Border.all(width: 3, color: Colors.white60)),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Success!",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text("You have successfully signed in as:",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                      ],
                    ),
              Text(facebookProfile.displayName ?? "",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
              Text(facebookProfile.email,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: CustomButton(
                    name: "Sign Out",
                    height: 50,
                    color: Color(0xff27274F),
                    onPressed: () async {
                      await _auth.logoutWithFacebook();
                      await _auth.logout();
                    }),
              ),
            ],
          ),
        ));
  }
}
