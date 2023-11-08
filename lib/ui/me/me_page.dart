import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../themes_provider.dart';

class MePage extends ConsumerWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);
    return Center(
      child: CupertinoSwitch(
        value: themeModeState == ThemeMode.dark,
        onChanged: (value){
          ref.read(themesProvider.notifier).changeTheme(value);
        },
      ),
    );
  }

}

