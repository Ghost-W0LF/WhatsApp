import 'package:flutter/material.dart';
import 'package:whats_app_ui/constants/colors.dart';

class CustButton extends StatelessWidget {
  CustButton({
    super.key,
    this.onPressed,
    required this.text,
    this.isTextButton = false,
  });
  bool isTextButton;
  VoidCallback? onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return isTextButton
        ? TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.green,
                  ),
            ),
          )
        : ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(
                Size(MediaQuery.of(context).size.width - 80, 50),
              ),
              backgroundColor: WidgetStateProperty.all(TColors.whatsAppGreen),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            ),
          );
  }
}
