import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.name,
      this.onPressed,
      this.color,
      this.textColor,
      this.height = 55,
      this.width = double.infinity,
      Key key})
      : super(key: key);
  final String name;
  final VoidCallback onPressed;
  final double width, height;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color ?? Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
          onPressed: onPressed,
          child: Text(
            name,
            style: TextStyle(color: textColor ?? textColor),
          ),
        ));
  }
}

class CustomButton2 extends StatelessWidget {
  final String name;
  final IconData fontAwesomeIcon;
  final Color color;
  final Function onTap;
  const CustomButton2(
      {Key key, this.name, this.fontAwesomeIcon, this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.brown[500],
              offset: Offset(3.0, 3.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-3.0, -3.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
        ], borderRadius: BorderRadius.circular(30), color: color),
        height: 40,
        width: 160,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Icon(fontAwesomeIcon, color: Colors.white, size: 20.0),
                SizedBox(width: 5),
                Text(name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
