import 'package:fi_a3_rohan/screens/login/todo_login.dart';
import 'package:fi_a3_rohan/widgets/design/todo_alert_write.dart';
import 'package:fi_a3_rohan/constants/static.dart';
import 'package:fi_a3_rohan/widgets/design/todo_home_card.dart';
import 'package:flutter/material.dart';
import '../../utils/error_alert.dart';
import '../../widgets/design/todo_avator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FiA3RohanHome extends StatefulWidget {
  const FiA3RohanHome({super.key});

  @override
  State<FiA3RohanHome> createState() => _FiA3RohanHomeState();
}

class _FiA3RohanHomeState extends State<FiA3RohanHome> {
  final auth = FirebaseAuth.instance;

  bool showListView = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 130,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 33, 172, 182),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          auth
                              .signOut()
                              .then(
                                (value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FiA3RohanLogin(),
                                  ),
                                ),
                              )
                              .onError(
                                (error, stackTrace) =>
                                    ErrorAlertbox().toastMessage(
                                  error.toString(),
                                ),
                              );
                        },
                        child: const Row(children: [
                          Icon(Icons.logout),
                          Text(
                            "logout",
                            style: TextStyle(fontSize: 20),
                          ),
                        ]),
                      ),
                      FiA2RohanAvator(
                        height: 60,
                        width: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(FiA3RohanImages.rohan,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FiA3RohanSizedBox.height10,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "To-do list",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  FiA3RohanSizedBox.width40,
                  FiA3RohanSizedBox.width20,
                  Icon(
                    Icons.calendar_month,
                    size: 40,
                  ),
                ],
              ),
              HomeCard(),
              FiA3RohanSizedBox.height10,
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => FiA3RohanAlertWrite(),
                  );
                  if (!showListView) {
                    setState(
                      () {
                        showListView = true;
                      },
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FiA3RohanSizedBox.width10,
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 33, 172, 182),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.black, width: 3),
                      ),
                      child: const Icon(Icons.add),
                    ),
                    FiA3RohanSizedBox.width10,
                    const Text(
                      "Add Task",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
