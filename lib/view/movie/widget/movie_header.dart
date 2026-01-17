import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/controller/movie_controller.dart';
import 'package:provider/provider.dart';

class CustomMovieHeader extends StatelessWidget {
  final bool isFavourite;
  final VoidCallback onBack;
  final VoidCallback onShare;
  final VoidCallback onFavourite;
  final String? imagePath;

  const CustomMovieHeader({
    super.key,
    required this.isFavourite,
    required this.onBack,
    required this.onShare,
    required this.onFavourite,
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
              right: 70,
              child: GestureDetector(
                onTap: onShare,
                child: CircleAvatar(
                  backgroundColor: AppColors.black,
                  radius: 20,
                  child: Icon(Icons.share, color: AppColors.txtClr),
                ),
              ),
            ),

            Positioned(
              top: 50,
              right: 16,
              child: GestureDetector(
                onTap: null,
                child: CircleAvatar(
                  backgroundColor: AppColors.black,
                  radius: 20,
                  child: Icon(
                    isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: AppColors.txtClr,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
