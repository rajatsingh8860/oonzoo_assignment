import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.obscureText = false,
      this.errorText = "",
      this.textInputType = TextInputType.text,
      this.textInputFormatter,  this.maxLength, required this.onChanged})
      : super(key: key);
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final String errorText;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final int? maxLength;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter == null ? [] : textInputFormatter!,
      maxLength: maxLength,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText.isEmpty ? null : errorText,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
