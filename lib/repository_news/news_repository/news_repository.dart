import 'package:news_app_cruze/api_manager/news_model/NewsResponse.dart';

abstract class NewsRepository {
  Future<NewsResponse> getNews(String sourceId);
}
