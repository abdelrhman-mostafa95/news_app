import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app_cruze/api_manager/seorces_model/SourcesResponse.dart';
import '../data_Source/source_data_source.dart';
import 'source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource sourceRemoteDataSource;

  SourceRepositoryImpl({required this.sourceRemoteDataSource});

  @override
  Future<SourcesResponse?> getSources(String categoryId) async {
    return sourceRemoteDataSource.getSources(categoryId);
  }
}
