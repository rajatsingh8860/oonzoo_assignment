import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:oonzoo_assignment/app/utils/strings.dart';
import 'package:oonzoo_assignment/app/widgets/custom_button.dart';
import 'package:oonzoo_assignment/app/widgets/custom_textfield.dart';

import '../../../utils/urls.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.network(
                Urls.logo,
                height: 60,
              )),
              const SizedBox(
                height: 50,
              ),
              const Text(
                Strings.register,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(Strings.fullName,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              CustomTextField(
                textEditingController: controller.nameController,
                hintText: Strings.enterFullName,
                onChanged: (val) {
                  controller.listenName();
                },
                errorText: controller.nameErrorText.value,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(Strings.email,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              CustomTextField(
                textEditingController: controller.emailController,
                hintText: Strings.enterEmail,
                onChanged: (val) {
                  controller.listenEmail();
                },
                errorText: controller.emailErrorText.value,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(Strings.mobileNumber,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              CustomTextField(
                textEditingController: controller.mobileController,
                hintText: Strings.enterMobileNumber,
                onChanged: (val) {
                  controller.listenMobileNumber();
                },
                errorText: controller.mobileErrorText.value,
                textInputType: TextInputType.number,
                maxLength: 10,
                textInputFormatter: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(Strings.password,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              CustomTextField(
                textEditingController: controller.passwordController,
                hintText: Strings.enterPassword,
                onChanged: (val) {
                  controller.listenPassword();
                },
                obscureText: true,
                errorText: controller.passwordErrorText.value,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(Strings.passwordDescription),
              const SizedBox(
                height: 20,
              ),
              registerButton()
            ],
          ),
        ),
      ),
    ));
  }

  Widget registerButton() {
    return CustomButton(
      buttonText: "Register",
      buttonColor: Colors.deepOrangeAccent,
      textColor: Colors.white,
      onTap: controller.register,
    );
  }
}
