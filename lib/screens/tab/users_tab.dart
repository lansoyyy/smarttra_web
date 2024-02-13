import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/add_user.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textfield_widget.dart';
import '../../widgets/toast_widget.dart';

class AddUserTab extends StatefulWidget {
  const AddUserTab({super.key});

  @override
  State<AddUserTab> createState() => _AddUserTabState();
}

class _AddUserTabState extends State<AddUserTab> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: 'New User Details',
              fontSize: 18,
              fontFamily: 'Bold',
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldWidget(
                  controller: emailController,
                  label: 'Email',
                ),
                const SizedBox(
                  width: 20,
                ),
                TextFieldWidget(
                  isObscure: true,
                  showEye: true,
                  controller: passwordController,
                  label: 'Password',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldWidget(
                  controller: firstnameController,
                  label: 'First Name',
                ),
                const SizedBox(
                  width: 20,
                ),
                TextFieldWidget(
                  controller: lastnameController,
                  label: 'Last Name',
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: ButtonWidget(
                label: 'Add User',
                onPressed: () async {
                  try {
                    var userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    addUser(
                      firstnameController.text,
                      lastnameController.text,
                      '',
                      emailController.text,
                      userCredential.user?.uid ?? "",
                    );

                    showToast('User added succesfully!');
                  } catch (e) {
                    showToast(e.toString());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
