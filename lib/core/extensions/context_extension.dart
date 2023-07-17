import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension CustomExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;

  FlutterView get view => View.of(this);
  ViewPadding get viewPadding => View.of(this).padding;

  double get dpr => MediaQuery.devicePixelRatioOf(this);

  double get topPadding {
    final viewPaddingTop = View.of(this).padding.top;
    return viewPaddingTop / dpr;
  }

  double get bottomPadding {
    final viewPaddingTop = View.of(this).padding.bottom;
    return viewPaddingTop / dpr;
  }
}
