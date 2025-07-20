import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'dart:async'; // Added for Timer

class TrendingSection extends StatefulWidget {
  final List<String> images;
  final VoidCallback? onImageTap;

  const TrendingSection({
    super.key,
    required this.images,
    this.onImageTap,
  });

  @override
  State<TrendingSection> createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<TrendingSection>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;
  late Timer _autoScrollTimer;
  late AnimationController _bounceController;
  late AnimationController _rotateController;
  late Animation<double> _bounceAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _rotateController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _bounceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.elasticOut,
    ));

    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 0.1,
    ).animate(CurvedAnimation(
      parent: _rotateController,
      curve: Curves.easeInOut,
    ));

    // Start auto-scroll timer
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _bounceController.dispose();
    _rotateController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        final nextPage = (_currentPage + 1) % widget.images.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });

    // Trigger bounce and rotate animations
    _bounceController.reset();
    _bounceController.forward();
    _rotateController.reset();
    _rotateController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Trending Images Carousel with Creative 3D Effect
        SizedBox(
          height: 180, // Reduced height
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              // Calculate scale and opacity based on position
              double scale = 1.0;
              double opacity = 1.0;
              double offset = 0.0;
              double rotation = 0.0;

              // Get the current page position relative to the viewport
              double pagePosition = (index - _currentPage).toDouble();

              if (pagePosition == 0) {
                // Current page - full size and opacity with bounce effect
                scale = 1.0 + (_bounceAnimation.value * 0.05);
                opacity = 1.0;
                offset = 0.0;
                rotation = _rotateAnimation.value;
              } else if (pagePosition == -1 || pagePosition == 1) {
                // Adjacent pages - smaller and behind with subtle rotation
                scale = 0.85;
                opacity = 0.7;
                offset = pagePosition * 25;
                rotation = pagePosition * 0.05;
              } else {
                // Far pages - even smaller and more transparent
                scale = 0.7;
                opacity = 0.4;
                offset = pagePosition * 40;
                rotation = pagePosition * 0.1;
              }

              return AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                transform: Matrix4.identity()
                  ..scale(scale)
                  ..translate(offset, 0.0)
                  ..rotateY(rotation),
                child: GestureDetector(
                  onTap: widget.onImageTap,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.primaryGreen,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: AppColors.primaryGreen.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 0),
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Opacity(
                        opacity: opacity,
                        child: Image.asset(
                          widget.images[index],
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Page Indicators (same as featured events)
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: index == _currentPage ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: index == _currentPage
                    ? AppColors.primaryGreen
                    : AppColors.textTertiary,
                boxShadow: index == _currentPage
                    ? [
                        BoxShadow(
                          color: AppColors.primaryGreen.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
