import 'package:flutter/material.dart';
import '../models/event.dart';
import '../constants/app_colors.dart';
import 'custom_button.dart';

class FeaturedEventBanner extends StatefulWidget {
  final List<Event> events;
  final VoidCallback? onEventTap;

  const FeaturedEventBanner({
    super.key,
    required this.events,
    this.onEventTap,
  });

  @override
  State<FeaturedEventBanner> createState() => _FeaturedEventBannerState();
}

class _FeaturedEventBannerState extends State<FeaturedEventBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner Carousel
        SizedBox(
          height:
              MediaQuery.of(context).size.height * 0.25, // Responsive height
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.events.length,
            itemBuilder: (context, index) {
              final event = widget.events[index];
              return Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.04),
                  image: DecorationImage(
                    image: AssetImage(event.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),

        // Event Details Below Banner
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.events[_currentPage].title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: MediaQuery.of(context).size.width *
                      0.045, // Responsive font size
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.01),
              Text(
                widget.events[_currentPage].title,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: MediaQuery.of(context).size.width *
                      0.035, // Responsive font size
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        // Page Indicators
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.events.length,
            (index) => Container(
              width: index == _currentPage ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: index == _currentPage
                    ? AppColors.primaryGreen
                    : AppColors.textTertiary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
