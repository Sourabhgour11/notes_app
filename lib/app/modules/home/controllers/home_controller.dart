import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/note.dart';
import '../../../data/repositories/note_repository.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final NoteRepository repo;
  HomeController(this.repo);

  final notes = <Note>[].obs;
  final query = ''.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
    ever(query, (_) => _applySort());
  }

  void loadNotes() {
    notes.assignAll(repo.getAll());
  }

  List<Note> get filtered {
    final q = query.value.trim().toLowerCase();
    if (q.isEmpty) return notes;
    return notes.where((n) =>
    n.title.toLowerCase().contains(q) ||
        n.description.toLowerCase().contains(q)
    ).toList();
  }

  void onAdd() => Get.toNamed(Routes.addNote)!.then((_) => loadNotes());

  void openDetail(Note n) {
    Get.toNamed(Routes.noteDetail, arguments: n.id)!.then((_) => loadNotes());
  }

  Future<void> togglePin(Note n) async {
    final updated = n.copyWith(isPinned: !n.isPinned);
    await repo.update(updated);
    loadNotes();
  }

  Future<void> deleteNote(Note n) async {
    await repo.delete(n.id);
    loadNotes();
  }

  void _applySort() {

    loadNotes();
  }

}