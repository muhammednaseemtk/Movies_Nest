import 'package:flutter/material.dart';
import 'package:movie_nest/controller/movie_controller.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/view/search/widget/recommended_movie.dart';
import 'package:movie_nest/view/search/widget/search_bar.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      context.read<MovieController>().fetchTrendingMovies();
      _loaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Recommended For You',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.txtClr,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Consumer<MovieController>(
                  builder: (context, controller, _) {
                    final movies = controller.filteredTrendingMovies;

                    if (movies.isEmpty) {
                      return Center(
                        child: Text(
                          'No movies found',
                          style: TextStyle(color: AppColors.txtClr),
                        ),
                      );
                    }

                    return GridView.builder(
                      itemCount: movies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final movie = movies[index];

                        return CustomRecommendedMovie(data: movie);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
