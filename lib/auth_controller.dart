import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:login_last_final/login_page.dart';
import 'package:login_last_final/welcome_page.dart';

class AuthController extends GetxController {
  //AuthController instance...
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);

    //our user would be notifies
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        if (user == null) {
          print('Login page');
          Get.offAll(() => LoginPage());
        } else {
          Get.offAll(() => WelcomePage(
                email: user.email!,
              ));
        }
      },
    );
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      print("Успех");
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.greenAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "The letter was successfully sent to",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          email,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } catch (e) {
      print("НЕЕЕЕЕЕЕЕТ");
      print(e);
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Unsuccessful mailing",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          'Error',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void register(String email, password) async {
    try {
      // validatePassword(password);
      // validateEmail(email);
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Login failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void logOut() async {
    await auth.signOut();
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

  String? validatePassword(String? formPassword) {
    Pattern pattern = r'^[a-zA-Z0-9].{6,}$';
    RegExp regex = RegExp(pattern as String);
    print('oKaY');

    if (formPassword == null ||
        formPassword.isEmpty ||
        regex.hasMatch(formPassword)) {
      print('sususu');
      return 'Password is required.';
    } else {
      print('NO NO NO');
      return null;
    }
  }
}

// User? user = auth.currentUser;
//
// String? email = user!.email;
//
// //Create field for user to input old password
//
// //pass the password here
// String password = "password";
// String newPassword = "password";
//
// try {
//   UserCredential userCredential =
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: email!,
//     password: password,
//   );
//
//   user.updatePassword(newPassword).then((_) {
//     print("Successfully changed password");
//   }).catchError((error) {
//     print("Password can't be changed" + error.toString());
//     //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
//   });
//   Get.offAll(() => LoginPage());
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//     print('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     print('Wrong password provided for that user.');
//   }
// }
