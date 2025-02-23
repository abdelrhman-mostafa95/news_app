import 'package:flutter/material.dart';
import 'package:news_app_cruze/api_manager/news_model/Articles.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsContent extends StatelessWidget {
  static const String routeName = '/newsDetails';
  Articles? news;

  @override
  Widget build(BuildContext context) {
    news ??= ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(news?.source?.name ?? ''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            if (news?.urlToImage != null)
              Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.network(
                  news!.urlToImage!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            SizedBox(
              height: 12,
            ),
            if (news?.publishedAt != null)
              Text(
                news!.publishedAt!,
                style: TextStyle(color: Colors.white),
              ),
            SizedBox(
              height: 12,
            ),
            Text(news?.description ?? '',
                style: TextStyle(color: Colors.white)),
            SizedBox(
              height: 12,
            ),
            Text(news?.content ?? '', style: TextStyle(color: Colors.white)),
            Spacer(),
            InkWell(
              onTap: () async {
                Uri uri = Uri.parse(news!.url ?? '');
                if (await canLaunchUrl(uri)) launchUrl(uri);
              },
              child: Text(
                'To full Articale',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
