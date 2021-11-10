import 'package:flutter/material.dart';
import 'package:vida_saudavel/views/login.dart';

void main() {
  runApp(MaterialApp(
    title: "Vida Saudável",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: Login(),
  ));
}
