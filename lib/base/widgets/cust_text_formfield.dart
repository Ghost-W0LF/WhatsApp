import 'package:flutter/material.dart';

/// To create a TextForm Field

class CustTextFormField extends StatelessWidget {
  /// A custom `TextFormField` widget for the creation of text input fields.
  ///
  /// Creates a [FormField] that contains a [TextField],
  /// [HintText],[prefixIcon],[validator],[controller] are the parameters.
  /// BorderRadius is set defautl to [10].
  /// [obscureText]is false by default, set true to hide the text
  const CustTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.iconData,
    this.obscureText = false,
    required this.controller,
  });

  /// To define the controller for the field
  final TextEditingController controller;

  /// To define the hint text for the field
  final String? hintText;

  /// To define the validator for the field
  final IconData? iconData;

  /// To set the obscure text for the field
  final bool obscureText;

  /// To define the validators for the field
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
