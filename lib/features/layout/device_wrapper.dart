import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../features.dart';

class DeviceWrapper extends StatelessWidget {
  const DeviceWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isMobileLayout =
        MediaQuery.of(context).size.width <= AppConstants.mobileLayoutMaxWidth;
    return DeviceWrapperModel(
      isWithinDeviceFrame: !isMobileLayout,
      child: _DeviceWrapperLayout(
        isMobileLayout: isMobileLayout,
        child: child,
      ),
    );
  }
}

class _DeviceWrapperLayout extends StatelessWidget {
  const _DeviceWrapperLayout({
    required this.child,
    required this.isMobileLayout,
  });

  final Widget child;
  final bool isMobileLayout;

  @override
  Widget build(BuildContext context) {
    final targetPlatform =
        TargetPlatformInterfaceModel.targetPlatformOf(context);
    final isMobileDevice = targetPlatform == TargetPlatform.iOS ||
        targetPlatform == TargetPlatform.android;
    if (isMobileLayout || isMobileDevice) return child;

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 2,
            child: InfoSidePanel(),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(
                  right: 0,
                  child: ContactIconsWrap(direction: Axis.vertical),
                ),
                Padding(
                  padding: AppConstants.horizontalPadding12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const PortfolioHeader(),
                      Expanded(
                        child: Padding(
                          padding: AppConstants.verticalPadding16,
                          child: DeviceFrame(
                            device: Devices.ios.iPhone13,
                            orientation: Orientation.portrait,
                            screen: child,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
