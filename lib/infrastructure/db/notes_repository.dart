import 'package:flutter/cupertino.dart';
import 'package:notas/infrastructure/db/sqlite.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/note.dart';
import 'models/NoteModel.dart';

class NotesRepository extends ChangeNotifier{

  late Database database;

  List<Note> notes = [];

  NotesRepository() {
    _initRepository();
  }

  _initRepository() async {
    await getAll();
  }

  Future close() async {
    final db = await NotesContext.instance.db;
    await db.close();
  }

  insert(Note note) async {
    final db = await NotesContext.instance.db;
    final noteModel = NoteModel(title: note.title, content: note.content);
    await db.insert(TABLE, noteModel.toMap());

    notes.add(note);
    notifyListeners();
  }

  getAll() async {
    database = await NotesContext.instance.db!;

    List<Map<String, Object?>> maps = await database.query(TABLE,
        columns: [COLUMN_ID, COLUMN_TITLE, COLUMN_CONTENT]);

    List<Note> noteList = maps.map((m) {
      NoteModel noteModel = NoteModel.fromMap(m);
      return Note(content: noteModel.content, title: noteModel.title);
    }).toList();

    notes = noteList;
    notifyListeners();
  }
}