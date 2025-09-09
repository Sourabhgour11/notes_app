import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/models/note.dart';
import '../../../data/repositories/note_repository.dart';

class NoteDetailController extends GetxController {
  final repo = NoteRepository();
  late final String noteId;
  final note = Rx<Note?>(null);

  final isEditing = false.obs;
  final title = ''.obs;
  final description = ''.obs;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    noteId = Get.arguments as String;
    load();
  }

  void load() {
    final n = repo.getById(noteId);
    note.value = n;
    if (n != null) {
      titleController.text = n.title;
      descriptionController.text = n.description;
    }
  }

  Future<void> toggleEdit() async {
    isEditing.value = !isEditing.value;
  }

  Future<void> saveChanges() async {
    final n = note.value;
    if (n == null) return;
    final updated = n.copyWith(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
    );
    await repo.update(updated);
    load();
    isEditing.value = false;
    Get.snackbar('Saved', 'Note updated');
  }

  Future<void> deleteNote() async {
    await repo.delete(noteId);
    Get.back();
  }
}
