import 'package:flutter/material.dart';
import 'package:teamchat/shared/constant.dart';

var textInputDecoration = InputDecoration(
  labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.amberAccent, width: 2),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Constant().primaryColor, width: 2),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2),
  ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
      textColor: Colors.white,
    ),
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 14,
      ),
    ),
    duration: const Duration(seconds: 2),
    width: 280.0,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: color,
  ));
}
