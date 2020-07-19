import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final Function onTap;

  MenuListTile(
      {@required this.title,
      @required this.subtitle,
      @required this.icon,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: icon,
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    );
  }
}
