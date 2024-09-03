import 'package:flutter/material.dart';
import 'package:notas/infrastructure/db/notes_repository.dart';
import 'package:notas/ui/pages/home_page.dart';
import 'package:notas/ui/theme/custom_theme.dart';
import 'package:notas/util/colors.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotesRepository())
      ],
      child: NotesApp(),
    )
  );
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.purple),
        useMaterial3: false,
        extensions: const [
          CustomTheme(
            backgroundColor: Colors.white,
            textColor: Colors.black,
          ),
        ],
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //   backgroundColor: CustomColors.purple
        // ),
      ),
      home: HomePage(),//CreateNotePage(), //
    );
  }
}
