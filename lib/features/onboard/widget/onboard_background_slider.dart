import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:movie_nest/core/constants/app_colors.dart';
import 'package:movie_nest/core/constants/url.dart';
import '../controller/onboard_controller.dart';

class OnboardBackgroundSlider extends StatelessWidget {
  const OnboardBackgroundSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardController>(
      builder: (context, controller, child) {
        if (controller.movies.isNotEmpty) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            precacheImage(
              NetworkImage(
                Url.imageBaseUrl + controller.movies.first.posterPath,
              ),
              context,
            );
          });
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            CarouselSlider.builder(
              itemCount: controller.movies.length,

              itemBuilder: (context, index, realIndex) {
                final movie = controller.movies[index];

                final imageUrl = Url.imageBaseUrl + movie.posterPath;

                if (index + 1 < controller.movies.length) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    precacheImage(
                      NetworkImage(
                        Url.imageBaseUrl +
                            controller.movies[index + 1].posterPath,
                      ),
                      context,
                    );
                  });
                }

                final movieColor = controller.getMovieColor(imageUrl);

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'asset/image/one piece.jpg',

                      image: imageUrl,

                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,

                      fadeInDuration: const Duration(milliseconds: 300),

                      imageErrorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.backgroundColor,

                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: AppColors.txtClr2,
                            ),
                          ),
                        );
                      },
                    ),

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),

                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,

                            movieColor.withValues(alpha: 0.95),
                          ],

                          begin: Alignment.topCenter,

                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                );
              },

              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1,
                autoPlay: true,

                autoPlayInterval: const Duration(seconds: 2),

                autoPlayAnimationDuration: const Duration(milliseconds: 800),

                enlargeCenterPage: false,
                enableInfiniteScroll: true,

                scrollPhysics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        );
      },
    );
  }
}
