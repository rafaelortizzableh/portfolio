import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

enum StatusBarStyle { dark, light }

class StatusBarWrapper extends StatelessWidget {
  const StatusBarWrapper({
    super.key,
    required this.child,
    this.statusBarStyle = StatusBarStyle.dark,
  });

  final Widget child;
  final StatusBarStyle statusBarStyle;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _systemUiOverlayStyle,
      child: child,
    );
  }

  SystemUiOverlayStyle get _systemUiOverlayStyle {
    switch (statusBarStyle) {
      case StatusBarStyle.dark:
        return SystemUiOverlayStyle.dark;
      case StatusBarStyle.light:
        return SystemUiOverlayStyle.light;
    }
  }
}
