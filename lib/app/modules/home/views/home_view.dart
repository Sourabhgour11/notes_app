import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/theme_controller.dart';
import '../controllers/home_controller.dart';
import '../../../data/repositories/note_repository.dart';
import '../widgets/note_tile.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController(NoteRepository()));

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Notes'),
        actions: [
          IconButton(
            tooltip: 'Toggle Theme',
            onPressed: themeC.toggleTheme,
            icon: const Icon(Icons.brightness_6),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              onChanged: (v) => controller.query.value = v,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search notes...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final items = controller.filtered;
        if (items.isEmpty) {
          return const _EmptyState();
        }
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, i) => NoteTile(
            note: items[i],
            onTap: () => controller.openDetail(items[i]),
            onTogglePin: () => controller.togglePin(items[i]),
            onDelete: () => controller.deleteNote(items[i]),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.note_alt_outlined, size: 72, color: Theme.of(context).colorScheme.outline),
            const SizedBox(height: 16),
            Text(
              'No notes yet',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Tap + to create your first note.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
