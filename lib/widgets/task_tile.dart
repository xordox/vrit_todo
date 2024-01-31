import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vrit_todo/blocs/bloc_barrier.dart';
import 'package:vrit_todo/models/task.dart';
import 'package:vrit_todo/screens/edit_task_screen.dart';
import 'package:vrit_todo/widgets/popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TaskBloc>().add(DeleteTask(task: task))
        : ctx.read<TaskBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child:  EditTaskScreen(oldTask: task,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false
                  ? const Icon(Icons.star_outline)
                  :const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        decoration: task.isDone == true
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    Text(
                      task.description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        decoration: task.isDone == true
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    Text(DateFormat()
                        .add_yMMMd()
                        .add_Hms()
                        .format(DateTime.parse(task.date))),
                        
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [  
              Checkbox(
                onChanged: task.isDone == false
                    ? (value) {
                        context.read<TaskBloc>().add(UpdateTask(task: task));
                      }
                    : null,
                value: task.isDone,
              ),
              PopupMenu(
                task: task,
              cancelOrDeleteCallback:()=> _removeOrDeleteTask(context, task),
              likeOrDislikeCallback: ()=> context.read<TaskBloc>()
              .add(MarkFavoriteOrUnfavoriteTask(task: task),),
              editTaskCallback: (){
                Navigator.of(context).pop();
                _editTask(context);
              },
              restoreTaskCallback: () =>
              context.read<TaskBloc>().add(RestoreTask(task: task)),
              deletePermanentCallback: ()=>context.read<TaskBloc>().add(PermanentDeleteTaskEvent(task: task)),),
            ],
          ),
        ],
      ),
    );
  }
}