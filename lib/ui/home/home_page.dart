import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/net/dio_manager.dart';
import '../../net/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {

  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text(_text),
        ElevatedButton(onPressed: ()async{
          var data = await getData();
          setState(() {
            _text = data;
          });
        }, child: Text("获取数据"))
      ],
    ),);
  }


  Future<String> getData() async {
    try {
      var result = await DioManager.getInstance().androidService.banner();
      return jsonEncode(result.data);
    } catch (e) {
      print(e);
      return '${e}empty';
    }
  }
}