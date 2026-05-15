import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:movie_nest/core/constants/app_colors.dart';
import 'package:movie_nest/core/constants/url.dart';
import 'package:movie_nest/features/movie/view/movie_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const FeaturedBanner(),
              const SizedBox(height: 24),
              const MovieCarouselSection(),
              const SizedBox(height: 28),
              const TrendingSection(),
              const SizedBox(height: 28),
              const UpcomingSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturedBanner extends StatelessWidget {
  const FeaturedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.45;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          child: SizedBox(
            height: height,
            width: double.infinity,
            child: Image.network(
              'https://image.tmdb.org/t/p/original/9Gtg2DzBhmYDOXGv59h8KfJMRQc.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFF1A0A0A),
                child: const Center(
                  child: Icon(Icons.movie, size: 80, color: AppColors.white24),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.85),
                  AppColors.backgroundColor,
                ],
                stops: const [0.0, 0.4, 0.75, 1.0],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              gradient: RadialGradient(
                center: const Alignment(0, -0.2),
                radius: 0.8,
                colors: [
                  const Color(0xFFE6111B).withOpacity(0.15),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Row(
            children: [
              Expanded(child: _GlassSearchBar()),
              const SizedBox(width: 12),
              const _NotificationButton(),
            ],
          ),
        ),
        Positioned(
          top: height * 0.35,
          left: 0,
          right: 0,
          child: Center(child: _PlayButton()),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.btnClr,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'MARVEL STUDIOS',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Doctor Strange in the\nMultiverse of Madness',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  height: 1.15,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Row(
            children: const [
              _GenreChip(label: 'Drama'),
              SizedBox(width: 8),
              _GenreChip(label: '12+'),
              SizedBox(width: 8),
              _GenreChip(label: 'Action'),
            ],
          ),
        ),
      ],
    );
  }
}

class _GlassSearchBar extends StatelessWidget {
  const _GlassSearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.12), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Row(
            children: [
              const SizedBox(width: 14),
              const Icon(Iconsax.search_normal, color: AppColors.white54, size: 18),
              const SizedBox(width: 10),
              const Text('Search Movie', style: TextStyle(color: AppColors.white54, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.12), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: const Icon(Iconsax.notification, color: AppColors.white, size: 20),
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE6111B).withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: const Icon(Icons.play_arrow_rounded, color: AppColors.white, size: 36),
        ),
      ),
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String label;
  const _GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Text(
            label,
            style: const TextStyle(color: AppColors.white70, fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class MovieCarouselSection extends StatelessWidget {
  const MovieCarouselSection({super.key});

  static const _movies = [
    {
      'title': 'Spider-Man: No Way Home',
      'image': 'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY4GPXv2sNZ1N0Uf.jpg',
      'rating': '8.2',
      'year': '2021',
      'overview':
          'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.',
    },
    {
      'title': 'The Batman',
      'image': 'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg',
      'rating': '7.9',
      'year': '2022',
      'overview':
          'When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city\'s hidden corruption and question his family\'s involvement.',
    },
    {
      'title': 'Doctor Strange 2',
      'image': 'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYDOXGv59h8KfJMRQc.jpg',
      'rating': '7.5',
      'year': '2022',
      'overview':
          'Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to face a mysterious new adversary.',
    },
    {
      'title': 'Thor: Love & Thunder',
      'image': 'https://image.tmdb.org/t/p/w500/pIkRyD1Edkl4tBze6520HOeKTr0.jpg',
      'rating': '7.0',
      'year': '2022',
      'overview':
          'Thor enlists the help of Valkyrie, Korg and ex-girlfriend Jane Foster to fight Gorr the God Butcher, who intends to make the gods extinct.',
    },
    {
      'title': 'Black Panther 2',
      'image': 'https://image.tmdb.org/t/p/w500/sv1xJUazXeYqALzczSZ3O6nkH75.jpg',
      'rating': '7.3',
      'year': '2022',
      'overview':
          'Queen Ramonda, Shuri, M\'Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T\'Challa\'s death.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: _movies.length,
          itemBuilder: (context, index, realIndex) {
            final movie = _movies[index];
            return GestureDetector(
              onTap: () => _navigateToDetail(context, movie),
              child: _CarouselCard(
                imageUrl: movie['image']!,
                title: movie['title']!,
                rating: movie['rating']!,
              ),
            );
          },
          options: CarouselOptions(
            height: 280,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _movies.length,
            (index) => _CarouselDot(isActive: index == 0),
          ),
        ),
      ],
    );
  }

  void _navigateToDetail(BuildContext context, Map<String, String> movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailScreen(
          title: movie['title']!,
          imageUrl: movie['image']!,
          rating: movie['rating']!,
          year: movie['year']!,
          overview: movie['overview']!,
        ),
      ),
    );
  }
}

