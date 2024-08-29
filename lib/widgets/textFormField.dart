import 'package:flutter/material.dart';

class CustTextFormField extends StatelessWidget {
  CustTextFormField({
    super.key,
    required this.emailController,
    this.hintText,
    this.iconData,
    this.obscureText=false,
  });

  final TextEditingController emailController;
  final String? hintText;
  final IconData? iconData;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
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
