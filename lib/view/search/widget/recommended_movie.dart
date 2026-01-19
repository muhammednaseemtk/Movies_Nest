import 'package:flutter/material.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/trending_movie.dart';
import 'package:movie_nest/view/movie/view/trending.dart';

class CustomRecommendedMovie extends StatelessWidget {
  final TrendingMovie data;

  const CustomRecommendedMovie({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrendingScreen(data: data),
          ),
        );
      },
      child: SizedBox(
        width: 150,
        height: 150,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
              image: NetworkImage(
                '${Url.imageBaseUrl}${data.posterPath}',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
