import 'dart:developer';

import 'package:flutter/material.dart';

import '../features/features.dart';
import 'core.dart';

abstract class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route generateDeviceWrapperPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => DeviceWrapper(
        child: Navigator(
          key: navigatorKey,
          onGenerateRoute: _generatePageRoute,
          initialRoute: HomePage.routeName,
        ),
      ),
    );
  }

  static Route _generatePageRoute(
    RouteSettings settings,
  ) {
    log('[ROUTER] => ${settings.name}');
    switch (settings.name) {
      case HomePage.routeName:
        return _getPageRoute(
          settings: settings,
          isModalBottomSheet: false,
          child: const HomePage(),
        );

      case ImageViewer.routeName:
        final args = settings.arguments as ImageViewerArguments;
        return _getPageRoute(
          settings: settings,
          isModalBottomSheet: false,
          child: ImageViewer(
            imageUrl: args.imageUrl,
            imageAsset: args.imageAsset,
            heroTag: args.heroTag,
          ),
        );

      case ProjectPage.routeName:
        final args = settings.arguments as ProjectPageArguments;
        return _getPageRoute(
          settings: settings,
          isModalBottomSheet: true,
          child: ProjectPage(
            portfolioProject: args.portfolioProject,
            backgroundDecoration: args.backgroundDecoration,
          ),
        );

      case ProjectDetailsPage.routeName:
        final args = settings.arguments as ProjectDetailsPageArguments;
        return _getPageRoute(
          settings: settings,
          isModalBottomSheet: true,
          modalBottomSheetBackgroundColor: Palette.black.withOpacity(0.85),
          child: ProjectDetailsPage(
            portfolioProject: args.portfolioProject,
          ),
        );

      default:
        return _getPageRoute(
          settings: settings,
          isModalBottomSheet: false,
          child: _Four0FourWidget(
            key: ObjectKey(settings.name),
          ),
        );
    }
  }

  static _getPageRoute({
    required RouteSettings settings,
    required Widget child,
    required bool isModalBottomSheet,
    Color? modalBottomSheetBackgroundColor,
  }) {
    if (isModalBottomSheet) {
      return ModalBottomSheetRoute(
        isScrollControlled: true,
        backgroundColor: modalBottomSheetBackgroundColor,
        builder: (context) => child,
      );
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => child,
    );
  }
}

class _Four0FourWidget extends StatelessWidget {
  const _Four0FourWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            Text(
              '404',
              style: AppTextStyles.hero,
            ),
            AppConstants.verticalSpacing12,
            ElevatedButton(
              onPressed: () {
                final navigator = Navigator.of(context);
                navigator.pushNamedAndRemoveUntil(
                  HomePage.routeName,
                  (route) => false,
                );
              },
              child: const Text('🏠'),
            ),
          ],
        ),
      ),
    );
  }
}
