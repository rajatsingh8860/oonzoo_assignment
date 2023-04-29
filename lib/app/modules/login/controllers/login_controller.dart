import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:oonzoo_assignment/app/routes/app_pages.dart';
import 'package:oonzoo_assignment/app/utils/extension.dart';
import 'package:oonzoo_assignment/app/utils/loading.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RxString emailErrorText = "".obs, passwordErrorText = "".obs;

  void listenEmail() {
    if (!emailController.text.isValidEmail()) {
      emailErrorText.value = "Enter valid email";
    } else {
      emailErrorText.value = "";
    }
  }

  void listenPassword() {
    if (!passwordController.text.isValidPassword()) {
      passwordErrorText.value = "Enter valid password";
    } else {
      passwordErrorText.value = "";
    }
  }

  void login() async {
    passwordErrorText.value = "";
    emailErrorText.value = "";
    if (!emailController.text.isValidEmail()) {
      emailErrorText.value = "Enter valid email";
    }
    if (!passwordController.text.isValidPassword()) {
      passwordErrorText.value = "Enter valid password";
    } else {
      LoadingUtils.showLoader();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        LoadingUtils.hideLoader();
        Get.offAllNamed(Routes.HOME);
      } on FirebaseAuthException catch (e) {
        LoadingUtils.hideLoader();
        if (e.code == 'user-not-found') {
          Fluttertoast.showToast(msg: 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
        }
      }
    }
  }
}
