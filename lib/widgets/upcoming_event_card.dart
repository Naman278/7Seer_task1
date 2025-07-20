import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/event.dart';
import '../constants/app_colors.dart';

class UpcomingEventCard extends StatelessWidget {
  final Event event;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onBookNow;

  const UpcomingEventCard({
    super.key,
    required this.event,
    this.onTap,
    this.onFavoriteToggle,
    this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 300,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Banner as background
              if (event.bannerImage != null)
                Image.asset(
                  event.bannerImage!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              else
                Container(
                  color: AppColors.cardBackground,
                ),

              // Gray translucent overlay
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                ),
              ),

              // Content overlay
              Column(
                children: [
                  // Top section with date and favorite icon
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Date indicator
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Top section with "WED"
                              Container(
                                padding: EdgeInsets.zero,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF3A3A3A),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      'Wed',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // White separator line
                              Container(
                                height: 1,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                              // Bottom section with date
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  '30 April 2025',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Favorite icon - directly on card background
                        GestureDetector(
                          onTap: onFavoriteToggle,
                          child: SvgPicture.asset(
                            'assets/icons/heart.svg',
                            width: 30,
                            height: 30,
                            colorFilter: event.isFavorite
                                ? ColorFilter.mode(
                                    AppColors.primaryGreen,
                                    BlendMode.srcIn,
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Event details section
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A), // Slightly darker grey
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Event title
                        Text(
                          event.title,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        // Location
                        Text(
                          event.location,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),

                        // Dotted separator
                        Row(
                          children: List.generate(
                            20,
                            (index) => Expanded(
                              child: Container(
                                height: 1,
                                margin: EdgeInsets.only(
                                  right: index < 19 ? 4 : 0,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.textTertiary,
                                  borderRadius: BorderRadius.circular(0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // "Starts from" text
                        Text(
                          'Starts from',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 2),

                        // Price and Book Now button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Price
                            Text(
                              '₹${event.price}',
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),

                            // Book Now button
                            GestureDetector(
                              onTap: onBookNow,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGreen,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
