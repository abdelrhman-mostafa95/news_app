import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_cruze/api_manager/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '7eb1696871c74e83bb961a5ecbf46e38';

//https://newsapi.org/v2/top-headlines/sources?apiKey=7eb1696871c74e83bb961a5ecbf46e38
  static Future<SourcesResponse> getSources(String catId) async {
    var url = Uri.http(baseUrl, 'v2/top-headlines/sources',
        {'apiKey': '7eb1696871c74e83bb961a5ecbf46e38', 'category': catId});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var sourceResponse = SourcesResponse.fromJson(json);
    return sourceResponse;
  }
}
