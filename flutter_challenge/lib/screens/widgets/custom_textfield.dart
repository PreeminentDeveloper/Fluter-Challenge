import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  final TextInputType keyboardType;
  final bool obscureText;
  final Widget suffixIcon;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final TextEditingController controller;
  final double verticalPadding;
  final TextInputAction textInputAction;
  final InputDecoration decoration;
  final AutovalidateMode autovalidateMode;

  const CustomTextField(
      {this.autovalidateMode,
      this.decoration,
      this.validator,
      this.controller,
      this.verticalPadding = 0.0,
      this.textInputAction = TextInputAction.next,
      this.onChanged,
      this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.suffixIcon,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            style: TextStyle(color: Colors.white),
            validator: validator,
            controller: controller,
            autovalidateMode: autovalidateMode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: decoration ?? kInputDecoration,
          ),
          SizedBox(height: height / 42.67),
        ],
      ),
    );
  }
}

final kInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigo[200]),
    borderRadius: BorderRadius.circular(30),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: Colors.white),
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: Colors.red)),
);

final kUnderlineInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(5),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[850]),
  ),
  errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.red)),
);
