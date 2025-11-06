import 'package:flutter/material.dart';

import 'core.dart';

class CustomTheme {
  static const double _appBarElevation = 0;

  static ThemeData darkTheme() {
    final theme = ThemeData.dark();

    return ThemeData(
      colorSchemeSeed: Palette.grey,
      brightness: Brightness.dark,
      canvasColor: Colors.grey.shade900,
      scaffoldBackgroundColor: Colors.grey.shade900,
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
          .apply(displayColor: Colors.white, bodyColor: Colors.white),
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
      brightness: Brightness.light,
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
          .apply(displayColor: Colors.black, bodyColor: Colors.black),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(backgroundColor: Palette.grey),
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

class ThemeWrapper extends StatefulWidget {
  const ThemeWrapper({super.key, required this.builder});

  final Widget Function(
    ThemeMode? themeMode,
    Function(ThemeMode? themeMode) onChanged,
    BuildContext context,
  )
  builder;

  @override
  State<ThemeWrapper> createState() => _ThemeWrapperState();
}

class _ThemeWrapperState extends State<ThemeWrapper> {
  final _themeModeValueNotifier = ThemeModeValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _loadInitialThemeMode();
    _themeModeValueNotifier.addListener(() {
      _saveThemeModeToSharedPrefs();
    });
  }

  @override
  void dispose() {
    _themeModeValueNotifier.dispose();
    super.dispose();
  }

  void _loadInitialThemeMode() {
    final prefs = SharedPreferencesSingleton.instance.prefs;
    final themeModeIsDark = prefs?.getBool(_themeSharedPrefsKey);
    _themeModeValueNotifier.value = themeModeIsDark == true
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  void _saveThemeModeToSharedPrefs() {
    final prefs = SharedPreferencesSingleton.instance.prefs;
    prefs?.setBool(
      _themeSharedPrefsKey,
      _themeModeValueNotifier.value == ThemeMode.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _themeModeValueNotifier,
      builder: (context, themeMode, child) {
        return ThemeModeController(
          themeModeValueNotifier: _themeModeValueNotifier,
          child: widget.builder(themeMode, (themeMode) {
            _themeModeValueNotifier.value = themeMode;
          }, context),
        );
      },
    );
  }
}

const _themeSharedPrefsKey = 'theme_mode_is_dark';

class ThemeModeController extends InheritedWidget {
  const ThemeModeController({
    super.key,
    required this.themeModeValueNotifier,
    required super.child,
  });

  final ThemeModeValueNotifier themeModeValueNotifier;

  @override
  bool updateShouldNotify(ThemeModeController oldWidget) {
    return themeModeValueNotifier != oldWidget.themeModeValueNotifier;
  }

  static ThemeModeValueNotifier? maybeof(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeModeController>()
        ?.themeModeValueNotifier;
  }
}

class ThemeModeValueNotifier extends ValueNotifier<ThemeMode?> {
  ThemeModeValueNotifier(super.value);

  void toggleThemeMode() {
    value = value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }
}
