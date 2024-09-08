import 'package:flutter/material.dart';

///Creat a custom divider With a Text in between
///
///
///Thickness is set to 2

class CustDivider extends StatelessWidget {
  const CustDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 2,
            indent: 20,
            endIndent: 40,
          ),
        ),
        Text("OR"),
        Expanded(
          child: Divider(
            thickness: 2,
            endIndent: 40,
            indent: 20,
          ),
        ),
      ],
    );
  }
}
