import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    routes: {
      "login": (context) => Login(),
      "register": (context) => Register(),
    },
  ));
}