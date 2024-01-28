
import 'package:flutter/material.dart';
import 'package:vrit_todo/blocs/bloc_barrier.dart';
import 'package:vrit_todo/model/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  TextEditingController titleController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Add Task", style: TextStyle(fontSize: 24),),
          const SizedBox(height: 10,),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: ()=> Navigator.pop(context), child: const Text("Cancel"),),
              ElevatedButton(onPressed: (){
                Task task = Task(title: titleController.text,);
                context.read<TaskBloc>().add(AddTask(task: task));
                Navigator.pop(context);
              }, child: const Text("Add"),),
            ],
          )
        ],
      ),
    );
  }
}