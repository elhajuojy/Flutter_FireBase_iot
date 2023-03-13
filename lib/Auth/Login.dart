import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text('${c.count}')),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            ElevatedButton(
                onPressed: () => {c.increment()},
                child: const Text("Click me "))
          ],
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;
}
