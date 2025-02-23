import 'package:hive/hive.dart';
import 'package:news_app_cruze/api_manager/seorces_model/SourcesResponse.dart';

import 'source_data_source.dart';

class SourceLocalDataSourceImpl implements SourceLocalDataSource {
  @override
  Future<SourcesResponse?> getSources(String categoryId) async {
    var box = await Hive.openBox('tabs');
    var data = SourcesResponse.fromJson(box.get('tab'));
    return data;
  }

  @override
  void savedSources(SourcesResponse? sourceResponse) async {
    var box = await Hive.openBox('tabs');
    await box.put('tab', sourceResponse?.toJson());
    await box.close();
  }
}
