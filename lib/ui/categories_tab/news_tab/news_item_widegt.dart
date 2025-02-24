import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_cruze/api_manager/news_model/Articles.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'news.dart';

class NewsItemWidegt extends StatelessWidget {
  Articles news;

  NewsItemWidegt({required this.news});

  @override
  Widget build(BuildContext context) {
    DateTime? newsDate = DateTime.tryParse(news.publishedAt ?? "");
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
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            image: DecorationImage(
                                image: NetworkImage(news.urlToImage ?? ''),
                                fit: BoxFit.fill)),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Text(
                            news.title ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
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
                  Text(
                      timeago.format(newsDate!),
                      style: TextStyle(
                          color: Color(0xFF5cb6bd),
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
