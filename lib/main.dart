import 'package:flutter/material.dart';
import 'package:flutterfirebaseiot/Home/HomePage.dart';
import 'package:get/get.dart';
import 'Auth/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

var isLogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    isLogin = true;
  } else {
    isLogin = false;
  }
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
      home:
          isLogin == true ? const HomePage() : const LoginPage(title: "Login"),
    );
  }
}
