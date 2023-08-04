import 'dart:io';
import 'package:fi_a3_rohan/widgets/design/todo_alert_write.dart';
import 'package:fi_a3_rohan/widgets/design/todo_avator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'todo_iconbox.dart';
import '../../services/todo_firebase.dart';

class HomeCard extends StatefulWidget {
  HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool loading = false;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String urlname = DateTime.now().microsecondsSinceEpoch.toString();

  void selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'docx', 'xls', 'xlsx', 'txt'],
    );
    if (result != null) {
      setState(
        () {
          pickedFile = result.files.first;
        },
      );
    }
    final path = 'Files/${urlname}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    uploadTask = ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 380,
          child: StreamBuilder(
            stream: TodoFirebaseHelper.fetchUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                final users = snapshot.data!.docs.reversed.toList();
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final userid = users[index].data();
                    final userid1 = users[index];

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            userid['task'],
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 16.0),
                          leading: InkWell(
                            onTap: () async {
                              selectFile();
                              final snapshot =
                                  await uploadTask!.whenComplete(() => {});
                              final url = await snapshot.ref.getDownloadURL();
                              TodoFirebaseHelper().updateDataToFirestore(
                                  userid1.id,
                                  FiA3RohanAlertWrite.taskdata,
                                  url);
                            },
                            child: FiA2RohanAvator(
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: (pickedFile == null)
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.deepOrange,
                                        ))
                                      : userid["url"] == ""
                                          ? Icon(Icons.ac_unit)
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child:
                                                  Image.network(userid["url"]),
                                            )),
                            ),
                          ),
                          trailing: InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: 80,
                              child: IconBox(data: userid1.id),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 5, color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No data found.'),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
