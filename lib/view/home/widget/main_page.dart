import 'package:flutter/material.dart';
import 'package:movie_nest/view/home/controller/main_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:movie_nest/view/home/view/home_screen.dart';
import 'package:movie_nest/view/search/view/search_screen.dart';
import 'package:movie_nest/view/watch list/view/watch_list_screen.dart';

import './bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages =  [
    HomeScreen(),
    SearchScreen(),
    WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainPageController>(
        builder: (context, value, child) =>
            IndexedStack(
              index: value.currentIndex,
              children: pages,
            ),
      ),
      bottomNavigationBar: Consumer<MainPageController>(
        builder: (context, value, child) =>
            BottomNavBar(
              currentIndex: value.currentIndex,
              onTap: value.changeIndex,
            ),
      ),
    );
  }
}
