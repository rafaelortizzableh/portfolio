import 'dart:ui';

import 'package:flutter/material.dart';

class TargetPlatformInterfaceModel extends InheritedModel<InterfaceAspect> {
  const TargetPlatformInterfaceModel({
    super.key,
    this.targetPlatform,
    this.isPointerAvailable,
    required super.child,
  });

  final TargetPlatform? targetPlatform;
  final bool? isPointerAvailable;

  static TargetPlatform? targetPlatformOf(BuildContext context) {
    return InheritedModel.inheritFrom<TargetPlatformInterfaceModel>(
      context,
      aspect: InterfaceAspect.targetPlatform,
    )?.targetPlatform;
  }

  static bool isPointerInterfaceOf(BuildContext context) {
    return InheritedModel.inheritFrom<TargetPlatformInterfaceModel>(context,
                aspect: InterfaceAspect.isPointerInterface)
            ?.isPointerAvailable ??
        false;
  }

  @override
  bool updateShouldNotify(TargetPlatformInterfaceModel oldWidget) {
    return targetPlatform != oldWidget.targetPlatform ||
        isPointerAvailable != oldWidget.isPointerAvailable;
  }

  @override
  bool updateShouldNotifyDependent(TargetPlatformInterfaceModel oldWidget,
      Set<InterfaceAspect> dependencies) {
    if (targetPlatform != oldWidget.targetPlatform &&
        dependencies.contains(
          InterfaceAspect.targetPlatform,
        )) {
      return true;
    }
    if (isPointerAvailable != oldWidget.isPointerAvailable &&
        dependencies.contains(
          InterfaceAspect.isPointerInterface,
        )) {
      return true;
    }
    return false;
  }
}

enum InterfaceAspect {
  isPointerInterface,
  targetPlatform,
}

class PointerInterfaceDetectorWrapper extends StatefulWidget {
  const PointerInterfaceDetectorWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<PointerInterfaceDetectorWrapper> createState() =>
      _PointerInterfaceDetectorWrapperState();
}

class _PointerInterfaceDetectorWrapperState
    extends State<PointerInterfaceDetectorWrapper> {
  bool _isPointerAvailable = false;

  void _updatePointerAvailability(PointerEvent event) {
    if (_isPointerAvailable) return;
    if (event.kind != PointerDeviceKind.mouse) return;
    setState(() => _isPointerAvailable = true);
  }

  @override
  Widget build(BuildContext context) {
    final targetPlatform = Theme.of(context).platform;
    return TargetPlatformInterfaceModel(
      isPointerAvailable: _isPointerAvailable,
      targetPlatform: targetPlatform,
      child: MouseRegion(
        onEnter: _updatePointerAvailability,
        child: widget.child,
      ),
    );
  }
}
