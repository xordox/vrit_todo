import 'package:flutter/material.dart';
import 'package:vrit_todo/blocs/bloc_barrier.dart';
import 'package:vrit_todo/models/task.dart';
import 'package:vrit_todo/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Task item = widget.tasksList.removeAt(oldIndex);
            widget.tasksList.insert(newIndex, item);
          });
        },
        children: widget.tasksList
            .map((task) => ReorderableDelayedDragStartListener(
                  key: Key(task.id.toString()),
                  index: widget.tasksList.indexOf(task),
                  child: Card(
                    key: Key(task.id.toString()),
                    elevation: 2.0,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TaskTile(task: task,),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
