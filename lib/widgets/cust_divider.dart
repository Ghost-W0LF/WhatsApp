import 'package:flutter/material.dart';

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
