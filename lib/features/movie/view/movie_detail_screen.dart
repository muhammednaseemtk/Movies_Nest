import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:movie_nest/core/constants/app_colors.dart';

class MovieDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String rating;
  final String year;
  final String overview;

  const MovieDetailScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.year,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DetailHeader(
              imageUrl: imageUrl,
              onBack: () => Navigator.pop(context),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DetailTitle(
                    title: title,
                    rating: rating,
                    year: year,
                  ),
                  const SizedBox(height: 20),
                  _DetailButtons(),
                  const SizedBox(height: 20),
                  _DetailOverview(description: overview),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onBack;
  const _DetailHeader({required this.imageUrl, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 420,
          width: double.infinity,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: const Color(0xFF1A0A0A),
              child: const Center(
                child: Icon(Icons.movie, size: 80, color: AppColors.white24),
              ),
            ),
          ),
        ),
        Container(
          height: 420,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColors.backgroundColor,
                AppColors.black.withOpacity(0.6),
                AppColors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: GestureDetector(
            onTap: onBack,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.15),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.15),
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Iconsax.send_1,
                  color: AppColors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailTitle extends StatelessWidget {
  final String title;
  final String rating;
  final String year;
  const _DetailTitle({
    required this.title,
    required this.rating,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.star_rounded, color: AppColors.txtClr, size: 18),
            const SizedBox(width: 4),
            Text(
              rating,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              year,
              style: const TextStyle(color: AppColors.white70, fontSize: 14),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.white24,
              ),
              child: const Text(
                '4K HDR',
                style: TextStyle(color: AppColors.white70, fontSize: 11),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DetailButtons extends StatelessWidget {
  const _DetailButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow_rounded, color: AppColors.white, size: 28),
            label: const Text(
              'PLAY TRAILER',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 0.5,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.btnClr,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_add_outlined, color: AppColors.white, size: 22),
            label: const Text(
              'ADD TO WATCHLIST',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 0.5,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.white24,
              side: const BorderSide(color: AppColors.white, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailOverview extends StatelessWidget {
  final String description;
  const _DetailOverview({required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'OVERVIEW',
          style: TextStyle(
            color: AppColors.white54,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description.isNotEmpty ? description : 'No overview available.',
          style: const TextStyle(
            color: AppColors.white70,
            fontSize: 14,
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
