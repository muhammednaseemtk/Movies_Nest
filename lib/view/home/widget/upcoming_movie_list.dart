import 'package:flutter/material.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/view/movie/view/upcoming.dart';
import 'package:provider/provider.dart';

class CustomUpcomingMovieList extends StatelessWidget {

  const CustomUpcomingMovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Consumer<MovieController>(
        builder: (context, value, child) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: value.upcomingMovies.length,
          separatorBuilder: (_, __) =>  SizedBox(width: 14),
          itemBuilder: (context, index) {
           final data = value.upcomingMovies[index];
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UpcomingScreen(data: data,)),
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
