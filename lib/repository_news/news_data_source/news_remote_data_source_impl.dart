import 'package:news_app_cruze/api_manager/api_manager.dart';
import 'package:news_app_cruze/api_manager/news_model/NewsResponse.dart';
import 'package:news_app_cruze/repository_news/news_data_source/news_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse> getNews(String sourceId) async {
    var response = await apiManager.getNews(sourceId);
    return response;
  }
}
