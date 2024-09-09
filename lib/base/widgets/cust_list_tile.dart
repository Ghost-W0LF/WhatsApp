import 'package:flutter/material.dart';

  /// Creates a list tile.
  
class CustListTile extends StatelessWidget {
  ///Creates a list tile.
///
///Returns Containers of shape circle for Image and a Text widget for the [title] and subtitle.
///The title and subtitle are wrapped in a Row widget.
///[leading] is a bool set false to hide by default
///[title] is the title of the list tile.
///[tralingIcon] to set the leading icon
  const CustListTile(
      {super.key,
      required this.title,
      this.leading = false,
      this.tralingIcon,
      required this.iconData});

  /// Set Icon for Leading circular Container.
  final IconData iconData;

  /// Set Title of the tile
  final String title;

  /// Wether to set Leading or not
  final bool leading;

  /// Set Traling Icon
  final IconData? tralingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          )),
      title: Text(title),
      trailing: leading ? Icon(tralingIcon) : null,
    );
  }
}
