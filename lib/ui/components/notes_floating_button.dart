import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesFloatingButton extends StatelessWidget {
  const NotesFloatingButton({super.key, required this.buttonIcon});

  final buttonIcon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
        shape: const CircleBorder(),
        child: Icon(buttonIcon),
      );
  }
}
