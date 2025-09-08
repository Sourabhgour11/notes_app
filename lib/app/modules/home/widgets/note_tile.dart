import 'package:flutter/material.dart';
import '../../../data/models/note.dart';
import 'package:intl/intl.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onTogglePin;
  final VoidCallback onDelete;

  const NoteTile({
    super.key,
    required this.note,
    required this.onTap,
    required this.onTogglePin,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMd().add_jm().format(note.createdAt);
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(note.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          note.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Wrap(
          spacing: 6,
          children: [
            IconButton(
              tooltip: note.isPinned ? 'Unpin' : 'Pin',
              onPressed: onTogglePin,
              icon: Icon(note.isPinned ? Icons.push_pin : Icons.push_pin_outlined),
            ),
            IconButton(
              tooltip: 'Delete',
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      ),
    );
  }
}
