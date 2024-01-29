import 'package:flutter/material.dart';
import 'package:vrit_todo/blocs/bloc_barrier.dart';
import 'package:vrit_todo/screens/app_drawer.dart';
import 'package:vrit_todo/widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Recycle Bin"),
            actions: [
              PopupMenuButton(itemBuilder: (context) => [
                PopupMenuItem(child: TextButton.icon(onPressed: null,
                icon: const Icon(Icons.delete_forever), 
                label: const Text("Delete all tasks"),),
                onTap: ()=> context
                .read<TaskBloc>()
                .add(DeleteAllTasks()),),
              ])
            ],
          ),
          drawer:  AppDrawer(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Center(
                  child: Chip(
                      label: Text(
                    "${state.removedTasks.length} Tasks",
                  )),
                ),
                 TaskList(tasksList: state.removedTasks),
              ],
            ),
          ),
        );
      },
    );
  }
}