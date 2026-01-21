import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/controller/upcoming_movie_controller.dart';
import 'package:provider/provider.dart';

class CustomMovieHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onShare;
  final String? imagePath;

  const CustomMovieHeader({
    super.key,
    required this.onBack,
    required this.onShare,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieImageController>(
      builder: (context, imageProvider, _) {
      
        imageProvider.setImagePath(imagePath);

        return Stack(
          children: [
            SizedBox(
              height: 420,
              width: double.infinity,
              child: Image(
                image: imageProvider.image,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              height: 420,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.black,
                    AppColors.transparent,
                  ],
                ),
              ),
            ),

            Positioned(
              top: 50,
              left: 16,
              child: GestureDetector(
                onTap: onBack,
                child: CircleAvatar(
                  backgroundColor: AppColors.black,
                  radius: 20,
                  child: Icon(Icons.arrow_back, color: AppColors.txtClr),
                ),
              ),
            ),

            Positioned(
              top: 50,
              right: 25,
              child: GestureDetector(
                onTap: onShare,
                child: CircleAvatar(
                  backgroundColor: AppColors.black,
                  radius: 20,
                  child: Icon(Icons.share, color: AppColors.txtClr),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
