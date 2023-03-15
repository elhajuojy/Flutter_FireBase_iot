import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('login');
  }

  var temp = "0".obs;

  getData() async {
    var ref = FirebaseDatabase.instance.ref().child("data");

    ref.onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.value != null) {
        Object? data = snapshot.value;
        Map<dynamic, dynamic> map = data as Map<dynamic, dynamic>;
        temp.value = map["temp"].toString();
      }
      // print(snapshot.value);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
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
                    MainCard(temp: temp, title: "Température :(°C)"),
                    MainCard(
                      temp: '6.93'.obs,
                      title: "PH :",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainCard(temp: temp),
                    MainCard(
                      temp: '50'.obs,
                      title: "Water Level : ",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.temp,
    this.title = "Température : ",
  });

  final RxString temp;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => SizedBox(
              width: Get.width / 3,
              height: 100,
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      // color: Colors.blue,
                      // borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border(
                        bottom: BorderSide(width: 2.0, color: Colors.blue),
                        // top: BorderSide(width: 3.0, color: Colors.black),
                        // left: BorderSide(width: 3.0, color: Colors.black),
                        // right: BorderSide(width: 3.0, color: Colors.black),
                      ),
                    ),
                    child: Text(
                      "$temp",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              )),
            ),
          )),
    );
  }
}
