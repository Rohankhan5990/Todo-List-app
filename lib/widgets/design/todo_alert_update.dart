import 'package:fi_a3_rohan/services/todo_firebase.dart';
import 'package:fi_a3_rohan/widgets/design/todo_home_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FiA3RohanAlertUpdate extends StatefulWidget {
  String data;
  FiA3RohanAlertUpdate({super.key, required this.data});

  @override
  State<FiA3RohanAlertUpdate> createState() => _FiA3RohanAlertUpdateState();
}

class _FiA3RohanAlertUpdateState extends State<FiA3RohanAlertUpdate> {
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
                  String taskdata = controller.text;
                  TodoFirebaseHelper()
                      .updateDataToFirestore(widget.data, taskdata, "");
                  Navigator.pop(context);
                },
                child: const Text("OK"))
          ],
        ),
      ),
    );
  }
}