class _CarouselCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;
  const _CarouselCard({required this.imageUrl, required this.title, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE6111B).withOpacity(0.2),
            blurRadius: 16,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: double.infinity,
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFF1A0A0A),
                  child: const Center(
                    child: Icon(Icons.movie, size: 50, color: AppColors.white24),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.9),
                    ],
                    stops: const [0.0, 0.5, 0.8, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: AppColors.txtClr, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: const TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.btnClr,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      icon: const Icon(Iconsax.ticket, size: 18, color: AppColors.white),
                      label: const Text(
                        'Book Now',
                        style: TextStyle(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CarouselDot extends StatelessWidget {
  final bool isActive;
  const _CarouselDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.btnClr : AppColors.white24,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  static const _movies = [
    {
      'title': 'Avatar 2',
      'image': '${Url.imageBaseUrl}/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
      'rating': '7.6',
      'year': '2022',
      'overview':
          'Jake Sully lives with his newfound family formed on the extrasolar moon Pandora. Once a familiar threat returns to finish what was previously started, Jake must work with Neytiri and the army of the Na\'vi race to protect their home.',
    },
    {
      'title': 'Top Gun: Maverick',
      'image': '${Url.imageBaseUrl}/62HCnUTziyWcpDaBO2i1DGXUQ7s.jpg',
      'rating': '8.3',
      'year': '2022',
      'overview':
          'After more than thirty years of service as one of the Navy\'s top aviators, Pete Mitchell is where he belongs, pushing the envelope as a courageous test pilot and dodging the advancement in rank that would ground him.',
    },
    {
      'title': 'Jurassic World: Dominion',
      'image': '${Url.imageBaseUrl}/kAVR07KewMIqyMtMjU1sG6k8qBu.jpg',
      'rating': '6.8',
      'year': '2022',
      'overview':
          'Four years after the destruction of Isla Nublar, dinosaurs now live and hunt alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators.',
    },
    {
      'title': 'Minions: The Rise of Gru',
      'image': '${Url.imageBaseUrl}/wrCVHdkBlulIaEPlyFbbHKM0kBS.jpg',
      'rating': '7.1',
      'year': '2022',
      'overview':
          'The untold story of one twelve-and-a-half-year-old boy who dreams of becoming the world\'s greatest supervillain.',
    },
    {
      'title': 'Bullet Train',
      'image': '${Url.imageBaseUrl}/j8szO2nPn4K6jv0B5sF4iZq4Z0.jpg',
      'rating': '7.4',
      'year': '2022',
      'overview':
          'Five assassins aboard a fast moving bullet train find out their missions have something in common.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Trending Movie Near You',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _movies.length,
            itemBuilder: (context, index) {
              final movie = _movies[index];
              return Padding(
                padding: const EdgeInsets.only(right: 14),
                child: GestureDetector(
                  onTap: () => _navigateToDetail(context, movie),
                  child: _TrendingCard(
                    imageUrl: movie['image']!,
                    title: movie['title']!,
                    rating: movie['rating']!,
                    year: movie['year']!,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _movies.length,
            (index) => _TrendingDot(isActive: index == 0),
          ),
        ),
      ],
    );
  }

  void _navigateToDetail(BuildContext context, Map<String, String> movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailScreen(
          title: movie['title']!,
          imageUrl: movie['image']!,
          rating: movie['rating']!,
          year: movie['year']!,
          overview: movie['overview']!,
        ),
      ),
    );
  }
}

class _TrendingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;
  final String year;
  const _TrendingCard({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: 140,
              height: 220,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 140,
                height: 220,
                color: const Color(0xFF1A0A0A),
                child: const Center(
                  child: Icon(Icons.movie, size: 40, color: AppColors.white24),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rounded, color: AppColors.txtClr, size: 12),
                    const SizedBox(width: 2),
                    Text(
                      rating,
                      style: const TextStyle(color: AppColors.white, fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(year, style: const TextStyle(color: AppColors.white54, fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrendingDot extends StatelessWidget {
  final bool isActive;
  const _TrendingDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: isActive ? 16 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.btnClr : AppColors.white24,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({super.key});

  static const _movies = [
    {
      'title': 'Guardians of the Galaxy 3',
      'image': '${Url.imageBaseUrl}/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg',
      'rating': '8.0',
      'year': '2023',
      'overview':
          'Still reeling from the loss of Gamora, Peter Quill rallies his team to defend the universe and one of their own - a mission that could mean the end of the Guardians if not successful.',
    },
    {
      'title': 'The Flash',
      'image': '${Url.imageBaseUrl}/7Z0PPNvljYgM0VvPMkMz5vMjPp.jpg',
      'rating': '7.2',
      'year': '2023',
      'overview':
          'Barry Allen uses his super speed to change the past, but his attempt to save his family creates a world without superheroes, forcing him to race for his life.',
    },
    {
      'title': 'Ant-Man and the Wasp: Quantumania',
      'image': '${Url.imageBaseUrl}/qnqGbB22YJ7dSs4o6M7eTpUN9Do.jpg',
      'rating': '6.5',
      'year': '2023',
      'overview':
          'Scott Lang and Hope Van Dyne are dragged into the Quantum Realm, along with Hope\'s parents and Scott\'s daughter Cassie. Together they must find a way to escape.',
    },
    {
      'title': 'John Wick: Chapter 4',
      'image': '${Url.imageBaseUrl}/vZloFAK7NmvMGKE7LsyaPS9Wnk.jpg',
      'rating': '7.8',
      'year': '2023',
      'overview':
          'John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe.',
    },
    {
      'title': 'Fast X',
      'image': '${Url.imageBaseUrl}/fiVW06jE7z9YnCh4TS16Z3f9sF.jpg',
      'rating': '7.1',
      'year': '2023',
      'overview':
          'Dom Toretto and his family are targeted by the vengeful son of drug kingpin Hernan Reyes.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Upcoming',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _movies.length,
            itemBuilder: (context, index) {
              final movie = _movies[index];
              return Padding(
                padding: const EdgeInsets.only(right: 14),
                child: GestureDetector(
                  onTap: () => _navigateToDetail(context, movie),
                  child: _UpcomingCard(
                    imageUrl: movie['image']!,
                    title: movie['title']!,
                    rating: movie['rating']!,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _navigateToDetail(BuildContext context, Map<String, String> movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailScreen(
          title: movie['title']!,
          imageUrl: movie['image']!,
          rating: movie['rating']!,
          year: movie['year']!,
          overview: movie['overview']!,
        ),
      ),
    );
  }
}

class _UpcomingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;
  const _UpcomingCard({required this.imageUrl, required this.title, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: 150,
              height: 260,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 150,
                height: 260,
                color: const Color(0xFF1A0A0A),
                child: const Center(
                  child: Icon(Icons.movie, size: 40, color: AppColors.white24),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.85),
                    ],
                    stops: const [0.0, 0.5, 0.75, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rounded, color: AppColors.txtClr, size: 12),
                    const SizedBox(width: 2),
                    Text(
                      rating,
                      style: const TextStyle(color: AppColors.white, fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 10,
              right: 10,
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.btnClr,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                      ),
                      icon: const Icon(Iconsax.ticket, size: 14, color: AppColors.white),
                      label: const Text(
                        'Book Now',
                        style: TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
