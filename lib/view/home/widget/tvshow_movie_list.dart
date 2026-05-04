import 'package:flutter/material.dart';
import 'package:movie_nest/view/movie/controller/tvshow_movie_controller.dart';
import 'package:movie_nest/core/constants/url.dart';
import 'package:movie_nest/view/movie/view/tvshow.dart';
import 'package:provider/provider.dart';

class CustomTvShowMovieList extends StatelessWidget {
  const CustomTvShowMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TvShowMovieController>(
      builder: (context, controller, child) {

        if (!controller.isLoading && controller.tvShows.isEmpty) {
          Future.microtask(() => controller.fetchTvShows());
        }

        if (controller.isLoading) {
          return SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (controller.tvShows.isEmpty) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(
                "No TV Shows",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        return SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: controller.tvShows.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final data = controller.tvShows[index];

              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TvShowScreen(data: data),
                    ),
                  );
                },
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${Url.imageBaseUrl}${data.posterPath}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}