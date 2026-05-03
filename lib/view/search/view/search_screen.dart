import 'package:flutter/material.dart';
import 'package:movie_nest/controller/trending_movie_controller.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/view/search/widget/recommended_movie.dart';
import 'package:movie_nest/view/search/widget/search_bar.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrendingMovieController>(
      builder: (context, controller, _) {
        if (controller.trendingMovies.isEmpty && !controller.isLoading) {
          Future.microtask(() => controller.fetchTrendingMovies());
        }

        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchBar(),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Recommended For You',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.txtClr,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Expanded(
                    child: controller.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : controller.filteredTrendingMovies.isEmpty
                        ? Center(
                            child: Text(
                              'No movies found',
                              style: TextStyle(color: AppColors.txtClr),
                            ),
                          )
                        : GridView.builder(
                            itemCount: controller.filteredTrendingMovies.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.8,
                                ),
                            itemBuilder: (context, index) {
                              final movie =
                                  controller.filteredTrendingMovies[index];

                              return CustomRecommendedMovie(data: movie);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
