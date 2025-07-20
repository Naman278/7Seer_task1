import 'package:flutter/material.dart';
import '../models/category.dart';
import '../constants/app_colors.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  final VoidCallback? onTap;
  final bool isSelected;

  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
    this.isSelected = false,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _borderAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _borderAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  void _handleTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.20, // Reduced by 20% from 0.25
              height: MediaQuery.of(context).size.width *
                  0.095, // Further reduced height
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primaryGreen,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category Icon
                  Image.asset(
                    widget.category.icon,
                    width: MediaQuery.of(context).size.width *
                        0.064, // Reduced by 20% from 0.08
                    height: MediaQuery.of(context).size.width * 0.064,
                    color: AppColors.textPrimary,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.width *
                          0.008), // Reduced spacing

                  // Category Name
                  Text(
                    widget.category.name,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: MediaQuery.of(context).size.width *
                          0.028, // Reduced by 20% from 0.035
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
