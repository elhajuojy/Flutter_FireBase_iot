import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Auth/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Home/HomePage.dart';
import 'firebase_options.dart';

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
      routes: {
        'login': (context) => const LoginPage(title: "Login"),
        'HomePage': (context) => const HomePage(),
      },
      home:
          isLogin == true ? const HomePage() : const LoginPage(title: "Login"),
    );
  }
}
