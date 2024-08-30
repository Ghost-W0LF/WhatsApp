import 'package:flutter/material.dart';

class CustTextFormField extends StatelessWidget {
  const CustTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.iconData,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String? hintText;
  final IconData? iconData;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (controller) {
        if (controller == null || controller.isEmpty) {
          return 'Cannot be empty';
        }
        return null;
      },
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
