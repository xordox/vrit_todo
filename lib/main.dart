import 'package:flutter/material.dart';
import 'package:vrit_todo/blocs/task_bloc_observer.dart';
import 'package:vrit_todo/screens/tabs_screen.dart';
import 'package:vrit_todo/services/app_router.dart';
import 'package:vrit_todo/services/app_theme.dart';

import 'blocs/bloc_barrier.dart';

void main() {
  Bloc.observer = TaskBlocObserver();
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.darkMode?
            AppThemes.appThemeData[AppTheme.darkTheme]
            :AppThemes.appThemeData[AppTheme.lightTheme],
            home:  const TabsScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}