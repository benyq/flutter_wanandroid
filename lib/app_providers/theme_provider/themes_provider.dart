import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid/app_providers/theme_provider/theme_state.dart';

final themesProvider = NotifierProvider<ThemesProvider, ThemeState>(() {
  return ThemesProvider();
});

class ThemesProvider extends Notifier<ThemeState> {

  void changeTheme(bool isDark) {
    final mode = isDark ? ThemeMode.dark : ThemeMode.light;
    state = state.copyWith(mode: mode);
  }

  @override
  ThemeState build() {
    return const ThemeState(mode: ThemeMode.light);
  }
}