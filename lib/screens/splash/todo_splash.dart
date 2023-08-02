import 'dart:async';
import 'package:fi_a3_rohan/constants/static.dart';

import 'package:flutter/material.dart';
import '../login/todo_login.dart';

class FiA3RohanSplasher extends StatefulWidget {
  const FiA3RohanSplasher({super.key});
  @override
  State<FiA3RohanSplasher> createState() => _FiA3RohanSplasherState();
}

class _FiA3RohanSplasherState extends State<FiA3RohanSplasher> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FiA3RohanLogin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: 150,
              height: 150,
              image: AssetImage(FiA3RohanImages.clock),
            ),
            FiA3RohanSizedBox.height5,
            Text.rich(
              TextSpan(
                text: ' Keep On\n',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: '    Time',
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
