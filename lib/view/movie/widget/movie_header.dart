import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomMovieHeader extends StatelessWidget {
  final bool isFavourite;
  final VoidCallback onBack;
  final VoidCallback onShare;
  final VoidCallback onFavourite;

  const CustomMovieHeader({
    super.key,
    required this.isFavourite,
    required this.onBack,
    required this.onShare,
    required this.onFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'asset/image/it1.jpg',
          height: 420,
          width: double.infinity,
          fit: BoxFit.cover,
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
          child: _icon(Icons.arrow_back, onBack),
        ),
        Positioned(
          top: 50,
          right: 70,
          child: _icon(Icons.share, onShare),
        ),
        Positioned(
          top: 50,
          right: 16,
          child: _icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
            onFavourite,
          ),
        ),
      ],
    );
  }
  Widget _icon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.black,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.txtClr),
      ),
    );
  }
}
