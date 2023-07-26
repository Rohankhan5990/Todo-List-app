import 'package:flutter/material.dart';

import '../services/write.dart';

class FiA3RohanAlert extends StatelessWidget {
  const FiA3RohanAlert({super.key});

  @override
  Widget build(BuildContext context) {
    String taskdata = '';
    TextEditingController controller = TextEditingController();

    return SizedBox(
      child: Center(
        child: AlertDialog(
          title: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter your task"),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  taskdata = controller.text;
                  DataWrite().addDataToFirestore(taskdata);
                  Navigator.pop(context);
                },
                child: const Text("OK"))
          ],
        ),
      ),
    );
  }
}
