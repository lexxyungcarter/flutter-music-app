import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../utils/constants.dart';
import '../models/theme_state.dart';

final themeProvider =
    StateNotifierProvider<ThemeStateNotifier, ThemeState>((ref) {
  final box = Hive.box(Constants.settingsStorageKey);
  var themeState = ThemeState.initial();

  // dark theme mode
  final isDarkModeOn = box.get('darkMode');

  if (isDarkModeOn != null && isDarkModeOn.toString() == 'yes') {
    return ThemeStateNotifier(
      themeState.copyWith(isDarkMode: true, mode: ThemeMode.dark),
    );
  }

  return ThemeStateNotifier(
    themeState.copyWith(isDarkMode: false, mode: ThemeMode.light),
  );
});

class ThemeStateNotifier extends StateNotifier<ThemeState> {
  ThemeStateNotifier(super.state);

  void toggle() {
    bool isDarkMode = state.isDarkMode;

    state = state.copyWith(
      mode: isDarkMode ? ThemeMode.light : ThemeMode.dark,
      isDarkMode: !isDarkMode,
    );

    updateStorage(!isDarkMode);
  }

  void setMode(bool isDarkMode) {
    state = state.copyWith(
      mode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      isDarkMode: isDarkMode,
    );

    updateStorage(isDarkMode);
  }

  void updateStorage([bool isDarkModeOn = false]) {
    final box = Hive.box(Constants.settingsStorageKey);
    isDarkModeOn ? box.put('darkMode', 'yes') : box.delete('darkMode');
  }
}
