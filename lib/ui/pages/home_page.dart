import 'package:flutter/material.dart';
import 'package:notas/ui/components/notes_app_bar.dart';
import 'package:notas/ui/components/notes_empty_state.dart';
import 'package:notas/ui/components/notes_floating_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final creatingNote = false;
    final icon = creatingNote ? Icons.add : Icons.save;

    return Scaffold(
      appBar: const NotesAppBar(title: 'Notas'),
      floatingActionButton: NotesFloatingButton(buttonIcon: icon),
      body: const Center(child: NotesEmptyState())
    );
  }
}
