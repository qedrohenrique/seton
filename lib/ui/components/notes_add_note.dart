import 'package:flutter/material.dart';
import 'package:notas/domain/note.dart';
import 'package:notas/domain/services/notes_service.dart';

import 'notes_app_bar.dart';
import 'notes_floating_button.dart';

class NotesAddNote extends StatefulWidget {
  NotesAddNote({super.key});

  final notesService = NotesService();

  @override
  State<NotesAddNote> createState() => _NotesAddNoteState();
}

class _NotesAddNoteState extends State<NotesAddNote> {
  final titleController = new TextEditingController();
  final contentController = new TextEditingController();

  save(String title, String content) {
    Note note = Note(content: content, title: title);
    widget.notesService.save(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotesAppBar(title: 'Criar Nota'),
      floatingActionButton: NotesFloatingButton(
        buttonIcon: Icons.save,
        onPressed: () {
          save(titleController.text, contentController.text);
        },
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Expanded(
              child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Título"),
              ),
              Expanded(
                child: TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                      labelText: "Conteúdo...", alignLabelWithHint: true),
                  maxLines: 50,
                ),
              ),
            ],
          ))),
    );
  }
}
