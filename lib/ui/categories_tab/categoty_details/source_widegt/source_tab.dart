import 'package:flutter/material.dart';
import 'package:news_app_cruze/api_manager/Sources.dart';
import 'package:news_app_cruze/ui/categories_tab/categoty_details/source_widegt/source_widget.dart';

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
    return DefaultTabController(
        length: widget.sourceList.length,
        child: TabBar(
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          indicatorColor: Colors.transparent,
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
        ));
  }
}
