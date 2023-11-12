import 'dart:convert';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid/net/dio_manager.dart';
import 'package:flutter_wanandroid/ui/home/home_view_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends ConsumerState<HomePage> {

  String _text = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeStateProvider);
    return EasyRefresh(
      header: const CupertinoHeader(),
        footer: const CupertinoFooter(),
        child: Column(
          children: [
            TextButton(onPressed: (){
              ref.read(homeStateProvider.notifier).increment();
            }, child: Text("change"),),
            Text(homeState.username),
            Text('${homeState.isLoading}'),
            Text(_text),
            ElevatedButton(onPressed: ()async{
              var message = await getArticles();
              setState(() {
                _text = message;
              });
            }, child: Text('articles'))
          ],
        ),);
  }

  Future<String> getBanner() async {
    try {
      var result = await androidService.banner();
      return jsonEncode(result.data);
    } catch (e) {
      print(e);
      return '${e}empty';
    }
  }

  Future<String> getArticles() async {
    try {
      var result = await androidService.getArticles(0);
      for (var value in result.data!.datas!) {
        print(value.title);
      }
      return json.encode(result.data!.datas!);
    } catch (e) {
      print(e);
      return '${e}empty';
    }
  }
}