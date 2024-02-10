import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smarttra_web/widgets/text_widget.dart';

import '../widgets/button_widget.dart';
import '../widgets/textfield_widget.dart';
import '../widgets/toast_widget.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/train 2.png',
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: 'Smarttra - Admin',
              fontSize: 24,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
                color: Colors.black,
                width: 375,
                label: 'Email',
                controller: usernameController),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
                showEye: true,
                color: Colors.black,
                width: 375,
                isObscure: true,
                label: 'Password',
                controller: passwordController),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              width: 375,
              color: Colors.blue,
              label: 'Login',
              onPressed: () {
                login(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text, password: passwordController.text);

      showToast('Logged in succesfully!');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found with that email.");
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        showToast("Invalid email provided.");
      } else if (e.code == 'user-disabled') {
        showToast("User account has been disabled.");
      } else {
        showToast("An error occurred: ${e.message}");
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
