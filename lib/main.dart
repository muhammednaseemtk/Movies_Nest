import 'package:flutter/material.dart';
import 'package:movie_nest/view/home/view/home_screen.dart';
import 'package:movie_nest/view/auth/login/view/login_screen.dart';
import 'package:movie_nest/view/movie/view/movie_screen.dart';
import 'package:movie_nest/view/home/widget/main_page.dart';
import 'package:movie_nest/view/auth/sign/view/signup_screen.dart';
import 'package:movie_nest/view/splash/view/splash_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}