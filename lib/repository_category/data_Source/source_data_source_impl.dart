import 'package:news_app_cruze/api_manager/api_manager.dart';
import 'package:news_app_cruze/api_manager/seorces_model/SourcesResponse.dart';

import 'source_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourcesResponse?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}
