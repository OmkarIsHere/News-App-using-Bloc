import 'package:dio/dio.dart';

import '../model/top_headlines.dart';
import '../services/api_services.dart';

class MyHomePageRepo{
  final _apiServices = ApiServices(Dio());
  late List<Articles> articles;

  Future<List<Articles>> fetchData(String cat) async{
    print('Cat: $cat');
    final topHeadLines = await _apiServices.getTopHeadLines(cat);
    articles = topHeadLines.articles;
    print('data: ${articles[0].url}');
    return articles;
  }
}
