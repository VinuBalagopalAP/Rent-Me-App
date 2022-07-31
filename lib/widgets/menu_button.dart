import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const ImageIcon(
        AssetImage("assets/images/apps_outlined.png"),
        color: Colors.black,
      ),
    );
  }
}
