import 'package:flutter/material.dart';
import 'package:notas/ui/components/notes_app_bar.dart';
import 'package:notas/ui/components/notes_empty_state.dart';
import 'package:notas/ui/components/notes_floating_button.dart';
import 'package:notas/ui/components/notes_list.dart';

import '../../domain/note.dart';
import '../components/notes_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final creatingNote = false;
    final icon = creatingNote ? Icons.add : Icons.save;

    final notes = [
      new Note(title: "Título 1", content: "Descrição 1"),
      new Note(title: "Título 2", content: "Descrição 2")
    ];

    return Scaffold(
      appBar: const NotesAppBar(title: 'Notas'),
      floatingActionButton: NotesFloatingButton(buttonIcon: icon),
      body: notes.isEmpty ? const Center(child: NotesEmptyState()) : NotesList(notes: notes)
    );
  }
}