import 'package:flutter/material.dart';
import 'package:movie_nest/features/home/widget/shimmer_skeleton.dart';
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
          if (controller.isLoading && controller.upcomingMovies.isEmpty) {
            return const HorizontalCardListSkeleton();
          }

          if (controller.hasError && controller.upcomingMovies.isEmpty) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_off_rounded,
                        color: Colors.white24, size: 32),
                    const SizedBox(height: 8),
                    const Text(
                      "Failed to load upcoming movies",
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      onPressed: () => controller.fetchUpcomingMovies(),
                      icon: const Icon(Icons.refresh,
                          color: Colors.white54, size: 18),
                      label: const Text("Retry",
                          style: TextStyle(color: Colors.white54)),
                    ),
                  ],
                ),
              ),
            );
          }

          if (controller.upcomingMovies.isEmpty) {
            return const SizedBox(
              height: 200,
              child: Center(
                child: Text("No Upcoming Movies",
                    style: TextStyle(color: Colors.white54)),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: controller.upcomingMovies.length,
            separatorBuilder: (_, context) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final data = controller.upcomingMovies[index];
              final imageUrl = '${Url.imageBaseUrl}${data.posterPath}';

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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl,
                    width: 130,
                    height: 200,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 130,
                        height: 200,
                        color: const Color(0xFF1A1A2E),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white24,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 130,
                        height: 200,
                        color: const Color(0xFF1A1A2E),
                        child: const Icon(Icons.movie_creation_outlined,
                            color: Colors.white24, size: 40),
                      );
                    },
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
