import 'package:news_app_cruze/api_manager/news_model/NewsResponse.dart';
import 'package:news_app_cruze/repository_news/news_data_source/news_data_source.dart';
import 'package:news_app_cruze/repository_news/news_repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse> getNews(String sourceId) {
    return remoteDataSource.getNews(sourceId);
  }
}
