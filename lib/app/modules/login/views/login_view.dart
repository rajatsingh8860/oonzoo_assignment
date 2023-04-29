import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oonzoo_assignment/app/routes/app_pages.dart';
import 'package:oonzoo_assignment/app/utils/urls.dart';

import '../../../utils/strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Image.network(
                Urls.logo,
                height: 60,
              )),
              const SizedBox(
                height: 50,
              ),
              const Text(
                Strings.login,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
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
              loginButton(),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: const Center(child: Text(Strings.newToFirstCry)))
            ],
          ),
        ),
      ),
    ));
  }

  Widget loginButton() {
    return CustomButton(
      buttonText: Strings.login,
      buttonColor: Colors.deepOrangeAccent,
      textColor: Colors.white,
      onTap: controller.login,
    );
  }
}
