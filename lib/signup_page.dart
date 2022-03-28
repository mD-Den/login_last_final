import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  List images = ['g.png', 't.png', 'f.png'];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    bool isEnabled = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "img/signup.png",
                    ),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.17,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 35,
                    backgroundImage: AssetImage(
                      "img/profile1.png",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Form(
                key: key1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: Form(
                        child: TextFormField(
                          validator: validateEmail,
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.deepOrangeAccent,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: .1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email adress is required';
                          }

                          Pattern pattern =
                              r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                          RegExp regex = RegExp(pattern as String);
                          if (!regex.hasMatch(value)) {
                            print("JJJJJJ");
                            return '🚩 Please enter a valid email address.';
                          } else {
                            print("ooooooooo");
                            return null;
                          }
                        },
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(
                            Icons.password_outlined,
                            color: Colors.deepOrangeAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: .1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(),
                    //     ),
                    //     Text(
                    //       "Forgot your Password?",
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //         color: Colors.grey[500],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 75,
            ),

            GestureDetector(
              onTap: () {
                AuthController.instance.register(emailController.text.trim(),
                    passwordController.text.trim());
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage(
                        "img/loginbtn.png",
                      ),
                      fit: BoxFit.cover),
                ),
                child: const Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "Have an account?",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                ),
              ),
            ),
            // SizedBox(
            //   height: w * 0.15,
            // ),
            // RichText(
            //   text: TextSpan(
            //     text: "Sign up using one of the following methods",
            //     style: TextStyle(
            //       color: Colors.grey[500],
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            // Wrap(
            //   children: List<Widget>.generate(3, (index) {
            //     return Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: CircleAvatar(
            //         radius: 30,
            //         backgroundColor: Colors.grey[500],
            //         child: CircleAvatar(
            //           radius: 25,
            //           backgroundImage: AssetImage(
            //             'img/' + images[index],
            //           ),
            //         ),
            //       ),
            //     );
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'Email adress is required';
  }

  Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  RegExp regex = RegExp(pattern as String);
  if (!regex.hasMatch(formEmail)) {
    return '🚩 Please enter a valid email address.';
  } else {
    return null;
  }
}

bool validatePassword(String? formPassword) {
  Pattern pattern = r'^[a-zA-Z0-9].{6,}$';
  RegExp regex = RegExp(pattern as String);

  if (formPassword == null ||
      formPassword.isEmpty ||
      regex.hasMatch(formPassword)) {
    return true;
  } else {
    return false;
  }
}

class WaitWidget extends StatefulWidget {
  bool isEnabled;
  WaitWidget({Key? key, required this.isEnabled}) : super(key: key);

  @override
  _WaitWidgetState createState() => _WaitWidgetState();
}

class _WaitWidgetState extends State<WaitWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isEnabled
        ? Container(
            height: 55,
            width: 55,
            child: CircularProgressIndicator(),
          )
        : Container(
            height: 55,
            width: 55,
          );
  }
}

Widget loandingIndicator() {
  return Container(height: 55, width: 55, child: CircularProgressIndicator());
}
