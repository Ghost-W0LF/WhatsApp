import 'package:flutter/material.dart';

/// A custom `TextFormField` widget for the creation of text input fields.
///
///Creates a [FormField] that contains a [TextField],
///[HintText],[prefixIcon],[validator],[controller] are the parameters
///BorderRadius is set defautl to [10].
///[obscureText]is false by default, set true to hide the text

class CustTextFormField extends StatelessWidget {
  const CustTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.iconData,
    this.obscureText = false,
    required this.controller,
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
      validator: validator,
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
