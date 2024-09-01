import 'package:flutter/material.dart';

class CustTextFormField extends StatelessWidget {
  const CustTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.iconData,
    this.obscureText = false,
    this.validator,
  });

  final TextEditingController controller;
  final String? hintText;
  final IconData? iconData;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
