import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid/app_providers/theme_provider/themes.dart';
import 'package:flutter_wanandroid/app_providers/theme_provider/themes_provider.dart';
import 'package:flutter_wanandroid/app_providers/user_provider/user_provider.dart';
import 'package:flutter_wanandroid/ui/login/login_page.dart';
import 'package:flutter_wanandroid/utils/navigate_util.dart';


class MePage extends ConsumerWidget {
  const MePage({super.key});

  final Color _darkColor = const Color(0x66000000);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);
    SystemChrome.setSystemUIOverlayStyle(Themes.getSystemUIOverlayStyle(themeModeState.isDark));
    final userState = ref.watch(userProvider);
    return Container(
      color: themeModeState.isDark ? const Color(0x00049fb6) : const Color(0xffededed),
      child: Column(
        children: [
          GestureDetector(onTap: (){
            if (!userState.isLoggedIn) {
              navigateTo(context, const LoginPage());
            }
          }, child: Container(
            margin: EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
            padding: EdgeInsets.all(15.w),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: themeModeState.isDark ? _darkColor : Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      width: 80.w,
                      height: 80.w,
                      "assets/images/ic_logo.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      userState.user,
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _userInfoItem("收藏", userState.collects),
                    _userInfoItem("硬币", userState.coin),
                    _userInfoItem("排名", userState.realRank),
                  ],
                )
              ],
            ),
          ),),
          Container(
            margin: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
            padding: EdgeInsets.all(15.w),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: themeModeState.isDark ? _darkColor : Colors.white,
            ),
            child: Column(
              children: [
                _settingCell(Icons.mode_night_rounded, "夜间模式",
                    selected: themeModeState.isDark,
                    switchAction: (value) {
                      ref.read(themesProvider.notifier).changeTheme(value);
                    }),
                Divider(height: 1.h),
                _settingCell(Icons.language, "语言",
                    onTap: () {
                      //页面跳转
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _userInfoItem(String key, String value) {
    return Column(
      children: [
        Text(key, style: TextStyle(fontSize: 16.sp, )),
        Text(value, style: TextStyle(fontSize: 16.sp)),
      ],
    );
  }

  Widget _settingCell(IconData icon, String title,
      {bool? selected, ValueChanged<bool>? switchAction, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 40.h,
        child: Row(children: [
          Icon(icon, size: 25.w),
          SizedBox(width: 10.w,),
          Expanded(child: Text(title),),
          selected == null
              ? const Icon(Icons.arrow_forward_ios_rounded)
              : CupertinoSwitch(
                  value: selected,
                  onChanged: (value) {
                    switchAction?.call(value);
                  }),
        ]),
      ),
    );
  }
}
