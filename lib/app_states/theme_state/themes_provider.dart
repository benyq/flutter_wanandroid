import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themesProvider = NotifierProvider<ThemesProvider, ThemeMode?>(() {
  return ThemesProvider();
});

class ThemesProvider extends Notifier<ThemeMode?> {

  void changeTheme(bool isDark) {
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  ThemeMode? build() {
    return ThemeMode.light;
  }
}