import 'package:flutter/material.dart';
import 'package:movie_nest/controller/main_page_provider.dart';
import 'package:movie_nest/view/home/widget/main_page.dart';
import 'package:movie_nest/controller/movie_controller.dart';
import 'package:movie_nest/view/movie/view/upcoming.dart';
import 'package:movie_nest/view/trending/view/trending_movie_screen.dart';
import 'package:provider/provider.dart';
import 'package:movie_nest/view/splash/view/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainPageController()),
        ChangeNotifierProvider(create: (_) => MovieController()),
        ChangeNotifierProvider(create: (_) => MovieImageController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
