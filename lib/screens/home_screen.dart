import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/event.dart';
import '../models/category.dart';
import '../models/artist.dart';
import '../utils/mock_data.dart';
import '../widgets/featured_event_banner.dart';
import '../widgets/event_card.dart';
import '../widgets/category_card.dart';
import '../widgets/artist_card.dart';
import '../widgets/trending_section.dart';
import '../widgets/section_header.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../widgets/upcoming_events_section.dart';
import '../widgets/upcoming_event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  int _currentNavIndex = 0;
  final List<Event> _upcomingEvents = MockData.getUpcomingEvents();
  final List<Event> _popularEvents = MockData.getPopularEvents();
  final List<Event> _events = MockData.getUpcomingEvents();

  void _toggleFavorite(int eventIndex, List<Event> events) {
    setState(() {
      events[eventIndex] = events[eventIndex].copyWith(
        isFavorite: !events[eventIndex].isFavorite,
      );
    });
  }

  void _onCategoryTap(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  void _onEventTap() {
    // Handle event tap
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Event details coming soon!'),
        backgroundColor: AppColors.primaryGreen,
      ),
    );
  }

  void _onBookNow() {
    // Handle book now tap
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Booking feature coming soon!'),
        backgroundColor: AppColors.primaryGreen,
      ),
    );
  }

  void _onNavTap(int index) {
    setState(() {
      _currentNavIndex = index;
    });
    // Handle navigation tap silently
  }

  String _getNavTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Tickets';
      case 2:
        return 'Events';
      case 3:
        return 'Favorites';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // App Bar with Location and Search
                SliverAppBar(
                  floating: true,
                  backgroundColor: AppColors.background,
                  elevation: 0,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20), // Space above location
                      // Location
                      GestureDetector(
                        onTap: () {
                          // Handle location tap
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Location picker coming soon!'),
                              backgroundColor: AppColors.primaryGreen,
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.textPrimary,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Mayur Vihar',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.textPrimary,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Lucknow, India',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                // Search Bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.textTertiary.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search for events',
                          hintStyle: const TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColors.textSecondary,
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Featured Events Section
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SectionHeader(title: 'Featured Events'),
                      FeaturedEventBanner(
                        events: MockData.getFeaturedEvents(),
                        onEventTap: _onEventTap,
                      ),
                    ],
                  ),
                ),

                // Featured Category Section
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SectionHeader(title: 'Featured Category'),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: MockData.getCategories().length,
                          itemBuilder: (context, index) {
                            final category = MockData.getCategories()[index];
                            return CategoryCard(
                              category: category,
                              isSelected: index == _selectedCategoryIndex,
                              onTap: () => _onCategoryTap(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Upcoming Events Section
                SliverToBoxAdapter(
                  child: UpcomingEventsSection(
                    onEventTap: _onEventTap,
                    onBookNow: _onBookNow,
                    onSeeAll: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('All upcoming events coming soon!'),
                          backgroundColor: AppColors.primaryGreen,
                        ),
                      );
                    },
                  ),
                ),

                // Artists on Tixoo Section
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SectionHeader(title: 'Artists on Tixoo'),
                      Container(
                        height: 110,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: MockData.getArtists().length,
                          itemBuilder: (context, index) {
                            final artist = MockData.getArtists()[index];
                            return ArtistCard(
                              artist: artist,
                              onTap: _onEventTap,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      // All Artists Button
                      Center(
                        child: CustomButton(
                          text: 'All Artists',
                          onPressed: () {},
                          isPrimary: false,
                          height: 40,
                          width: 120,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),

                // Trending Section
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SectionHeader(title: 'Trending'),
                      TrendingSection(
                        images: MockData.getTrendingImages(),
                        onImageTap: _onEventTap,
                      ),
                    ],
                  ),
                ),

                // Popular Events Section
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SectionHeader(title: 'Popular Events'),
                      // Events List
                      // Events Carousel
                      SizedBox(
                        height: 320,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _events.length,
                          itemBuilder: (context, index) {
                            final event = _events[index];
                            return UpcomingEventCard(
                              event: event,
                              onTap: _onEventTap,
                              onFavoriteToggle: () =>
                                  _toggleFavorite(index, _events),
                              onBookNow: _onBookNow,
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // See All Button
                      Center(
                        child: CustomButton(
                          text: 'See all',
                          onPressed: () {},
                          isPrimary: false,
                          height: 32,
                          width: 100,
                        ),
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),

                // Add bottom padding for floating navigation
                SliverToBoxAdapter(
                  child: const SizedBox(height: 120),
                ),
              ],
            ),
            // Bottom Navigation Bar
            CustomBottomNavigation(
              currentIndex: _currentNavIndex,
              onTap: _onNavTap,
            ),
          ],
        ),
      ),
    );
  }
}
