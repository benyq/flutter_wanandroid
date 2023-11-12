import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wanandroid/ui/login/login_page.dart';
import 'package:flutter_wanandroid/ui/main_page.dart';
import 'package:flutter_wanandroid/ui/splash_page.dart';
import 'package:flutter_wanandroid/ui/themes.dart';
import 'package:flutter_wanandroid/app_states/theme_state/themes_provider.dart';

import 'net/dio_manager.dart';


void main() {
  DioManager.getInstance().init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);
    return MaterialApp(
      debugShowMaterialGrid: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeModeState,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    );
  }
}
