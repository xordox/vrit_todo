import 'package:flutter/material.dart';
import 'package:vrit_todo/blocs/bloc_barrier.dart';
import 'package:vrit_todo/models/task.dart';
import 'package:vrit_todo/widgets/task_list.dart';

class PendingTasksScreen extends StatelessWidget{
  const PendingTasksScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTasks;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Center(
              child: Chip(label: Text("${state.pendingTasks.length} Pending | ${state.completedTasks.length} Completed ",)),
            ),
            TaskList(tasksList: taskList),
          ],
        );
      },
    );
  }
}