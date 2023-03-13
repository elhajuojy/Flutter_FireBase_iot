import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('login');
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(now);
    var formattedTime = DateFormat.jm().format(now);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Firebase IoT"),
          actions: [
            IconButton(
              onPressed: () {
                logout();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Tableau de bord ",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 20,
              ),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                    width: Get.width,
                    child: Text("Date : $formattedDate $formattedTime",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ))),
              )),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                    width: Get.width,
                    child: const Text("Plante Actuelle : Mint",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ))),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          width: Get.width / 3,
                          height: 100,
                          child: const Center(
                            child: Text("Température : 25°C",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                )),
                          )),
                    )),
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          width: Get.width / 3,
                          height: 100,
                          child: const Center(
                            child: Text("Humidité : 50%",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                )),
                          )),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          width: Get.width / 3,
                          height: 100,
                          child: const Center(
                            child: Text("Water Level : 50%",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                )),
                          )),
                    )),
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          width: Get.width / 3,
                          height: 100,
                          child: const Center(
                            child: Text("Humidité : 50%",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                )),
                          )),
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                child: InkWell(
                  onTap: () {
                    //todo : refersh data from firebase
                  },
                  child: const Text("Refresh",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              )
            ],
          )),
        ));
  }
}
