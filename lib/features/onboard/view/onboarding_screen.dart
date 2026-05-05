import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_nest/features/home/widget/main_page.dart';
import 'package:provider/provider.dart';
import 'package:movie_nest/core/constants/app_colors.dart';
import 'package:movie_nest/core/constants/url.dart';
import '../controller/onboard_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnboardController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.movies.isEmpty) {
            return const Center(child: Text("No Movies Found"));
          }

          return Stack(
            children: [
              CarouselSlider.builder(
                itemCount: controller.movies.length,
                itemBuilder: (context, index, realIndex) {
                  final movie = controller.movies[index];

                  return SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.network(
                      Url.imageBaseUrl + movie.posterPath,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                  enlargeCenterPage: false,
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.transparent,
                      AppColors.backgroundColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),

                    Text(
                      "Catch Every\nBlockbuster Without\nthe Queue",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 30),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.overlayWhite),
                          color: AppColors.frostedWhite,
                        ),
                        child: const Center(
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                              color: AppColors.white70,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}