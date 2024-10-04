import 'package:flutter/animation.dart';
import 'package:news_app_cruze/utils/image_path.dart';

class CategoryItem {
  String imagePath;
  Color background;
  String categoryId;
  String title;

  CategoryItem(
      {required this.categoryId,
      required this.imagePath,
      required this.title,
      required this.background});

  static List<CategoryItem> getCategoryList() {
    return [
      CategoryItem(
          categoryId: 'sports',
          imagePath: ImagePath.GetImagePath('ball.png'),
          title: 'Sports',
          background: Color(0xFFC91C22)),
      CategoryItem(
          categoryId: 'general',
          imagePath: ImagePath.GetImagePath('Politics.png'),
          title: 'General',
          background: Color(0xFF003E90)),
      CategoryItem(
          categoryId: 'health',
          imagePath: ImagePath.GetImagePath('health.png'),
          title: 'health',
          background: Color(0xFFED1E79)),
      CategoryItem(
          categoryId: 'business',
          imagePath: ImagePath.GetImagePath('bussines.png'),
          title: 'Business',
          background: Color(0xFFCF7E48)),
      CategoryItem(
          categoryId: 'entertainment',
          imagePath: ImagePath.GetImagePath('environment.png'),
          title: 'entertainment',
          background: Color(0xFF4882CF)),
      CategoryItem(
          categoryId: 'science',
          imagePath: ImagePath.GetImagePath('science.png'),
          title: 'Science',
          background: Color(0xFFF2D352)),
    ];
  }
}
