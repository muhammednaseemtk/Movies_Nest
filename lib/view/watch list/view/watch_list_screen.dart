import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/view/watch%20list/widget/watch_card.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'WATCH LIST',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.btnClr,
                        fontSize: 25,
                      ),
                    ),
                    Icon(EneftyIcons.play_cricle_bold,color: AppColors.txtClr,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              CustomWatchCard(image: 'asset/image/pp.jpg', title: 'itachi', rating: '8.9', year: '2001', genre: 'Anime', duration: '21m'),
              CustomWatchCard(image: 'asset/image/pp.jpg', title: 'itachi', rating: '8.9', year: '2001', genre: 'Anime', duration: '21m'),
              CustomWatchCard(image: 'asset/image/pp.jpg', title: 'itachi', rating: '8.9', year: '2001', genre: 'Anime', duration: '21m'),
              CustomWatchCard(image: 'asset/image/pp.jpg', title: 'itachi', rating: '8.9', year: '2001', genre: 'Anime', duration: '21m'),
              CustomWatchCard(image: 'asset/image/pp.jpg', title: 'itachi', rating: '8.9', year: '2001', genre: 'Anime', duration: '21m'),
              CustomWatchCard(image: 'asset/image/pp.jpg', title: 'itachi', rating: '8.9', year: '2001', genre: 'Anime', duration: '21m'),
              CustomWatchCard(image: 'asset/image/pp.jpg', title: 'itachi', rating: '8.9', year: '2001', genre: 'Anime', duration: '21m'),
              CustomWatchCard(image: 'asset/image/pp.jpg', title: 'itachi', rating: '8.9', year: '2001', genre: 'Anime', duration: '21m'),
              CustomWatchCard(image: 'asset/image/pp.jpg', title: 'itachi', rating: '8.9', year: '2001', genre: 'Anime', duration: '21m'),
            ],
          ),
        ),
      ),
    );
  }
}
