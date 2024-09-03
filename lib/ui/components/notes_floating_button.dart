import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesFloatingButton extends StatelessWidget {
  const NotesFloatingButton({super.key, required this.buttonIcon, required this.onPressed});

  final VoidCallback onPressed;

  final IconData buttonIcon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
        shape: const CircleBorder(),
        child: Icon(buttonIcon),
      );
  }
}
