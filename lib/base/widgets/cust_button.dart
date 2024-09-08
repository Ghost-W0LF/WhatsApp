import 'package:flutter/material.dart';
import 'package:whats_app_ui/utils/constants/t_colors.dart';

class CustButton extends StatelessWidget {
  ///creates a button
  ///
  ///Takes the parameters [onPressed],[text],[isTextButton]
  ///if bool [isTextButton] is set true will return textbutton
  ///else will return elevated button
  ///By defult [isTextButton] is false
  ///Color is Set to Tcolors.whatsAppGreen
  const CustButton({
    super.key,
    this.onPressed,
    required this.text,
    this.isTextButton = false,
  });

  /// Set true to create a text button
  final bool isTextButton;

  ///Call back the on pressed method
  final VoidCallback? onPressed;

  ///Text to be displayed on the button
  final String text;
  @override
  Widget build(BuildContext context) {
    return isTextButton
        ? TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Tcolors.whatsAppGreen,
                  ),
            ),
          )
        : ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(
                Size(MediaQuery.of(context).size.width * 0.8, 50),
              ),
              backgroundColor: WidgetStateProperty.all(Tcolors.whatsAppGreen),
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
