import 'package:flutter/material.dart';

class DeviceWrapperModel extends InheritedModel<DeviceWrapperAspect> {
  const DeviceWrapperModel({
    super.key,
    this.isWithinDeviceFrame,
    required super.child,
  });

  final bool? isWithinDeviceFrame;

  static bool isWithinDeviceFrameOf(BuildContext context) {
    return InheritedModel.inheritFrom<DeviceWrapperModel>(context,
                aspect: DeviceWrapperAspect.isWithinDeviceFrame)
            ?.isWithinDeviceFrame ??
        false;
  }

  @override
  bool updateShouldNotify(DeviceWrapperModel oldWidget) {
    return isWithinDeviceFrame != oldWidget.isWithinDeviceFrame;
  }

  @override
  bool updateShouldNotifyDependent(
    DeviceWrapperModel oldWidget,
    Set<DeviceWrapperAspect> dependencies,
  ) {
    final shouldNotify = isWithinDeviceFrame != oldWidget.isWithinDeviceFrame &&
        dependencies.contains(
          DeviceWrapperAspect.isWithinDeviceFrame,
        );
    return shouldNotify;
  }
}

enum DeviceWrapperAspect {
  isWithinDeviceFrame,
}
