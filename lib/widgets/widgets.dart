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
