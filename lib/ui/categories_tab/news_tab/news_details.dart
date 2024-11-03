import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cruze/api_manager/api_manager.dart';
import 'package:news_app_cruze/api_manager/news_model/Articles.dart';
import 'package:news_app_cruze/api_manager/seorces_model/Sources.dart';
import 'package:news_app_cruze/ui/categories_tab/news_tab/news.dart';
import 'package:news_app_cruze/ui/categories_tab/news_tab/news_details_viewModel.dart';
import 'package:news_app_cruze/ui/categories_tab/news_tab/news_item_widegt.dart';

class NewsDetails extends StatefulWidget {
  Sources sources;

  NewsDetails({required this.sources});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late NewsDetailsViewmodel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = NewsDetailsViewmodel();
    viewModel.getNews(widget.sources.id ?? '');
  }

  @override
  void didUpdateWidget(covariant NewsDetails oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.getNews(widget.sources.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: ApiManager.getNews(sources.id ?? ''),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     if (snapshot.hasError) {
    //       return Center(
    //         child: Text(snapshot.error.toString()),
    //       );
    //     }
    //     List<Articles> news = snapshot.data?.articles ?? [];
    //     return ListView.builder(
    //       itemBuilder: (context, index) => NewsItemWidegt(news: news[index]),
    //       itemCount: news.length,);
    //   },);
    return BlocBuilder<NewsDetailsViewmodel, NewsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorState():
            {
              return Center(
                child: Text(state.errorMessage),
              );
            }
          case SuccessState():
            {
              List<Articles> news = state.articlesList ?? [];
              return ListView.builder(
                itemBuilder: (context, index) =>
                    NewsItemWidegt(news: news[index]),
                itemCount: news.length,
              );
            }
        }
      },
    );
  }
}
