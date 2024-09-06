import 'package:flutter/material.dart';


///Creates a list tile.
///
///Returns Containers of shape circle for Image and a Text widget for the title and subtitle.
///The title and subtitle are wrapped in a Row widget.
///
///[title] is the title of the list tile.
///
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
          decoration:const BoxDecoration(
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
