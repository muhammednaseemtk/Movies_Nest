import 'package:flutter/material.dart';
import 'package:movie_nest/core/constants/app_colors.dart';
import 'package:provider/provider.dart';
import '../controller/onboard_controller.dart';
import '../widget/onboard_background_slider.dart';
import '../widget/onboard_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Consumer<OnboardController>(
        builder: (context, controller, child) {
          if (controller.isLoading || controller.movies.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.txtClr2),
            );
          }

          return const Stack(
            fit: StackFit.expand,
            children: [OnboardBackgroundSlider(), OnboardContent()],
          );
        },
      ),
    );
  }
}
