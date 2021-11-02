import 'package:flutter/material.dart';

class CustomSnackbar {
  showErrorSnackBar(scaffoldKey, message) {
    try {
      final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text('$message', style: TextStyle(color: Colors.white)));

      // Find the Scaffold in the widget tree and use it to show a SnackBar.
      scaffoldKey.currentState.showSnackBar(snackBar);
    } catch (error) {
      print(error);
    }
  }

  showSuccessSnackBar(scaffoldKey, message) {
    try {
      final snackBar = SnackBar(
          backgroundColor: Colors.green,
          content: Text('$message', style: TextStyle(color: Colors.white)));

      // Find the Scaffold in the widget tree and use it to show a SnackBar.
      scaffoldKey.currentState.showSnackBar(snackBar);
    } catch (err) {
      print('error displaying snackbar');
    }
  }

  showSnackBar(scaffoldKey, message) {
    try {
      final snackBar = SnackBar(
          // backgroundColor: Colors.geen,
          content: Text('$message', style: TextStyle(color: Colors.white)));

      // Find the Scaffold in the widget tree and use it to show a SnackBar.
      scaffoldKey.currentState.showSnackBar(snackBar);
    } catch (error) {
      print(error);
    }
  }
}
