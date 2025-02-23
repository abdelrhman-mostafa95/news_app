import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cruze/api_manager/api_manager.dart';
import 'package:news_app_cruze/api_manager/news_model/Articles.dart';
import 'package:news_app_cruze/api_manager/seorces_model/Sources.dart';
import 'package:news_app_cruze/repository_news/news_data_source/news_data_source.dart';
import 'package:news_app_cruze/repository_news/news_data_source/news_remote_data_source_impl.dart';
import 'package:news_app_cruze/repository_news/news_repository/news_repository.dart';
import 'package:news_app_cruze/repository_news/news_repository/news_repository_impl.dart';

class NewsDetailsViewmodel extends Cubit<NewsState> {
  late NewsRepository newsRepository;
  late NewsRemoteDataSource remoteDataSource;
  late ApiManager apiManager;

  NewsDetailsViewmodel() : super(LoadingState(message: 'Loading...')) {
    apiManager = ApiManager();
    remoteDataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
    newsRepository = NewsRepositoryImpl(remoteDataSource: remoteDataSource);
  }

  getNews(String sourceId) async {
    var response = await newsRepository.getNews(sourceId);
    try {
      if (response.status == 'error') {
        emit(ErrorState(errorMessage: response.message ?? ''));
      } else {
        emit(SuccessState(articlesList: response.articles ?? []));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class NewsState {}

class LoadingState extends NewsState {
  String message;

  LoadingState({required this.message});
}

class ErrorState extends NewsState {
  String errorMessage;

  ErrorState({required this.errorMessage});
}

class SuccessState extends NewsState {
  List<Articles> articlesList;

  SuccessState({required this.articlesList});
}
