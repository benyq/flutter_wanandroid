
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final homeStateProvider = NotifierProvider<HomeStateNotifier, HomeState>(() => HomeStateNotifier());

class HomeStateNotifier extends Notifier<HomeState> {
  @override
  HomeState build() {
    return const HomeState();
  }

  void increment() {
    state = state.copyWith(isLoading: !state.isLoading);
    Future.delayed(const Duration(seconds: 2), (){
      state = state.copyWith(username: "kobe");
    });
  }

}

class HomeState extends Equatable{
  final bool isLoading;
  final String username;

  const HomeState({this.isLoading = false, this.username = "benyq"});

  HomeState copyWith({
    bool? isLoading,
    String? username,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
    );
  }

  @override
  List<Object?> get props => [isLoading, username];
}