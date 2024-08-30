import 'package:flutter/material.dart';
import 'package:whats_app_ui/constants/colors.dart';

class CustListTile extends StatelessWidget {
  const CustListTile(
      {super.key,
      required this.title,
      this.leading = false,
      this.leadingIcon,
      required this.iconData});

  final IconData iconData;
  final String title;
  final bool leading;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: TColors.whatsAppGreen,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          )),
      title: Text(title),
      trailing: leading ? Icon(leadingIcon) : null,
    );
  }
}
