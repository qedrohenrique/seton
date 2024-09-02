import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notas/domain/note.dart';
import 'package:notas/ui/components/notes_card.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key, required this.notes});

  final List<Note> notes;

  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(top: 8, left: 16, bottom: 16, right: 16),
        itemBuilder: (BuildContext context, int index) {
          return NotesCard(note: notes[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: notes.length);
  }
}
