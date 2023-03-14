import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String? title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var myemail = '';
  var mypassword = '';
  login() async {
    try {
      final usercredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: myemail,
        password: mypassword,
      );
      return usercredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
        Get.snackbar("alert", "No user found for that email");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user');
        Get.snackbar("alert", "Wrong password provided for that user");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        myemail = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        mypassword = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          print("start Login");
                          var user = await login();
                          print(user);
                          if (user != null) {
                            Navigator.of(context)
                                .pushReplacementNamed("HomePage");
                          }
                          // Get.toNamed('/home'),
                        },
                        child: const Text("Login"),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                          onSurface: Colors.grey,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;
}
