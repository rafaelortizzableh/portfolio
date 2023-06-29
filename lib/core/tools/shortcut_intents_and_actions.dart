import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LogicalKeyboardKey;

abstract class ShortcutIntents {
  /// An intent to close a popup on `Enter` or `Escape`.
  static Map<SingleActivator, ClosePopupIntent> closePopupOnEnterOrEscape(
    BuildContext context,
  ) {
    return <SingleActivator, ClosePopupIntent>{
      const SingleActivator(
        LogicalKeyboardKey.enter,
      ): ClosePopupIntent(context),
      const SingleActivator(
        LogicalKeyboardKey.escape,
      ): ClosePopupIntent(context),
    };
  }

  /// An intent to navigate horizontally in a list.
  static Map<SingleActivator, NavigateHorizontalIntent> navigateHorizontal({
    required Function(NavigateListHorizonalDirection) onNavigate,
  }) {
    return <SingleActivator, NavigateHorizontalIntent>{
      const SingleActivator(LogicalKeyboardKey.arrowLeft):
          NavigateHorizontalIntent(
        direction: NavigateListHorizonalDirection.left,
        onNavigate: onNavigate,
      ),
      const SingleActivator(LogicalKeyboardKey.arrowRight):
          NavigateHorizontalIntent(
        direction: NavigateListHorizonalDirection.right,
        onNavigate: onNavigate,
      ),
    };
  }

  /// An intent to navigate horizontally in a list.
  static Map<SingleActivator, NavigateVerticalIntent> navigateVertical({
    required Function(NavigateListVerticalDirection) onNavigate,
  }) {
    return <SingleActivator, NavigateVerticalIntent>{
      const SingleActivator(LogicalKeyboardKey.arrowUp): NavigateVerticalIntent(
        direction: NavigateListVerticalDirection.up,
        onNavigate: onNavigate,
      ),
      const SingleActivator(LogicalKeyboardKey.arrowDown):
          NavigateVerticalIntent(
        direction: NavigateListVerticalDirection.down,
        onNavigate: onNavigate,
      ),
    };
  }
}

abstract class ShortcutActions {
  /// An action to close a popup.
  static final closePopup = <Type, Action<Intent>>{
    ClosePopupIntent: ClosePopupAction(),
  };

  /// An action to navigate horizontally in a list.
  static final navigateHorizontal = <Type, Action<Intent>>{
    NavigateHorizontalIntent: NavigateHorizontalAction(),
  };

  // An action to navigate vertically in a list.
  static final navigateVertical = <Type, Action<Intent>>{
    NavigateVerticalIntent: NavigateVerticalAction(),
  };
}

class ClosePopupAction extends Action<ClosePopupIntent> {
  @override
  void invoke(ClosePopupIntent intent) {
    Navigator.pop(intent.context);
  }
}

class ClosePopupIntent extends DismissIntent {
  const ClosePopupIntent(this.context);
  final BuildContext context;
}

class NavigateHorizontalAction extends Action<NavigateHorizontalIntent> {
  @override
  void invoke(NavigateHorizontalIntent intent) {
    intent.onNavigate(intent.direction);
  }
}

class NavigateVerticalAction extends Action<NavigateVerticalIntent> {
  @override
  void invoke(NavigateVerticalIntent intent) {
    intent.onNavigate(intent.direction);
  }
}

class NavigateHorizontalIntent extends Intent {
  const NavigateHorizontalIntent({
    required this.onNavigate,
    required this.direction,
  });

  final Function(NavigateListHorizonalDirection) onNavigate;
  final NavigateListHorizonalDirection direction;
}

class NavigateVerticalIntent extends Intent {
  const NavigateVerticalIntent({
    required this.onNavigate,
    required this.direction,
  });

  final Function(NavigateListVerticalDirection) onNavigate;
  final NavigateListVerticalDirection direction;
}

enum NavigateListHorizonalDirection { left, right }

enum NavigateListVerticalDirection { up, down }
