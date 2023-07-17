import 'package:flutter/material.dart';

abstract class AppConstants {
  // Navigation
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  // Layout
  static const double mobileLayoutMaxWidth = 600.0;

  // Border Radius
  static const borderRadius8 = BorderRadius.all(Radius.circular(8.0));
  static const borderRadius12 = BorderRadius.all(Radius.circular(12.0));
  static const borderRadius16 = BorderRadius.all(Radius.circular(16.0));

  // Spacing
  static const double spacing4 = 4.0;
  static const double spacing6 = 6.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;

  static const horizontalSpacing4 = SizedBox(width: 4.0);
  static const horizontalSpacing8 = SizedBox(width: 8.0);
  static const horizontalSpacing12 = SizedBox(width: 12.0);
  static const horizontalSpacing16 = SizedBox(width: 16.0);
  static const horizontalSpacing24 = SizedBox(width: 24.0);
  static const verticalSpacing4 = SizedBox(height: 4.0);
  static const verticalSpacing8 = SizedBox(height: 8.0);
  static const verticalSpacing12 = SizedBox(height: 12.0);
  static const verticalSpacing16 = SizedBox(height: 16.0);
  static const verticalSpacing24 = SizedBox(height: 24.0);

  // Padding
  static const horizontalPadding4 = EdgeInsets.symmetric(horizontal: 4.0);
  static const horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8.0);
  static const horizontalPadding12 = EdgeInsets.symmetric(horizontal: 12.0);
  static const horizontalPadding16 = EdgeInsets.symmetric(horizontal: 16.0);
  static const horizontalPadding24 = EdgeInsets.symmetric(horizontal: 24.0);
  static const horizontalPadding32 = EdgeInsets.symmetric(horizontal: 32.0);

  static const verticalPadding4 = EdgeInsets.symmetric(vertical: 4.0);
  static const verticalPadding8 = EdgeInsets.symmetric(vertical: 8.0);
  static const verticalPadding12 = EdgeInsets.symmetric(vertical: 12.0);
  static const verticalPadding16 = EdgeInsets.symmetric(vertical: 16.0);
  static const verticalPadding24 = EdgeInsets.symmetric(vertical: 24.0);
  static const verticalPadding32 = EdgeInsets.symmetric(vertical: 32.0);

  static const padding4 = EdgeInsets.all(4.0);
  static const padding8 = EdgeInsets.all(8.0);
  static const padding12 = EdgeInsets.all(12.0);
  static const padding16 = EdgeInsets.all(16.0);
  static const padding24 = EdgeInsets.all(24.0);
  static const padding32 = EdgeInsets.all(32.0);
}
