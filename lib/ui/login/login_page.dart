import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wanandroid/ui/login/auth_provider.dart';

import '../../navigator_util/ss.dart';
import '../main_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _pwdController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _pwdController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(authProvider);
    ref.listen(authProvider, (previous, next) {
      if (next.isLoading) {
        _showLoading();
      } else {
        SmartDialog.dismiss();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: "用户名",
            ),
          ),
          TextField(
            controller: _pwdController,
            decoration: InputDecoration(
              labelText: "密码",
            ),
          ),
          ElevatedButton(
              child: Text("登录"),
              onPressed: () {
                _login();
              }),
          Text(loginState.username)
        ],
      ),
    );
  }


  void _showLoading() async {
    SmartDialog.showLoading();
  }


  _login() async{
    ref.read(authProvider.notifier).login();
  }
}
