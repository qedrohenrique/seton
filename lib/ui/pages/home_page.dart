import 'package:flutter/material.dart';
import 'package:notas/ui/pages/create_note_page.dart';
import 'package:notas/ui/components/notes_app_bar.dart';
import 'package:notas/ui/components/notes_empty_state.dart';
import 'package:notas/ui/components/notes_floating_button.dart';
import 'package:provider/provider.dart';

import '../../domain/note.dart';
import '../../domain/services/notes_service.dart';
import '../../infrastructure/db/notes_repository.dart';
import '../components/notes_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final notesService = NotesService();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final notesRepository = context.watch<NotesRepository>();
    var notes = notesRepository.notes;

    updateNotes() {
      notesRepository.getAll();
    }

    return Scaffold(
      appBar: const NotesAppBar(title: 'Notas'),
        floatingActionButton: NotesFloatingButton(
            buttonIcon: Icons.add, onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NotesAddNote()))
              .then((res) {
            updateNotes();
          });
      }),
        body: ListView.separated(
            padding: const EdgeInsets.only(
                top: 8, left: 16, bottom: 16, right: 16),
            itemBuilder: (BuildContext context, int index) {
              return NotesCard(note: notes[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: notes.length)
    );
  }
}
