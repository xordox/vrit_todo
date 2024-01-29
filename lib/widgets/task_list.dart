import 'package:flutter/material.dart';
import 'package:vrit_todo/blocs/bloc_barrier.dart';
import 'package:vrit_todo/models/task.dart';
import 'package:vrit_todo/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasksList
          .map((task) => ExpansionPanelRadio(
            value: task.id, 
            headerBuilder: (context, isOpen) => TaskTile(task: task),
             body: ListTile(
               title: SelectableText.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Title:\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: task.title),
                    const TextSpan(
                      text: "\n\nDescription:\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: task.description),
                  ]
                )
               ),
             ))).toList(),
        ),
      ),
    );
  }
}

