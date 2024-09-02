import 'package:flutter/cupertino.dart';

class NotesEmptyState extends StatelessWidget {
  const NotesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(image: AssetImage('assets/images/EmptyPlaceholder.png'));
  }
}


