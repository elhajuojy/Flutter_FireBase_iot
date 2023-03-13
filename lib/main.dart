import 'package:flutter/material.dart';
import 'package:flutterfirebaseiot/Home/HomePage.dart';
import 'package:get/get.dart';
import 'Auth/Login.dart';

void main() {
  runApp(const MyApp());
}

var isLogin = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutterfirebaseiot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home:
          isLogin == true ? const HomePage() : const LoginPage(title: "Login"),
    );
  }
}
