import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomMovieList extends StatelessWidget {
  final int itemCount;
  final String imagePath;
  final String rating;

  const CustomMovieList({
    super.key,
    this.itemCount = 5,
    required this.imagePath,
    this.rating = '8.9',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (_, __) =>  SizedBox(width: 14),
        itemBuilder: (context, index) {
          return Container(
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                     Icon(Icons.star,
                        color: AppColors.txtClr5, size: 16),
                     SizedBox(width: 4),
                    Text(
                      rating,
                      style:  TextStyle(color: AppColors.txtClr),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
