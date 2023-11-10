import 'dart:convert';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/net/dio_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {

  String _text = "";

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      header: const CupertinoHeader(),
        footer: const CupertinoFooter(),
        child: Text(_text));
  }


  Future<String> getData() async {
    try {
      var result = await androidService.banner();
      return jsonEncode(result.data);
    } catch (e) {
      print(e);
      return '${e}empty';
    }
  }
}