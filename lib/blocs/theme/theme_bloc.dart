
import 'package:equatable/equatable.dart';
import 'package:vrit_todo/blocs/bloc_barrier.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial(darkMode: false)) {
    on<DarkThemeEvent>((event, emit) {
      emit(const ThemeState(darkMode: true),);
    });
    on<LightThemeEvent>((event, emit) => 
    emit(const ThemeState(darkMode: false)));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}