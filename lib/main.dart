import 'package:flutter/material.dart';
import 'package:flutterfirebaseiot/Auth/Login.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const MyHomePage(title: 'flutterfirebaseiot'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoginPage(
          title: 'This is the login page',
        ),
      ),
    );
  }
}
