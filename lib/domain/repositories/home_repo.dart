import 'package:dio/dio.dart';

import '../../features/home/model/top_headlines.dart';
import '../services/api_services.dart';

class HomeRepo{
  final _apiServices = ApiServices(Dio());
  late List<Articles> articles;

  Future<List<Articles>> fetchData(String cat) async{
    final topHeadLines = await _apiServices.getTopHeadLines(cat);
    articles = topHeadLines.articles;
    print('data: ${articles[0].url}');
    return articles;
  }
}
