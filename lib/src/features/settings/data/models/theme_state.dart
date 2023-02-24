import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode mode;
  final bool isDarkMode;

  ThemeState({
    required this.mode,
    required this.isDarkMode,
  });

  factory ThemeState.initial() {
    return ThemeState(
      mode: ThemeMode.light,
      isDarkMode: false,
    );
  }

  ThemeState copyWith({
    ThemeMode? mode,
    bool? isDarkMode,
  }) {
    return ThemeState(
      mode: mode ?? this.mode,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
