import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_wanandroid/net/api_service.dart';

class DioManager {
  static DioManager? _instance;

  static DioManager getInstance() {
    _instance ??= DioManager._internal();
    return _instance!;
  }

  DioManager._internal();
  final Dio _dio = Dio();
  late WanAndroidService _androidService;
  WanAndroidService get androidService => _androidService;

  void init() {
    var logger = LogInterceptor(responseBody: true, requestBody: true);
    _dio.interceptors.add(logger);
    final cookieJar = CookieJar();
    _dio.interceptors.add(CookieManager(cookieJar));
    _androidService = WanAndroidService(_dio);
  }


}
