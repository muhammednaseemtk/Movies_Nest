import 'package:flutter/material.dart';
import 'package:movie_nest/features/movie/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/core/constants/url.dart';
import 'package:movie_nest/features/movie/view/upcoming_screen.dart';
import 'package:provider/provider.dart';

class UpcomingMovieList extends StatelessWidget {
  const UpcomingMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Consumer<UpcomingMovieController>(
        builder: (context, controller, _) {
          if (controller.upcomingMovies.isEmpty && !controller.isLoading) {
            Future.microtask(() => controller.fetchUpcomingMovies());
          }

          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.upcomingMovies.isEmpty) {
            return const Center(
              child: Text(
                "No Upcoming Movies",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: controller.upcomingMovies.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final data = controller.upcomingMovies[index];

              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UpcomingScreen(data: data),
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
          );
        },
      ),
    );
  }
}
