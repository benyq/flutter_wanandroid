import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themesProvider = StateNotifierProvider<ThemesProvider, ThemeMode?>((_) {
  return ThemesProvider();
});

class ThemesProvider extends StateNotifier<ThemeMode?> {
  ThemesProvider() : super(ThemeMode.system) {
    state = ThemeMode.dark;
  }

  void changeTheme(bool isDark) {
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }
}