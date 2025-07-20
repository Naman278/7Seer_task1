import 'dart:io';

import 'package:flutter/material.dart';
import '../models/event.dart';
import '../constants/app_colors.dart';
import 'upcoming_event_card.dart';
import 'custom_button.dart';
import 'section_header.dart';
import '../utils/mock_data.dart';

class UpcomingEventsSection extends StatefulWidget {
  final VoidCallback? onEventTap;
  final VoidCallback? onBookNow;
  final VoidCallback? onSeeAll;

  const UpcomingEventsSection({
    super.key,
    this.onEventTap,
    this.onBookNow,
    this.onSeeAll,
  });

  @override
  State<UpcomingEventsSection> createState() => _UpcomingEventsSectionState();
}

class _UpcomingEventsSectionState extends State<UpcomingEventsSection> {
  String _selectedFilter = 'All';
  List<Event> _upcomingEvents = [];

  final List<String> _filterOptions = [
    'All',
    'Music',
    'Sports',
    'Comedy',
    'Theatre'
  ];

  @override
  void initState() {
    super.initState();
    _upcomingEvents = MockData.getUpcomingEvents();
  }

  void _toggleFavorite(int eventIndex) {
    setState(() {
      _upcomingEvents[eventIndex] = _upcomingEvents[eventIndex].copyWith(
        isFavorite: !_upcomingEvents[eventIndex].isFavorite,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header with centered title and gradient lines
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              // Title with decorative lines
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            AppColors.textTertiary,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Upcoming Events',
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.textTertiary,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Apply Filters Button below the title
              const SizedBox(height: 16),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.textTertiary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Apply Filters',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.textSecondary,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Events List
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _upcomingEvents.length,
            itemBuilder: (context, index) {
              final event = _upcomingEvents[index];
              return UpcomingEventCard(
                event: event,
                onTap: widget.onEventTap,
                onFavoriteToggle: () => _toggleFavorite(index),
                onBookNow: widget.onBookNow,
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // See All Button
        Center(
          child: CustomButton(
            text: 'See all',
            onPressed: widget.onSeeAll,
            isPrimary: false,
            height: 32,
            width: 100,
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Filter Events',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _filterOptions.map((filter) {
              return ListTile(
                title: Text(
                  filter,
                  style: TextStyle(
                    color: _selectedFilter == filter
                        ? AppColors.primaryGreen
                        : AppColors.textPrimary,
                    fontWeight: _selectedFilter == filter
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedFilter = filter;
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
