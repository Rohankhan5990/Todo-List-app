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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
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
            height: 605,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0))),
          ),
        ],
      ),
    );
  }
}
