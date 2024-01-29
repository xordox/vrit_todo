import 'package:flutter/material.dart';
import 'package:vrit_todo/blocs/bloc_barrier.dart';
import 'package:vrit_todo/models/task.dart';
import 'package:vrit_todo/widgets/task_list.dart';

class FavoriteTasksScreen extends StatelessWidget{
  const FavoriteTasksScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.favoriteTasks;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Center(
              child: Chip(label: Text("${taskList.length} Tasks",)),
            ),
            TaskList(tasksList: taskList),
          ],
        );
      },
    );
  }
}