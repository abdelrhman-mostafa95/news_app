import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_cruze/api_manager/news_model/Articles.dart';

import 'news.dart';

class NewsItemWidegt extends StatelessWidget {
  Articles news;

  NewsItemWidegt({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(NewsContent.routeName, arguments: news),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(news.urlToImage ?? '')),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(news.author ?? '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                  Text(news.publishedAt ?? '',
                      style: TextStyle(
                          color: Color(0xFF480903),
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                  Text(
                    news.title ?? '',
                    style: TextStyle(
                        color: Color(0xFF79828B),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
