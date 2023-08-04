import 'package:fi_a3_rohan/constants/static.dart';
import 'package:fi_a3_rohan/screens/signup/todo_signup.dart';
import 'package:flutter/material.dart';
import '../../services/todo_firebase.dart';
import '../../utils/error_alert.dart';
import '../../widgets/core/todo_button.dart';
import '../../widgets/core/todo_textfield.dart';
import '../home/todo_home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FiA3RohanLogin extends StatefulWidget {
  const FiA3RohanLogin({super.key});

  @override
  State<FiA3RohanLogin> createState() => _FiA3RohanLoginState();
}

class _FiA3RohanLoginState extends State<FiA3RohanLogin> {
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  final emailCount = TextEditingController();
  final passwrdCount = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    bool passwordVisible = false;
    @override
    void initState() {
      super.initState();
      passwordVisible = true;
    }

    void login() {
      if (formkey.currentState!.validate()) {}
      setState(() {
        loading = false;
      });
      _auth
          .signInWithEmailAndPassword(
              email: emailCount.text, password: passwrdCount.text.toString())
          .then(
        (value) {
          ErrorAlertbox().toastMessage(value.user!.email.toString());
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FiA3RohanHome()));
          setState(
            () {
              loading = true;
            },
          );
          TodoFirebaseHelper.uid = value.user!.uid;
        },
      ).onError(
        (error, stackTrace) {
          ErrorAlertbox().toastMessage(error.toString());
          setState(
            () {
              loading = false;
            },
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            FiA3RohanSizedBox.height20,
            FiA3RohanSizedBox.height20,
            Image.asset(
              FiA3RohanImages.clock,
              width: 80,
            ),
            const Text(
              "Login Now",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
            FiA3RohanSizedBox.height10,
            const Text(
              "Please enter the details below to continue",
              style: TextStyle(fontSize: 17, color: FiA3RohanColors.lightgrey),
            ),
            FiA3RohanSizedBox.height10,
            Form(
              key: formkey,
              child: Column(
                children: [
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
                    opscuretext: passwordVisible,
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
                  FiA3RohanSizedBox.height10,
                  FiA3RohanButton(
                    loading: loading,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {}
                      login();
                    },
                    color: const Color.fromARGB(255, 33, 172, 182),
                    child: const Text("login"),
                  ),
                  FiA3RohanSizedBox.height10,
                  FiA3RohanButton(
                    loading: loading,
                    onPressed: () {
                      TodoFirebaseHelper().signInWithGoogle();
                    },
                    color: Colors.white,
                    child: Row(children: [
                      SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset("assets/google.png")),
                      const Text(
                        "Sign in with Google",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FiA3RohanSignup()));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  // const FiA3RohanTextFieldEmail(),
                ],
              ),
            ),
            FiA3RohanSizedBox.height10,
          ],
        ),
      ),
    );
  }
}
