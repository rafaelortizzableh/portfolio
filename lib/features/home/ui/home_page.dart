import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final isWithinDeviceFrame = DeviceWrapperModel.isWithinDeviceFrameOf(
      context,
    );
    final drawer = !isWithinDeviceFrame ? const HomeDrawer() : null;
    final bottomNavigationBar = !isWithinDeviceFrame
        ? const ContactIconsWrap()
        : AppConstants.emptySpace;
    final slivers = [
      HomeSliverAppBar(isWithinDeviceFrame: isWithinDeviceFrame),
      const SliverPadding(
        padding: AppConstants.verticalPadding16,
        sliver: HomeSliverProjectsList(),
      ),
    ];

    return StatusBarWrapper(
      statusBarStyle: StatusBarStyle.light,
      child: Scaffold(
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        body: CustomScrollView(slivers: slivers),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: AppConstants.verticalPadding4,
          child: !isWithinDeviceFrame
              ? FloatingActionButton(
                  backgroundColor: Palette.black,
                  foregroundColor: Palette.white,
                  onPressed: ThemeModeController.maybeof(
                    context,
                  )?.toggleThemeMode,
                  child: Builder(
                    builder: (context) {
                      final themeMode =
                          context.theme.brightness == Brightness.dark
                          ? ThemeMode.dark
                          : ThemeMode.light;
                      final icon = themeMode == ThemeMode.dark
                          ? Icons.flashlight_on
                          : Icons.flashlight_off;
                      return Icon(icon);
                    },
                  ),
                )
              : AppConstants.emptySpace,
        ),
      ),
    );
  }
}
