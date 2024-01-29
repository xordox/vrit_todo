import 'package:flutter/material.dart';
import 'package:vrit_todo/blocs/bloc_barrier.dart';
import 'package:vrit_todo/screens/tabs_screen.dart';
import 'package:vrit_todo/screens/recycle_bin.dart';

class AppDrawer extends StatelessWidget{
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text(
                "Task Drawer",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.id),
                  child: ListTile(
                    leading: const Icon(
                      Icons.folder_special,
                    ),
                    title: const Text("My Tasks"),
                    trailing: Text("${state.pendingTasks.length} | ${state.completedTasks.length}"),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(
                      Icons.delete,
                    ),
                    title: const Text("Bin"),
                    trailing: Text("${state.removedTasks.length}"),
                  ),
                );
              },
            ),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch(
                    value: state.darkMode,
                    onChanged: (newValue) {
                      newValue? context.read<ThemeBloc>().add(DarkThemeEvent())
                      :context.read<ThemeBloc>().add(LightThemeEvent());
                    },);
              },
            )
          ],
        ),
      ),
    );
  }
}
