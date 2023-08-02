import 'package:fi_a3_rohan/constants/static.dart';
import 'package:flutter/material.dart';
import '../../utils/error_alert.dart';
import '../../widgets/core/todo_button.dart';
import '../../widgets/core/todo_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FiA3RohanSignup extends StatefulWidget {
  const FiA3RohanSignup({super.key});

  @override
  State<FiA3RohanSignup> createState() => _FiA3RohanSignupState();
}

class _FiA3RohanSignupState extends State<FiA3RohanSignup> {
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  final emailCount = TextEditingController();
  final nameCount = TextEditingController();
  final passwrdCount = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    bool passwordVisible = false;
    @override
    void initState() {
      super.initState();
      passwordVisible = true;
    }

    void signup() {
      if (formkey.currentState!.validate()) {}
      setState(() {
        loading = true;
      });
      _auth
          .createUserWithEmailAndPassword(
              email: emailCount.text.toString(),
              password: passwrdCount.text.toString())
          .then((value) {
        setState(() {
          loading = false;
        });
      }).onError(
        (error, stackTrace) {
          ErrorAlertbox().toastMessage(error.toString());
          setState(() {
            loading = false;
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 172, 182),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 33, 172, 182),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 150, width: 280, child: Image.asset("register.png")),
              Container(
                width: double.infinity,
                height: 620,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      FiA3RohanSizedBox.height30,
                      TodoTextField(
                        keyboard: TextInputType.text,
                        controller: nameCount,
                        hinttext: "FullName",
                        opscuretext: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Name';
                          }
                          return "";
                        },
                        child1: const Icon(null),
                        child: const Icon(Icons.person),
                      ),
                      TodoTextField(
                        keyboard: TextInputType.emailAddress,
                        controller: emailCount,
                        hinttext: "Email",
                        opscuretext: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email';
                          } else if (!value.endsWith(".com")) {
                            return ".com is missing";
                          } else if (!value.contains("@")) {
                            return "@ is missing...";
                          }
                          return "";
                        },
                        child1: const Icon(null),
                        child: const Icon(
                          Icons.alternate_email,
                          color: Color(0xff323F4B),
                        ),
                      ),
                      TodoTextField(
                        opscuretext: false,
                        keyboard: TextInputType.text,
                        controller: passwrdCount,
                        hinttext: "Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          } else if (value.length < 8) {
                            return 'Enter atleast 8 digits';
                          }
                          return "";
                        },
                        child1: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        child: const Icon(
                          Icons.lock_open,
                          color: Color(0xff323F4B),
                        ),
                      ),
                      FiA3RohanSizedBox.height30,
                      FiA3RohanButton(
                        loading: loading,
                        onPressed: () {
                          signup();
                        },
                        color: const Color.fromARGB(255, 33, 172, 182),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
