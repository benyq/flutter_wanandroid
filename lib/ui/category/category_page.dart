import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin{
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text('CategoryPage$_count'),
      onTap: () {
        setState(() {
          _count++;
        });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
