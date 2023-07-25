import 'package:fi_a3_rohan/utlis/fi_a3_rohan_constants.dart';
import 'package:fi_a3_rohan/utlis/fi_a3_rohan_images.dart';
import 'package:flutter/material.dart';

import '../design/fi_a3_rohan_avator.dart';

class FiA3RohanHome extends StatefulWidget {
  const FiA3RohanHome({super.key});

  @override
  State<FiA3RohanHome> createState() => _FiA3RohanHomeState();
}

class _FiA3RohanHomeState extends State<FiA3RohanHome> {
  List<String> todoList = []; // List to store the todo items
  bool showListView = false; // Flag to show/hide the ListView

  // Function to add a new item to the todoList
  void addItemToList() {
    setState(() {
      todoList.add('New Task ${todoList.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  FiA2RohanAvator(
                    child: Image.asset(FiA3RohanImages.girl2),
                  ),
                ],
              ),
            ),
            FiA3RohanSizedBox.height30,
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
            Container(
              width: double.infinity,
              height: showListView
                  ? 520
                  : 0, // Show/hide the ListView container based on the flag
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(23)),
              ),
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todoList[index]),
                  );
                },
              ),
            ),
            FiA3RohanSizedBox.height10,
            InkWell(
              onTap: () {
                addItemToList(); // Add an item to the list when the button is pressed
                if (!showListView) {
                  setState(() {
                    showListView =
                        true; // Show the ListView container when the button is pressed for the first time
                  });
                }
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 232, 232),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black, width: 3)),
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
