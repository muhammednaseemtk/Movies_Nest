import 'package:flutter/material.dart';
import 'package:movie_nest/core/constants/app_colors.dart';

class Shimmer extends StatefulWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  const Shimmer({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFF2A1A1A),
    this.highlightColor = const Color(0xFF3D2626),
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: [
                (_controller.value - 0.3).clamp(0.0, 1.0),
                _controller.value.clamp(0.0, 1.0),
                (_controller.value + 0.3).clamp(0.0, 1.0),
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class SkeletonBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? color;

  const SkeletonBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class BannerSkeleton extends StatelessWidget {
  const BannerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        height: 230,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SkeletonBox(width: 60, height: 18, borderRadius: 6),
              const SizedBox(height: 8),
              SkeletonBox(width: 80, height: 12, borderRadius: 4),
              const SizedBox(height: 8),
              SkeletonBox(width: 160, height: 22, borderRadius: 6),
              const SizedBox(height: 14),
              Row(
                children: [
                  SkeletonBox(width: 90, height: 36, borderRadius: 12),
                  const SizedBox(width: 10),
                  SkeletonBox(width: 24, height: 24, borderRadius: 6),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeaderSkeleton extends StatelessWidget {
  const SectionHeaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SkeletonBox(width: 140, height: 18, borderRadius: 6),
            SkeletonBox(width: 55, height: 14, borderRadius: 4),
          ],
        ),
      ),
    );
  }
}

class HorizontalCardListSkeleton extends StatelessWidget {
  final double cardWidth;
  final double cardHeight;
  final int itemCount;

  const HorizontalCardListSkeleton({
    super.key,
    this.cardWidth = 130,
    this.cardHeight = 200,
    this.itemCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: Shimmer(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          separatorBuilder: (_, context) => const SizedBox(width: 14),
          itemBuilder: (context, index) {
            return SkeletonBox(
              width: cardWidth,
              height: cardHeight,
              borderRadius: 16,
            );
          },
        ),
      ),
    );
  }
}

class HomeScreenSkeleton extends StatelessWidget {
  const HomeScreenSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Shimmer(
                child: SkeletonBox(width: 28, height: 28, borderRadius: 6),
              ),
              const SizedBox(width: 6),
              Shimmer(
                child: SkeletonBox(width: 110, height: 18, borderRadius: 6),
              ),
            ],
          ),
        ),

        const BannerSkeleton(),
        const SizedBox(height: 25),

        const SectionHeaderSkeleton(),
        const SizedBox(height: 10),
        const HorizontalCardListSkeleton(),

        const SizedBox(height: 20),

        const SectionHeaderSkeleton(),
        const SizedBox(height: 10),
        const HorizontalCardListSkeleton(),

        const SizedBox(height: 20),

        const SectionHeaderSkeleton(),
        const SizedBox(height: 10),
        const HorizontalCardListSkeleton(),

        const SizedBox(height: 20),
      ],
    );
  }
}
