import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState extends Equatable{
  bool isLoading;
  String username;

  LoginState({this.isLoading = false, this.username = "benyq"});

  LoginState copyWith({
    bool? isLoading,
    String? username,
  }) {
    return LoginState(
      isLoading: isLoading?? this.isLoading,
      username: username?? this.username,
    );
  }

  @override
  List<Object?> get props => [isLoading, username];
}

class AuthProvider extends AutoDisposeNotifier<LoginState> {

  void login() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2), (){
      state = state.copyWith(username: "benyq2");
    });
    state = state.copyWith(isLoading: false);
  }

  @override
  build() {
    return LoginState();
  }
}


final authProvider = NotifierProvider.autoDispose<AuthProvider, LoginState>(() => AuthProvider());

