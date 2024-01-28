part of 'task_bloc.dart';

class TaskState extends Equatable {
  const TaskState({this.allTasks = const <Task>[]});

  final List<Task> allTasks;
  
  @override
  List<Object> get props => [allTasks];
}