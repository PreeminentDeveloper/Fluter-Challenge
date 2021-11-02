import 'package:flutter/material.dart';
import 'package:flutter_challenge/screens/widgets/custom_button.dart';
import 'package:flutter_challenge/screens/widgets/custom_textfield.dart';
import 'package:flutter_challenge/service/auth.dart';
import 'package:flutter_challenge/utils/draw_clip.dart';
import 'package:flutter_challenge/utils/field_validator.dart';
import 'package:flutter_challenge/utils/loading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  const SignUp({Key key, this.toggleView}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();

  // text field state
  String _email = "", _password = "", error = "";

  // TextEditingControllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // formKey
  final _formKey = GlobalKey<FormState>();
  bool _isValidated = false;
  bool _obscureText = true;

  bool loading = false;

  String userId, name, email, image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipPath(
                        clipper: DrawClip2(),
                        child: Container(
                            width: size.width,
                            height: size.height * 0.81,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.indigo[200],
                                  Color(0xff27274F)
                                ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.bottomRight))),
                      ),
                      ClipPath(
                        clipper: DrawClip(),
                        child: Container(
                            width: size.width,
                            height: size.height * 0.81,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Color(0xff27274F),
                                  Colors.indigo[200]
                                ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight))),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: Text("Create an Account",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white)),
                                ),
                                // Email field
                                CustomTextField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    setState(() => _email = value);
                                  },
                                  decoration: kInputDecoration.copyWith(
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.white54),
                                    prefixIcon: Icon(Icons.person_outline,
                                        color: Colors.white54, size: 20),
                                  ),
                                  validator: FieldValidator.validateEmail,
                                ),
                                SizedBox(height: 10),

                                // Password field
                                CustomTextField(
                                  controller: _passwordController,
                                  obscureText: _obscureText,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: kInputDecoration.copyWith(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.white54),
                                    prefixIcon: Icon(Icons.lock_outline,
                                        color: Colors.white54, size: 20),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 18,
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() => _password = value);
                                    if (_emailController.text.isEmpty &&
                                        _passwordController.text.isEmpty) {
                                      setState(() {
                                        _isValidated = false;
                                      });
                                    } else {
                                      setState(() {
                                        _isValidated = true;
                                      });
                                    }
                                  },
                                  validator: FieldValidator.validatePassword,
                                ),
                                SizedBox(height: 10),

                                // Sign In button
                                CustomButton(
                                    name: "Sign In",
                                    height: 50,
                                    color: _isValidated
                                        ? Color(0xff27274F)
                                        : Colors.black26,
                                    textColor: _isValidated
                                        ? Colors.white
                                        : Colors.white70,
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() => loading = true);
                                        dynamic result = await _auth
                                            .registerWithEmailAndPassword(
                                                _email, _password);
                                        result == null
                                            ? setState(() {
                                                loading = false;
                                                error =
                                                    "Invalid Email or Password";
                                              })
                                            : setState(() {
                                                loading = false;
                                                error = "";
                                              });
                                      }
                                    }),
                                SizedBox(height: 12),
                                Text(error, style: TextStyle(color: Colors.red))
                              ],
                            ),
                          )),
                    ],
                  ),
                  Text("Or Sign Up with",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        children: [
                          CustomButton2(
                              name: "Facebook",
                              fontAwesomeIcon: FontAwesomeIcons.facebookF,
                              color: Color(0xFF3b5998),
                              onTap: () async {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithFacebook();
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = "Could not sign in to facebook";
                                  });
                                } else {
                                  setState(() {
                                    loading = false;
                                    error = "";
                                  });
                                }
                              }),
                          SizedBox(width: 10),
                          CustomButton2(
                            name: "Google",
                            fontAwesomeIcon: FontAwesomeIcons.google,
                            color: Color(0xffdb3236),
                            onTap: () async {
                              setState(() => loading = true);
                              dynamic result = await _auth.signInWithGoogle();
                              result == null
                                  ? setState(() {
                                      loading = false;
                                      error = "Could not sign in to google";
                                    })
                                  : setState(() {
                                      loading = false;
                                      error = "";
                                    });
                            },
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text(" Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xff27274F))),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ));
  }
}
