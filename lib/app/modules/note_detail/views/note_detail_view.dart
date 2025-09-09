import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/note_detail_controller.dart';

class NoteDetailView extends StatelessWidget {
  NoteDetailView({super.key});
  final controller = Get.put(NoteDetailController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final n = controller.note.value;
      if (n == null) {
        return Scaffold(
          appBar: AppBar(),
          body: const Center(child: Text('Note not found')),
        );
      }
      final date = DateFormat.yMMMd().add_jm().format(n.createdAt);

      return Scaffold(
        appBar: AppBar(
          title: const Text('Note Detail'),
          actions: [
            IconButton(
              tooltip: controller.isEditing.value ? 'Save' : 'Edit',
              onPressed: () => controller.isEditing.value ? controller.saveChanges() : controller.toggleEdit(),
              icon: Icon(controller.isEditing.value ? Icons.check : Icons.edit),
            ),
            IconButton(
              tooltip: 'Delete',
              onPressed: controller.deleteNote,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Created: $date', style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: 12),
              controller.isEditing.value
                  ? TextField(
                controller: controller.titleController,
                onChanged: (v) => controller.title.value = controller.titleController.text,
                decoration: const InputDecoration(labelText: 'Title'),
              )
                  : Text(n.title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Expanded(
                child: controller.isEditing.value
                    ? TextField(
                  controller: controller.descriptionController,
                  onChanged: (v) => controller.description.value = controller.descriptionController.text,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                )
                    : SingleChildScrollView(child: Text(n.description)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
