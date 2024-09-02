import 'package:flutter/material.dart';
import 'package:notas/ui/pages/home_page.dart';
import 'package:notas/ui/theme/custom_theme.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(94, 52, 193, 1)),
        useMaterial3: false,
        extensions: const [
          CustomTheme(
            backgroundColor: Colors.white,
            textColor: Colors.black,
          ),
        ]
      ),
      home: HomePage(),
    );
  }
}
