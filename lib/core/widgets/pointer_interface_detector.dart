import 'dart:ui';

import 'package:flutter/material.dart';

import '../core.dart';

class TargetPlatformInterfaceModel extends InheritedModel<InterfaceAspect> {
  const TargetPlatformInterfaceModel({
    super.key,
    this.targetPlatform,
    this.isPointerAvailable,
    this.isMobileLayout,
    required super.child,
  });

  final TargetPlatform? targetPlatform;
  final bool? isPointerAvailable;
  final bool? isMobileLayout;

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

  static bool isMobileLayoutOf(BuildContext context) {
    return InheritedModel.inheritFrom<TargetPlatformInterfaceModel>(context,
                aspect: InterfaceAspect.isPointerInterface)
            ?.isMobileLayout ??
        false;
  }

  @override
  bool updateShouldNotify(TargetPlatformInterfaceModel oldWidget) {
    return targetPlatform != oldWidget.targetPlatform ||
        isPointerAvailable != oldWidget.isPointerAvailable ||
        isMobileLayout != oldWidget.isMobileLayout;
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

    if (isMobileLayout != oldWidget.isMobileLayout &&
        dependencies.contains(
          InterfaceAspect.isMobileLayout,
        )) {
      return true;
    }
    return false;
  }
}

enum InterfaceAspect {
  isPointerInterface,
  targetPlatform,
  isMobileLayout,
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
    final isMobileLayout = View.of(context).physicalSize.width <=
        AppConstants.mobileLayoutMaxWidth;
    return TargetPlatformInterfaceModel(
      isPointerAvailable: _isPointerAvailable,
      targetPlatform: targetPlatform,
      isMobileLayout: isMobileLayout,
      child: MouseRegion(
        onEnter: _updatePointerAvailability,
        child: widget.child,
      ),
    );
  }
}
