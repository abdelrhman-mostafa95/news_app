import 'package:news_app_cruze/api_manager/seorces_model/SourcesResponse.dart';

abstract class SourceRemoteDataSource {
  Future<SourcesResponse?> getSources(String categoryId);
}

abstract class SourceLocalDataSource {
  Future<SourcesResponse?> getSources(String categoryId);

  void savedSources(SourcesResponse? sourceResponse);
}
