import 'package:flutter/material.dart';
import 'package:movie_nest/core/constants/app_colors.dart';

class MovieButtons extends StatelessWidget {
  final VoidCallback? onPlayTrailer;
  final VoidCallback? onAddToWatchlist;
  final bool isInWatchlist;

  const MovieButtons({
    super.key,
    this.onPlayTrailer,
    this.onAddToWatchlist,
    this.isInWatchlist = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton.icon(
              onPressed: onPlayTrailer,
              icon: Icon(
                Icons.play_arrow,
                color: AppColors.white,
                size: 28,
              ),
              label: Text(
                "PLAY TRAILER",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.btnClr,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
            ),
          ),
           SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: OutlinedButton.icon(
              onPressed: onAddToWatchlist,
              icon: Icon(
                isInWatchlist
                    ? Icons.bookmark
                    : Icons.bookmark_add,
                color: AppColors.white,
                size: 24,
              ),
              label: Text(
                isInWatchlist
                    ? "ADDED TO WATCHLIST"
                    : "ADD TO WATCHLIST",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.white24,
                side:  BorderSide(color: AppColors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
