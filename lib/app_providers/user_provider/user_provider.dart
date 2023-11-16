import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid/app_providers/user_provider/user_state.dart';
import 'package:flutter_wanandroid/net/model/login_model.dart';

class UserProvider extends AutoDisposeNotifier<UserState> {
  @override
  UserState build() {
    return const UserState();
  }

  void setUser(LoginModel loginModel) {
    state = UserState(id: loginModel.id, username: loginModel.username, coinCount: loginModel.coinCount, collectIds: loginModel.collectIds);
  }
}

final userProvider =
    NotifierProvider.autoDispose<UserProvider, UserState>(() => UserProvider());
