import 'package:flutter/material.dart';
import 'package:movie_nest/view/home_screen.dart';
import 'package:movie_nest/view/login_screen.dart';
import 'package:movie_nest/view/movie_screen.dart';
import 'package:movie_nest/view/main_page.dart';
import 'package:movie_nest/view/signup_screen.dart';
import 'package:movie_nest/view/splash_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}