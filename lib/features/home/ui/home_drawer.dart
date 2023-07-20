import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isWebAndDesktop = _isWebAndDesktop(context);
    return GestureDetector(
      onHorizontalDragUpdate: isWebAndDesktop
          ? (details) => _closeOnDragUpdate(
                details,
                context,
              )
          : null,
      child: Drawer(
        width: context.width * 0.8,
        child: const InfoSidePanel(),
      ),
    );
  }

  void _closeOnDragUpdate(DragUpdateDetails details, BuildContext context) {
    if (details.primaryDelta! > 0) {
      unawaited(Navigator.maybePop(context));
    }
  }

  bool _isWebAndDesktop(BuildContext context) {
    final targetPlatform = TargetPlatformInterfaceModel.targetPlatformOf(
      context,
    );
    final isMacOS = targetPlatform == TargetPlatform.macOS;
    final isWindows = targetPlatform == TargetPlatform.windows;
    final isLinux = targetPlatform == TargetPlatform.linux;
    final isDesktopPlatform = isMacOS || isWindows || isLinux;

    return kIsWeb && isDesktopPlatform;
  }
}

class HomeDrawerFAB extends StatelessWidget {
  const HomeDrawerFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.padding4,
      child: FloatingActionButton.small(
        shape: const RoundedRectangleBorder(
          borderRadius: AppConstants.borderRadius16,
        ),
        backgroundColor: Palette.black,
        onPressed: () => _onFABPressed(context),
        child: const GenericAssetIconWidget(
          iconAsset: 'assets/icons/info_icon.webp',
        ),
      ),
    );
  }

  void _onFABPressed(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
