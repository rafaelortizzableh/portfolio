import 'package:flutter/material.dart';

class DeviceWrapperModel extends InheritedModel<_DeviceWrapperAspect> {
  const DeviceWrapperModel({
    super.key,
    this.isWithinDeviceFrame,
    required super.child,
  });

  final bool? isWithinDeviceFrame;

  static bool isWithinDeviceFrameOf(BuildContext context) {
    return InheritedModel.inheritFrom<DeviceWrapperModel>(context,
                aspect: _DeviceWrapperAspect.isWithinDeviceFrame)
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
    // ignore: library_private_types_in_public_api
    Set<_DeviceWrapperAspect> dependencies,
  ) {
    if (isWithinDeviceFrame != oldWidget.isWithinDeviceFrame &&
        dependencies.contains(
          _DeviceWrapperAspect.isWithinDeviceFrame,
        )) {
      return true;
    }
    return false;
  }
}

enum _DeviceWrapperAspect {
  isWithinDeviceFrame,
}
