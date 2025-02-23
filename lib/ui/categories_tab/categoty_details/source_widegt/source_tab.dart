import 'package:flutter/material.dart';
import 'package:news_app_cruze/api_manager/seorces_model/Sources.dart';
import 'package:news_app_cruze/ui/categories_tab/categoty_details/source_widegt/source_widget.dart';
import 'package:news_app_cruze/ui/categories_tab/news_tab/news_details.dart';
import 'package:news_app_cruze/ui/categories_tab/news_tab/news_item_widegt.dart';

class SourceTab extends StatefulWidget {
  List<Sources> sourceList;

  SourceTab({required this.sourceList});

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourceList.length,
            child: TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              indicatorColor: Color(0xFF5cb6bd),
              dividerColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sourceList
                  .map(
                    (source) => SourceWidget(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source),
                    ),
                  )
                  .toList(),
            )),
        Expanded(child: NewsDetails(sources: widget.sourceList[selectedIndex]))
      ],
    );
  }
}
