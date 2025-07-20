import 'package:flutter/material.dart';

class AppColors {
  // App Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1E1E1E);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray300 = Color(0xFFD1D5DB);

  // Additional Colors
  static const Color greyCustom = Colors.grey;
  static const Color transparentCustom = Colors.transparent;
  static const Color blackCustom = Colors.black;
  static const Color whiteCustom = Colors.white;
  static const Color colorFF0C0E = Color(0xFF0C0E12);
  static const Color colorFFF7F7 = Color(0xFFF7F7F7);
  static const Color colorFF6164 = Color(0xFF61646C);
  static const Color colorFFAFFF = Color(0xFFAFFF00);
  static const Color colorFFD9D9 = Color(0xFFD9D9D9);
  static const Color colorFF373A = Color(0xFF373A41);
  static const Color colorFFCECF = Color(0xFFCECFD2);
  static const Color colorFFD9E5 = Color(0xFFD9E5CC);
  static const Color colorFFE0E0 = Color(0xFFE0E0E0);
  static const Color colorFF2226 = Color(0xFF22262F);
  static const Color colorFF1215 = Color(0xFF12151B);
  static const Color colorFF3333 = Color(0xFF333333);
  static const Color colorFF8588 = Color(0xFF85888E);

  // Color Shades
  static Color get grey200 => Colors.grey.shade200;
  static Color get grey100 => Colors.grey.shade100;

  // Primary Colors (using your color system)
  static const Color primaryGreen = colorFFAFFF;
  static const Color primaryGreenDark = Color(0xFF8CD600);

  // Background Colors (using your color system)
  static const Color background = colorFF1215;
  static const Color surface = colorFF2226;
  static const Color cardBackground = colorFF373A;
  static const Color cardBackgroundLight = colorFF6164;

  // Text Colors (using your color system)
  static const Color textPrimary = white;
  static const Color textSecondary = colorFFCECF;
  static const Color textTertiary = colorFF8588;

  // Interactive Colors
  static const Color buttonPrimary = colorFFAFFF;
  static const Color buttonSecondary = colorFF373A;
  static const Color buttonText = white;

  // Status Colors
  static const Color success = colorFFAFFF;
  static const Color error = Color(0xFFFF4757);
  static const Color warning = Color(0xFFFFA502);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [colorFFAFFF, Color(0xFF8CD600)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [colorFF373A, colorFF2226],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
