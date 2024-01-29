import 'package:flutter/material.dart';
import 'package:vrit_todo/models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;
  final VoidCallback deletePermanentCallback;
  const PopupMenu({
    Key? key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
    required this.deletePermanentCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false?((contex) => [
              PopupMenuItem(
                onTap: null,
                child: TextButton.icon(
                  onPressed: editTaskCallback,
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit"),
                ),
              ),
              PopupMenuItem(
                onTap: null,
                child: TextButton.icon(
                  onPressed: likeOrDislikeCallback,
                  icon: task.isFavorite == false
                  ? const Icon(Icons.bookmark_add_outlined)
                  : const Icon(Icons.bookmark_remove),
                  label: task.isFavorite == false
                  ? const Text("Add to \nBookmarks")
                  : const Text("Remove from \nBookmarks"),
                ),
              ),
              PopupMenuItem(
                onTap: null,
                child: TextButton.icon(
                  onPressed: cancelOrDeleteCallback,
                  icon: const Icon(Icons.delete),
                  label: const Text("Delete"),
                ),
              ),
            ])
            :(context) => [
              PopupMenuItem(
                onTap: restoreTaskCallback,
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.restore_from_trash),
                  label: const Text("Restore"),
                ),
              ),
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: deletePermanentCallback,
                  icon: const Icon(Icons.delete_forever),
                  label: const Text("Delete Forever"),
                ),
                onTap: (){},
              ),
            ]);
  }
}