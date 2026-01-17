import 'package:flutter/material.dart';
import 'package:movie_nest/controller/movie_controller.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/view/home/widget/trending_movie_list.dart';
import 'package:provider/provider.dart';

class TrendingMovieScreen extends StatefulWidget {
  const TrendingMovieScreen({super.key});

  @override
  State<TrendingMovieScreen> createState() => _TrendingMovieScreenState();
}

class _TrendingMovieScreenState extends State<TrendingMovieScreen> {
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<MovieController>().fetchTrendingMovies();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text('Trending Movies',style: TextStyle(color: AppColors.txtClr2,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomTrendingMovieList()
        ],
      ),
    );
  }
}