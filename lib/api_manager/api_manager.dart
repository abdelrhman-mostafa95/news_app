import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_cruze/api_manager/news_model/NewsResponse.dart';
import 'package:news_app_cruze/api_manager/seorces_model/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '7eb1696871c74e83bb961a5ecbf46e38';

//https://newsapi.org/v2/top-headlines/sources?apiKey=7eb1696871c74e83bb961a5ecbf46e38
  Future<SourcesResponse> getSources(String catId) async {
    var url = Uri.http(baseUrl, 'v2/top-headlines/sources',
        {'apiKey': '7eb1696871c74e83bb961a5ecbf46e38', 'category': catId});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var sourceResponse = SourcesResponse.fromJson(json);
    return sourceResponse;
  }

//   https://newsapi.org/v2/everything?q=bitcoin&apiKey=7eb1696871c74e83bb961a5ecbf46e38
  Future<NewsResponse> getNews(String sourceId) async {
    var url = Uri.http(
        baseUrl, 'v2/everything', {'apiKey': apiKey, 'sources': sourceId});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

  static Future<NewsResponse> search(String search, {String? sourceId}) async {
    var url = Uri.http(baseUrl, 'v2/top-headlines/',
        {'apiKey': apiKey, 'sources': sourceId, 'q': search});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
