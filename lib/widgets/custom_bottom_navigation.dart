import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          height:
              MediaQuery.of(context).size.height * 0.10, // Responsive height
          width: MediaQuery.of(context).size.width * 0.85, // Already responsive
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.10), // Responsive radius
            boxShadow: [
              // Main shadow for 3D floating effect
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
                spreadRadius: 2,
              ),
              // Gradient glow effect
              BoxShadow(
                color: AppColors.primaryGreen.withOpacity(0.1),
                blurRadius: 30,
                offset: const Offset(0, 0),
                spreadRadius: 8,
              ),
              // Inner glow for depth
              BoxShadow(
                color: Colors.white.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                context: context,
                index: 0,
                iconPath: 'assets/icons/home-smile.svg',
                label: 'Home',
                isActive: currentIndex == 0,
              ),
              _buildNavItem(
                context: context,
                index: 1,
                iconPath: 'assets/icons/ticket.svg',
                label: 'Tickets',
                isActive: currentIndex == 1,
              ),
              _buildNavItem(
                context: context,
                index: 2,
                iconPath: 'assets/icons/stand.svg',
                label: 'Events',
                isActive: currentIndex == 2,
              ),
              _buildNavItem(
                context: context,
                index: 3,
                iconPath: 'assets/icons/hearts.svg',
                label: 'Favorites',
                isActive: currentIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required String iconPath,
    required String label,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.15, // Responsive width
        height: MediaQuery.of(context).size.width * 0.15, // Responsive height
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryGreen : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: AppColors.primaryGreen.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: AppColors.primaryGreen.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                    spreadRadius: 4,
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            index == 0
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      // Home icon
                      SvgPicture.asset(
                        'assets/icons/home-smile.svg',
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          isActive ? Colors.black : AppColors.textSecondary,
                          BlendMode.srcIn,
                        ),
                      ),
                      // Ellipse/smile on top
                      Positioned(
                        top: 13,
                        child: SvgPicture.asset(
                          'assets/icons/ellipse.svg',
                          width: 16,
                          height: 6,
                          colorFilter: ColorFilter.mode(
                            isActive ? AppColors.primaryGreen : Colors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  )
                : SvgPicture.asset(
                    iconPath,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      isActive ? Colors.black : AppColors.textSecondary,
                      BlendMode.srcIn,
                    ),
                  ),
            // Removed label Text widget
          ],
        ),
      ),
    );
  }
}
