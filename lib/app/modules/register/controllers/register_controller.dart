import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:oonzoo_assignment/app/routes/app_pages.dart';
import 'package:oonzoo_assignment/app/utils/extension.dart';
import 'package:oonzoo_assignment/app/utils/loading.dart';

class RegisterController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RxString nameErrorText = "".obs,
      emailErrorText = "".obs,
      mobileErrorText = "".obs,
      passwordErrorText = "".obs;

  void listenEmail() {
    if (!emailController.text.isValidEmail()) {
      emailErrorText.value = "Enter valid email";
    } else {
      emailErrorText.value = "";
    }
  }

  void listenName() {
    if (!nameController.text.isValidName()) {
      nameErrorText.value = "Enter valid name";
    } else {
      nameErrorText.value = "";
    }
  }

  void listenMobileNumber() {
    if (!mobileController.text.isValidPhone()) {
      mobileErrorText.value = "Enter valid mobile no";
    } else {
      mobileErrorText.value = "";
    }
  }

  void listenPassword() {
    if (!passwordController.text.isValidPassword()) {
      passwordErrorText.value = "Enter valid password";
    } else {
      passwordErrorText.value = "";
    }
  }

  void register() async {
    nameErrorText.value = "";
    mobileErrorText.value = "";
    passwordErrorText.value = "";
    emailErrorText.value = "";
    if (!nameController.text.isValidName()) {
      nameErrorText.value = "Enter valid name";
    }
    if (!mobileController.text.isValidPhone()) {
      mobileErrorText.value = "Enter valid mobile no";
    }
    if (!emailController.text.isValidEmail()) {
      emailErrorText.value = "Enter valid email";
    }
    if (!passwordController.text.isValidPassword()) {
      passwordErrorText.value = "Enter valid password";
    } else {
      LoadingUtils.showLoader();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        LoadingUtils.hideLoader();
        Get.toNamed(Routes.LOGIN);
        Fluttertoast.showToast(msg: "User registered successfully , please login");
      } on FirebaseAuthException catch (e) {
        LoadingUtils.hideLoader();
        if (e.code == 'weak-password') {
          Fluttertoast.showToast(msg: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(
              msg: 'The account already exists for that email.');
        }
      }

    }
  }
}
