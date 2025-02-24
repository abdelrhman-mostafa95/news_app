import 'package:flutter/material.dart';

import '../../api_manager/api_manager.dart';
import '../../api_manager/news_model/Articles.dart';
import '../categories_tab/news_tab/news_item_widegt.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.search(query),
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
        List<Articles> news = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) => NewsItemWidegt(news: news[index]),
          itemCount: news.length,
        );
      },
    );
    ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: Colors.black,
        focusColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          focusColor: Colors.white,
        ),
    textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.white,
    )
    );
  }
}
