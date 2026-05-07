import 'package:flutter/material.dart';
import 'package:movie_nest/core/constants/app_colors.dart';
import 'package:movie_nest/features/home/widget/main_page.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
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
                  builder: (context) =>
                      MainPage(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.overlayWhite,
                ),
                color:
                    AppColors.frostedWhite,
              ),
              child: const Center(
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    color:
                        AppColors.white70,
                    fontWeight:
                        FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}