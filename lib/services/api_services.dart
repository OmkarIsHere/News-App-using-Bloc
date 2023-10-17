import 'package:dio/dio.dart';
import 'package:practice_retrofit/model/top_headlines.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: 'https://gnews.io/api/v4')
abstract class ApiServices{
   static const apiKey = 'b196e45e073ad0e93f1f815ae7ebbe0e';
   static const lang = 'en';
   static const country = 'in';

   factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
   
   @GET('/top-headlines?lang=$lang&country=$country&apikey=$apiKey&category={cat}')
   Future<TopHeadLines> getTopHeadLines(@Path("cat") String cat);

}
