import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'custom_button.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllTap;
  final String? seeAllText;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAllTap,
    this.seeAllText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  title,
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

          // See All Button (if provided)
          if (onSeeAllTap != null) ...[
            const SizedBox(height: 16),
            CustomButton(
              text: seeAllText ?? 'See all',
              onPressed: onSeeAllTap,
              isPrimary: false,
              height: 40,
              width: 120,
            ),
          ],
        ],
      ),
    );
  }
}
