import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/core.dart';
import '../../features.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx < -5.0) {
          Navigator.of(context).pop();
        }
      },
      child: Drawer(
        width: context.width * 0.8,
        child: const InfoSidePanel(),
      ),
    );
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
        child: Icon(PhosphorIcons.fill.info),
      ),
    );
  }

  void _onFABPressed(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
