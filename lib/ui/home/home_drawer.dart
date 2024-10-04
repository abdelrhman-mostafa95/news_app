import 'package:flutter/material.dart';

typedef OnMenuClickedTab = void Function(MenuItem item);

class HomeDrawer extends StatelessWidget {
  OnMenuClickedTab onMenuClickedTab;

  HomeDrawer({required this.onMenuClickedTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.green,
            width: double.infinity,
            height: 110,
            alignment: Alignment.center,
            child: Text(
              'News App',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          InkWell(
            onTap: () {
              onMenuClickedTab(MenuItem.category);
            },
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(
                  width: 4,
                ),
                Text('Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
          ),
          InkWell(
            onTap: () {
              onMenuClickedTab(MenuItem.settings);
            },
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum MenuItem { category, settings }
