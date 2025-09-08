import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/note.dart';
import '../../../data/repositories/note_repository.dart';

class AddNoteController extends GetxController {
  final title = ''.obs;
  final description = ''.obs;

  final _uuid = const Uuid();
  final repo = NoteRepository();

  Future<void> save() async {
    if (title.value.trim().isEmpty) {
      Get.snackbar('Validation', 'Title is required');
      return;
    }
    final note = Note(
      id: _uuid.v4(),
      title: title.value.trim(),
      description: description.value.trim(),
      createdAt: DateTime.now(),
    );
    await repo.add(note);
    Get.back(); // return to home
  }
}
