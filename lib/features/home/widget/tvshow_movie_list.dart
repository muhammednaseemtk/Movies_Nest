import 'package:flutter/material.dart';
import 'package:movie_nest/features/home/widget/shimmer_skeleton.dart';
import 'package:movie_nest/features/movie/controller/tvshow_movie_controller.dart';
import 'package:movie_nest/core/constants/url.dart';
import 'package:movie_nest/features/movie/view/tvshow_screen.dart';
import 'package:provider/provider.dart';

class TvShowMovieList extends StatelessWidget {
  const TvShowMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TvShowMovieController>(
      builder: (context, controller, _) {
        if (controller.isLoading && controller.tvShows.isEmpty) {
          return const SizedBox(
            height: 200,
            child: HorizontalCardListSkeleton(),
          );
        }

        if (controller.hasError && controller.tvShows.isEmpty) {
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
                    "Failed to load TV shows",
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () => controller.fetchTvShows(),
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

        if (controller.tvShows.isEmpty) {
          return const SizedBox(
            height: 200,
            child: Center(
              child: Text("No TV Shows",
                  style: TextStyle(color: Colors.white54)),
            ),
          );
        }

        return SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: controller.tvShows.length,
            separatorBuilder: (_, context) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final data = controller.tvShows[index];
              final imageUrl = '${Url.imageBaseUrl}${data.posterPath}';

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
          ),
        );
      },
    );
  }
}
