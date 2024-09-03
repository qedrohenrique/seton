import 'package:notas/domain/note.dart';
import '../sqlite.dart';

class NoteModel {
  NoteModel({this.id, required this.title, required this.content});

  int? id;
  String title;
  String content;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      COLUMN_TITLE: title,
      COLUMN_CONTENT: content,
    };
    if (id != null) {
      map[COLUMN_ID] = id;
    }
    return map;
  }

  static NoteModel fromMap(Map<String, Object?> map) {
    return new NoteModel(
        id: int.parse(map[COLUMN_ID].toString()),
        title: map[COLUMN_TITLE].toString(),
        content: map[COLUMN_CONTENT].toString());
  }
}
