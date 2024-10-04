import 'package:flutter/material.dart';
import 'package:news_app_cruze/api_manager/api_manager.dart';
import 'package:news_app_cruze/ui/categories_tab/category_data/category_item.dart';
import 'package:news_app_cruze/ui/categories_tab/categoty_details/source_widegt/source_tab.dart';

class CategoryDetails extends StatelessWidget {
  CategoryItem catItem;

  CategoryDetails({required this.catItem});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(catItem.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return SourceTab(sourceList: sourcesList);
      },
    );
  }
}
