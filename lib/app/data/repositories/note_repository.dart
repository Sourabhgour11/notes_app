import 'package:hive/hive.dart';
import 'package:notes_app/app/data/services/hive_services.dart';
import '../models/note.dart';

class NoteRepository {
  final Box<Note> _box = HiveService.notesBox;

  List<Note> getAll() {
    final values = _box.values.toList();
    // pinned first, then recent
    values.sort((a, b) {
      if (a.isPinned != b.isPinned) return b.isPinned ? 1 : -1;
      return b.createdAt.compareTo(a.createdAt);
    });
    return values;
  }

  Future<void> add(Note note) async {
    await _box.put(note.id, note);
  }

  Future<void> update(Note note) async {
    await _box.put(note.id, note);
  }

  Future<void> delete(String id) async {
    await _box.delete(id);
  }

  Note? getById(String id) => _box.get(id);
}
