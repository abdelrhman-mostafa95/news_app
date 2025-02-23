import 'package:flutter/material.dart';

typedef OnMenuClickedTab = void Function(MenuItem item);

class HomeDrawer extends StatelessWidget {
  OnMenuClickedTab onMenuClickedTab;

  HomeDrawer({required this.onMenuClickedTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF5cb6bd),
      child: Column(
        children: [
          Container(
            color: Color(0xFF5cb6bd),
            width: double.infinity,
            height: 110,
            alignment: Alignment.center,
            child: Text(
              'News App',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              onMenuClickedTab(MenuItem.category);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.white,
                  size: 35,
                ),
                SizedBox(
                  width: 4,
                ),
                Text('Categories',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white))
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          // InkWell(
          //   onTap: () {
          //     onMenuClickedTab(MenuItem.settings);
          //   },
          //   child: Row(
          //     children: [
          //       Icon(Icons.search_off, color: Colors.white,size: 35),
          //       SizedBox(
          //         width: 4,
          //       ),
          //       Text(
          //         'Search',
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white, ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

enum MenuItem { category }
