import 'package:notas/domain/note.dart';
import 'package:notas/infrastructure/db/notes_repository.dart';

class NotesService {

  final notesRepository = NotesRepository();

  Future<List<Note>> getAll() async {
    return await notesRepository.getAll();
  }

  Future save(Note note) async {
    await notesRepository.insert(note);
  }
}