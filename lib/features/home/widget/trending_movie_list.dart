import 'package:flutter/material.dart';
import 'package:movie_nest/features/movie/controller/trending_movie_controller.dart';
import 'package:movie_nest/core/constants/url.dart';
import 'package:movie_nest/features/movie/view/trending_screen.dart';
import 'package:provider/provider.dart';

class TrendingMovieList extends StatelessWidget {

  const TrendingMovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Consumer<TrendingMovieController>(
        builder: (context, value, child) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: value.trendingMovies.length,
          separatorBuilder: (_, context) =>  SizedBox(width: 14),
          itemBuilder: (context, index) {
           final data = value.trendingMovies[index];
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TrendingScreen(data: data)),
                );
              },
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage('${Url.imageBaseUrl}${data.posterPath}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
        }
      ),
    );
  }
}
