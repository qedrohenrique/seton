import 'package:notas/infrastructure/db/sqlite.dart';

import '../../domain/note.dart';
import 'models/NoteModel.dart';

class NotesRepository {

  Future close() async {
    final db = await NotesContext.database;
    await db.close();
  }

  Future<Note> insert(Note note) async {
    final db = await NotesContext.database;
    final noteModel = new NoteModel(title: note.title, content: note.content);
    await db.insert(TABLE, noteModel.toMap());
    return note;
  }

  Future<List<Note>> getAll() async {
    final db = await NotesContext.database;
    List<Map<String, Object?>> maps = await db.query(TABLE,
        columns: [COLUMN_ID, COLUMN_TITLE, COLUMN_CONTENT]);

    List<Note> notes = maps.map((m) {
      NoteModel noteModel = NoteModel.fromMap(m);
      return Note(content: noteModel.content, title: noteModel.title);
    }).toList();

    return notes;
  }
}