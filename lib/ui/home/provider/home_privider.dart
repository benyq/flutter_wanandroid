import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid/app_providers/third_provider/api_provider.dart';

import 'home_state.dart';

final homeStateProvider =
    NotifierProvider<HomeStateNotifier, HomeState>(() => HomeStateNotifier());

class HomeStateNotifier extends Notifier<HomeState> {

  int pageIndex = 0;

  @override
  HomeState build() {
    return const HomeState([], []);
  }

  Future<void> loadMore() async{
    getArticles();
  }

  Future<void> refresh() async {
    pageIndex = 0;
    final topArticles = await ref.read(apiProvider).getTopArticles();
    if (topArticles.isSuccess) {
      state = state.copyWith(articles: topArticles.data!);
    }
    final articles = await ref.read(apiProvider).getArticles(pageIndex);
    if (articles.isSuccess) {
      final data = articles.data!.datas ?? [];
      state = state.copyWith(articles: state.articles + data);
    }
  }

  void getBanner() {
    ref.read(apiProvider).banner().then((value){
        if (value.isSuccess) {
          state = state.copyWith(banners: value.data!);
          pageIndex += 1;
        }
    }, onError: (e) {
      debugPrint("home _getBanner error: $e");
    });
  }

  void getTopArticles() {
    ref.read(apiProvider).getTopArticles().then((value) {
      if (value.isSuccess) {
        state = state.copyWith(articles: value.data!);
      }
    }, onError: (e) {
      debugPrint("home getTopArticles error: $e");
    });
  }

  void getArticles() async{
    try{
      final response = await ref.read(apiProvider).getArticles(pageIndex);
      if (response.isSuccess) {
        final data = response.data!.datas ?? [];
        state = state.copyWith(articles: state.articles + data);
        pageIndex += 1;
      }
    }catch(e) {
      debugPrint("home getArticles error: $e");
    }
  }

}
