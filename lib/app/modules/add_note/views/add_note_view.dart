import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/utils/common_textformfield.dart';
import '../controllers/add_note_controller.dart';

class AddNoteView extends StatelessWidget {
  AddNoteView({super.key});
  final controller = Get.put(AddNoteController());

  @override
  Widget build(BuildContext context) {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CommonTextFormField(controller: titleCtrl, hintText: 'Title',
            onChanged: (value) => controller.title.value = value,
            ),
            const SizedBox(height: 12),
            CommonTextFormField(controller: descCtrl, hintText: 'Description',
              onChanged: (value) => controller.description.value = value,
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.save,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
