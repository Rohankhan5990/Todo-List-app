import 'package:fi_a3_rohan/design/fi_a3_rohan_alert_update.dart';
import 'package:fi_a3_rohan/utlis/fi_a3_rohan_constants.dart';
import 'package:flutter/material.dart';
import '../services/delete.dart';

class IconBox extends StatefulWidget {
  final String data;
  const IconBox({super.key, required this.data});
  @override
  State<IconBox> createState() => _IconBoxState();
}

class _IconBoxState extends State<IconBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => FiA3RohanAlertUpdate(data: widget.data),
            );
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
        ),
        FiA3RohanSizedBox.width5,
        InkWell(
          onTap: () {
            DataDelete().deleteDataToFirestore(widget.data);
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
