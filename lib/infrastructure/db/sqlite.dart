import 'package:notas/domain/note.dart';
import 'package:notas/infrastructure/db/models/NoteModel.dart';
import 'package:sqflite/sqflite.dart';

const String TABLE = "notes";
const String COLUMN_ID = "_id";
const String COLUMN_TITLE = "title";
const String COLUMN_CONTENT = "content";

class NotesContext {
  NotesContext._();

  static final NotesContext instance = NotesContext._();

  static Database? _db;

  get db async {
    if (_db != null) return _db;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
        'notes.db',
        version: 1,
        onCreate: (Database db, int version) async {
      return await db.execute('''
        create table $TABLE (
          $COLUMN_ID integer primary key autoincrement,
          $COLUMN_TITLE text not null,
          $COLUMN_CONTENT text not null
        )
      ''');
    });
  }
}