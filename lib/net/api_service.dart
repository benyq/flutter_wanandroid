import 'package:dio/dio.dart';
import 'package:flutter_wanandroid/net/api_response.dart';
import 'package:flutter_wanandroid/net/page_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'model/article_model.dart';
import 'model/banner_model.dart';
import 'model/login_model.dart';

part '../generated/api_service.g.dart';

@RestApi(baseUrl: "https://www.wanandroid.com/")
abstract class WanAndroidService {
  factory WanAndroidService(Dio dio, {String baseUrl}) = _WanAndroidService;

  @GET("banner/json")
  Future<ApiResponse<List<BannerModel>>> banner([@CancelRequest() CancelToken? cancelToken]);

  @GET("article/top/json")
  Future<ApiResponse<List<ArticleModel>>> getTopArticles();

  @GET("article/list/{page}/json")
  Future<ApiResponse<PageModel<ArticleModel>>> getArticles(@Path() int page);

  @POST("user/login")
  @FormUrlEncoded()
  Future<ApiResponse<LoginModel>> login(@Field("username") String username, @Field("password") String password);
}