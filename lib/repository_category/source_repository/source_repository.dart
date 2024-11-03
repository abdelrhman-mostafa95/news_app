import 'package:news_app_cruze/api_manager/seorces_model/SourcesResponse.dart';

abstract class SourceRepository {
  Future<SourcesResponse?> getSources(String categoryId);
}
