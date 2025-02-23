import 'package:flutter/material.dart';
import 'package:news_app_cruze/ui/categories_tab/category_data/category_item.dart';
import 'package:news_app_cruze/ui/categories_tab/category_widegts/category_widget.dart';

typedef ClickedCategory = void Function(CategoryItem allCategories);

class CategoryTabWidget extends StatelessWidget {
  List<CategoryItem> allCategories = CategoryItem.getCategoryList();
  ClickedCategory clickedCategory;

  CategoryTabWidget({required this.clickedCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category \nof interest',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white60),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    clickedCategory(allCategories[index]);
                  },
                  child: CategoryWidget(
                      catItem: allCategories[index], index: index)),
              itemCount: allCategories.length,
            ),
          ),
        ],
      ),
    );
  }
}
