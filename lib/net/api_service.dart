import 'package:dio/dio.dart';
import 'package:flutter_wanandroid/net/api_response.dart';
import 'package:retrofit/http.dart';
import 'model/banner_model.dart';

part '../generated/api_service.g.dart';

@RestApi(baseUrl: "https://www.wanandroid.com/")
abstract class WanAndroidService {
  factory WanAndroidService(Dio dio, {String baseUrl}) = _WanAndroidService;

  @GET("banner/json")
  Future<ApiResponse<List<BannerModel>>> banner();

}