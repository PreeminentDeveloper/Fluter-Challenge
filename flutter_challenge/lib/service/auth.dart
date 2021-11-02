import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_challenge/model/user.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create an instance of FacebookLogin
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  // Initialize GoogleSignIn
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  // create user object for Facebook based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? User(
            uid: user.uid,
            displayName: user.displayName,
            email: user.email,
            photoUrl: user.photoUrl)
        : null;
  }

  // create user object for Email/Password based on FirebaseUser
  User _userFromFirebaseUser2(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(email, password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      print(user);
      return _userFromFirebaseUser2(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(email, password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      print(user);
      return _userFromFirebaseUser2(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithGoogle() async {
    try {
      var result = await _googleSignIn.signIn();
      print("Google Sign In result: $result");
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with facebook
  Future signInWithFacebook() async {
    try {
      final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final FacebookAccessToken accessToken = result.accessToken;
          AuthCredential _credential = FacebookAuthProvider.getCredential(
              accessToken: accessToken.token);
          var userCredential = await _auth.signInWithCredential(_credential);
          _userFromFirebaseUser(userCredential.user);
          return userCredential.user;
          break;
        case FacebookLoginStatus.cancelledByUser:
          print('Login cancelled by the user.');
          break;
        case FacebookLoginStatus.error:
          print('Login Error: ${result.errorMessage}');
          break;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // logout with facebook
  Future logoutWithFacebook() async {
    try {
      return await facebookSignIn.logOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // logout
  Future logout() async {
    try {
      return await _auth.signOut().then((value) {
        facebookSignIn.logOut();
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
