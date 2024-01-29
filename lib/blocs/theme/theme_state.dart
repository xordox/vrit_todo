part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool darkMode;
  const ThemeState({required this.darkMode});
  
  @override
  List<Object> get props => [darkMode];

  Map<String, dynamic> toMap() {
    return {
      'darkMode': darkMode,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      darkMode: map['darkMode'] ?? false,
    );
  }

 }

class ThemeInitial extends ThemeState {
  const ThemeInitial({required bool darkMode}) : super(darkMode: darkMode);
}