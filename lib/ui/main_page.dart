import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid/app_states/nav_states/nav_notifier.dart';
import 'package:flutter_wanandroid/ui/category/category_page.dart';
import 'package:flutter_wanandroid/ui/home/home_page.dart';
import 'package:flutter_wanandroid/ui/me/me_page.dart';
import 'package:flutter_wanandroid/ui/project/project_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  static final List<_BottomData> _bottomItemData = [
    _BottomData("首页", Icons.home),
    _BottomData("项目", Icons.local_fire_department),
    _BottomData("分类", Icons.category),
    _BottomData("我的", Icons.person)
  ];
  static const List<Widget> _pages = [
    HomePage(),
    ProjectPage(),
    CategoryPage(),
    MePage()
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    final navState = ref.read(navStateProvider);
    _pageController = PageController(initialPage: navState.index);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navState = ref.watch(navStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(_bottomItemData[navState.index].label),
        automaticallyImplyLeading: false,
        actions: [
          Offstage(
            offstage: navState.index != 0,
            child: InkWell(
                onTap: () {
                  Fluttertoast.showToast(
                      msg: "This is Center Short Toast",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: const SizedBox.square(
                  dimension: 50,
                  child: Icon(
                    Icons.search_rounded,
                    size: 30,
                  ),
                )),
          )
        ],
        toolbarHeight: 50,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index){
          ref.read(navStateProvider.notifier).changeIndex(index);
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            ..._bottomItemData.map((e) => _bottomItem(
                e, Theme.of(context).bottomNavigationBarTheme.backgroundColor))
          ],
          onTap: (index) {
            _changeNavIndex(index);
          },
          currentIndex: navState.index),
    );
  }

  void _changeNavIndex(int index) {
    ref.read(navStateProvider.notifier).changeIndex(index);
    _pageController.jumpToPage(index);
  }

  BottomNavigationBarItem _bottomItem(_BottomData data, Color? background) {
    return BottomNavigationBarItem(
        icon: Icon(data.iconData),
        label: data.label,
        backgroundColor: background);
  }
}

class _BottomData {
  IconData iconData;
  String label;

  _BottomData(this.label, this.iconData);
}
