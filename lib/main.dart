import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app_cruze/ui/categories_tab/news_tab/news.dart';
import 'package:news_app_cruze/ui/home/home_screen.dart';
import 'package:news_app_cruze/ui/splash_screen/splash_screen.dart';
import 'package:path_provider/path_provider.dart';

import 'ui/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsContent.routeName: (_) => NewsContent()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
