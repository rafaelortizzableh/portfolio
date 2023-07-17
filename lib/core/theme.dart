import 'package:flutter/material.dart';

import 'core.dart';

class CustomTheme {
  static const double _appBarElevation = 0;

  static ThemeData darkTheme() {
    final theme = ThemeData.dark();
    return ThemeData(
      colorSchemeSeed: Palette.grey,
      canvasColor: Palette.black,
      scaffoldBackgroundColor: Palette.black,
      appBarTheme: const AppBarTheme(
        elevation: _appBarElevation,
        backgroundColor: Palette.grey,
        foregroundColor: Palette.white,
      ),
      textTheme: theme.primaryTextTheme
          .copyWith(
            labelLarge: AppTextStyles.mediumRegular.copyWith(
              color: Colors.white,
            ),
          )
          .apply(
            displayColor: Colors.white,
            bodyColor: Colors.white,
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Palette.grey,
          foregroundColor: Palette.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          enableFeedback: true,
          padding: AppConstants.padding12,
          shape: const RoundedRectangleBorder(
            borderRadius: AppConstants.borderRadius12,
          ),
        ),
      ),
    );
  }

  static ThemeData lightTheme() {
    final theme = ThemeData.light();
    return ThemeData(
      colorSchemeSeed: Palette.grey,
      canvasColor: Palette.white,
      scaffoldBackgroundColor: Palette.white,
      appBarTheme: const AppBarTheme(
        elevation: _appBarElevation,
        foregroundColor: Palette.grey,
        backgroundColor: Palette.white,
      ),
      textTheme: theme.primaryTextTheme
          .copyWith(
            labelLarge: AppTextStyles.mediumRegular.copyWith(
              color: Colors.white,
            ),
          )
          .apply(
            displayColor: Colors.black,
            bodyColor: Colors.black,
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Palette.grey,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          enableFeedback: true,
          padding: AppConstants.padding12,
          shape: const RoundedRectangleBorder(
            borderRadius: AppConstants.borderRadius12,
          ),
        ),
      ),
    );
  }
}

class Palette {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF565662);
}

abstract class ThemeFonts {
  static const montserrat = 'Montserrat';
  static const norwester = 'Norwester';
}

abstract class AppTextStyles {
  @visibleForTesting
  static const base = TextStyle(
    fontFamily: ThemeFonts.montserrat,
    // To ensure that text is visually centered vertically.
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final hero = base.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 45,
    height: 1,
    letterSpacing: -1.5,
    fontFamily: ThemeFonts.norwester,
  );

  static final h1 = base.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 25,
    height: (30 / 25.0),
    letterSpacing: -0.5,
    fontFamily: ThemeFonts.norwester,
  );

  static final h2 = base.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: (24 / 18.0),
    fontFamily: ThemeFonts.norwester,
  );

  static final mediumStrong = base.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    height: (21 / 15.0),
    letterSpacing: 0.1,
  );
  static final mediumLight = base.copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 15,
    height: (21 / 15.0),
    letterSpacing: 0.1,
  );

  static final mediumRegular = base.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: (21 / 15.0),
    letterSpacing: 0.1,
  );

  static final smallStrong = base.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 13,
    height: (18 / 13.0),
    letterSpacing: 0.1,
  );

  static final smallRegular = base.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    height: (18 / 13.0),
    letterSpacing: 0.1,
  );

  static final smallLight = base.copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 13,
    height: (18 / 13.0),
    letterSpacing: 0.1,
  );
}
