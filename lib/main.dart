import 'package:flutter/material.dart';
import 'package:movie_nest/features/home/controller/home_controller.dart';
import 'package:movie_nest/features/home/controller/image_controller.dart';
import 'package:movie_nest/features/home/controller/main_page_controller.dart';
import 'package:movie_nest/features/movie/controller/trending_movie_controller.dart';
import 'package:movie_nest/features/movie/controller/tvshow_movie_controller.dart';
import 'package:movie_nest/features/movie/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/features/onboard/controller/onboard_controller.dart';
import 'package:movie_nest/features/splash/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainPageController()),
        ChangeNotifierProvider(create: (_) => UpcomingMovieController()),
        ChangeNotifierProvider(create: (_) => ImageController()),
        ChangeNotifierProvider(create: (_) => TrendingMovieController()),
        ChangeNotifierProvider(create: (_) => TvShowMovieController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => OnboardController()),
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
      home: SplashScreen(),
    );
  }
}
