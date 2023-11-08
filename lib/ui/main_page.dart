import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid/ui/category/category_page.dart';
import 'package:flutter_wanandroid/ui/home/home_page.dart';
import 'package:flutter_wanandroid/ui/me/me_page.dart';
import 'package:flutter_wanandroid/ui/project/project_page.dart';
import 'package:flutter_wanandroid/ui/themes_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _currentIndex = 0;

  final List<_BottomData> _bottomItemData = [
    _BottomData("首页", Icons.home),
    _BottomData("项目", Icons.local_fire_department),
    _BottomData("分类", Icons.category),
    _BottomData("我的", Icons.person)
  ];
  final List<Widget> _pages = const [
    HomePage(),
    ProjectPage(),
    CategoryPage(),
    MePage()
  ];

  @override
  Widget build(BuildContext context) {
    final themeData = ref.watch(themesProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(_bottomItemData[_currentIndex].label),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {},
              child: const SizedBox.square(
                dimension: 50,
                child: Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              ))
        ],
        toolbarHeight: 50,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [..._bottomItemData.map((e) => _bottomItem(e, Theme.of(context).bottomNavigationBarTheme.backgroundColor))],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex),
    );
  }

  BottomNavigationBarItem _bottomItem(_BottomData data, Color? background) {
    return BottomNavigationBarItem(
        icon: Icon(data.iconData), label: data.label, backgroundColor: background);
  }
}

class _BottomData {
  IconData iconData;
  String label;

  _BottomData(this.label, this.iconData);
}
