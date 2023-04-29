import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      this.icon,
      this.borderColor,  this.onTap})
      : super(key: key);

  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final Color? borderColor;
  final Icon? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? (){},
      child: Container(
        height: Get.height * 0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: buttonColor,
            border: borderColor == null ? null : Border.all(color: borderColor!)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon == null
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: icon!,
                    ),
              Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
