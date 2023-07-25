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

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = context.width <= AppConstants.mobileLayoutMaxWidth;
    return _DeviceWrapperLayout(
      isMobileLayout: isMobileLayout,
      child: child,
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
    final targetPlatform = TargetPlatformInterfaceModel.targetPlatformOf(
      context,
    );
    final isMobileDevice = _isMobileDevice(targetPlatform);

    final child = (isMobileLayout || isMobileDevice)
        ? this.child
        : Material(
            type: MaterialType.canvas,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 2,
                  child: InfoSidePanel(),
                ),
                Expanded(
                  flex: 4,
                  child: Scaffold(
                    floatingActionButton: const ContactIconsWrap(
                      direction: Axis.vertical,
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.endFloat,
                    appBar: const PortfolioHeader(),
                    body: Padding(
                      padding: AppConstants.horizontalPadding24,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: double.infinity,
                          child: Padding(
                            padding: AppConstants.verticalPadding8,
                            child: _DeviceFrameSelector(child: this.child),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

    final isWithinDeviceFrame = !isMobileDevice && !isMobileLayout;

    return DeviceWrapperModel(
      isWithinDeviceFrame: isWithinDeviceFrame,
      child: child,
    );
  }

  bool _isMobileDevice(TargetPlatform? targetPlatform) {
    final isAndroid = targetPlatform == TargetPlatform.android;
    final isIOS = targetPlatform == TargetPlatform.iOS;
    return isAndroid || isIOS;
  }
}

class _DeviceFrameSelector extends StatefulWidget {
  const _DeviceFrameSelector({
    required this.child,
  });

  final Widget child;

  @override
  State<_DeviceFrameSelector> createState() => _DeviceFrameSelectorState();
}

class _DeviceFrameSelectorState extends State<_DeviceFrameSelector> {
  @override
  Widget build(BuildContext context) {
    return DeviceFrame(
      device: _deviceInfo,
      screen: widget.child,
    );
  }

  DeviceInfo get _deviceInfo {
    return Devices.ios.iPhone13;
  }
}
