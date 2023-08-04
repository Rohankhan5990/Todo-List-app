import 'package:flutter/material.dart';
import '../../services/todo_firebase.dart';

class FiA3RohanAlertWrite extends StatelessWidget {
  FiA3RohanAlertWrite({super.key});
  static String taskdata = '';
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return SizedBox(
      child: Center(
        child: AlertDialog(
          title: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Enter your task"),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  taskdata = controller.text;
                  TodoFirebaseHelper().addDataToFirestore(taskdata, "");
                  Navigator.pop(context);
                },
                child: const Text("OK"))
          ],
        ),
      ),
    );
  }
}
