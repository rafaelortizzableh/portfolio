import 'package:flutter/material.dart';

abstract class AppConstants {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static const double borderRadius = 8.0;
  static const double mediumSpacing = 24.0;
  static const double horizontalPadding = 12.0;
  static const double verticalPadding = 12.0;
  static const double listItemSpacing = 8.0;
  static const double mobileLayoutMaxWidth = 600.0;
}
