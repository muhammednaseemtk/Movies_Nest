import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/widget/movie_button.dart';
import 'package:movie_nest/widget/movie_header.dart';
import 'package:movie_nest/widget/movie_overview.dart';
import 'package:movie_nest/widget/movie_title.dart';
import 'package:movie_nest/widget/profile_avatar.dart';
import 'package:movie_nest/widget/see_all.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomMovieHeader(
              isFavourite: isFavourite,
              onBack: () {},
              onShare: () {},
              onFavourite: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
            ),
            SizedBox(height: 16),
            CustomMovieTitle(),
            SizedBox(height: 20),
            CustomMovieButtons(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomMovieOverview(
                description:
                    'It: Welcome to Derry is an American supernatural horror television series based on Stephen King 1986 novel It. Serving as a prequel to the films It and It Chapter Two, the series was developed by Andy Muschietti, Barbara Muschietti and Jason Fuchs, all of whom were involved in the It films.',
              ),
            ),
            SizedBox(height: 10,),
            CustomSeeAll(title: 'TOP CAST'),
            SizedBox(height: 15,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomProfileAvatar(imagePath: 'asset/image/pp.jpg', name: 'naseem'),
                  SizedBox(width: 10,),
                  CustomProfileAvatar(imagePath: 'asset/image/pp.jpg', name: 'naseem'),
                   SizedBox(width: 10,),
                  CustomProfileAvatar(imagePath: 'asset/image/pp.jpg', name: 'naseem'),
                   SizedBox(width: 10,),
                  CustomProfileAvatar(imagePath: 'asset/image/pp.jpg', name: 'naseem'),
                   SizedBox(width: 10,),
                  CustomProfileAvatar(imagePath: 'asset/image/pp.jpg', name: 'naseem'),
                   SizedBox(width: 10,),
                  CustomProfileAvatar(imagePath: 'asset/image/pp.jpg', name: 'naseem'),
                   SizedBox(width: 10,),
                  CustomProfileAvatar(imagePath: 'asset/image/pp.jpg', name: 'naseem'),
                   SizedBox(width: 10,),
                  CustomProfileAvatar(imagePath: 'asset/image/pp.jpg', name: 'naseem'),
                   SizedBox(width: 10,),
                  CustomProfileAvatar(imagePath: 'asset/image/pp.jpg', name: 'naseem'),
                   SizedBox(width: 10,),
                  CustomProfileAvatar(imagePath: 'asset/image/pp.jpg', name: 'naseem'),
                ],
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
