import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wanandroid/app_providers/theme_provider/themes_provider.dart';
import 'package:flutter_wanandroid/net/dio_manager.dart';
import 'package:flutter_wanandroid/ui/splash_page.dart';
import 'package:flutter_wanandroid/app_providers/theme_provider/themes.dart';
import 'package:mmkv/mmkv.dart';

void main() async{
  final rootDir = await MMKV.initialize();
  debugPrint("rootDir: $rootDir");
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      builder: (context, child){
        return MaterialApp(
          debugShowMaterialGrid: false,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: themeModeState.mode,
          debugShowCheckedModeBanner: false,
          home: child,
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
        );
      },
      child: const SplashPage(),
    );
  }
}
