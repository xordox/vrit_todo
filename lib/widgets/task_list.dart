import 'package:flutter/material.dart';
import 'package:vrit_todo/model/task.dart';

import '../blocs/bloc_barrier.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          Task task = tasksList[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              onChanged: (value) {
                context.read<TaskBloc>().add(UpdateTask(task: task));
              },
              value: task.isDone,
            ),
            onLongPress: () => context.read<TaskBloc>()..add(DeleteTask(task: task)),
          );
        });
  }
}