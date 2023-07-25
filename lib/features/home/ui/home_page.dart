import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static const routeName = '/home';

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
      const SliverPadding(padding: AppConstants.verticalPadding8),
      const HomeSliverProjectsList(),
    ];

    return StatusBarWrapper(
      statusBarStyle: StatusBarStyle.light,
      child: Scaffold(
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        body: CustomScrollView(slivers: slivers),
      ),
    );
  }
}
