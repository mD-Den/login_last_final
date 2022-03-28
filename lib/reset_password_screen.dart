import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_last_final/login_page.dart';

import 'auth_controller.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List images = ['g.png', 't.png', 'f.png'];

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

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
                    backgroundColor: Colors.black,
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
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.deepOrangeAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
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
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance
                    .resetPassword(emailController.text.trim());
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
                    "Send to Email",
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
            GestureDetector(
              onTap: () => Get.offAll(LoginPage()),
              child: RichText(
                text: TextSpan(
                  text: "Home",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[500],
                  ),
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
