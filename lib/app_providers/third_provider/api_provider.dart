import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid/net/dio_manager.dart';


final apiProvider = Provider((ref) {
  return DioManager.getInstance().androidService;
});