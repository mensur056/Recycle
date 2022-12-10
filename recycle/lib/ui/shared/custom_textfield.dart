import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.isObscure,
    required this.labelText,
  }) : super(key: key);
  final String hintText;
  final bool isObscure;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        labelStyle: const TextStyle(color: Colors.green, fontSize: 14),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 92, 210, 96), width: 2),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
