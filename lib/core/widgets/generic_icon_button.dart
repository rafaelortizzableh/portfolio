import 'package:flutter/material.dart';

import '../core.dart';

class GenericIconButton extends StatelessWidget {
  const GenericIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.boxDecoration = const BoxDecoration(),
    this.size = 24.0,
    this.color = Palette.white,
    this.tooltipMesssage,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final BoxDecoration boxDecoration;
  final double size;
  final Color color;
  final String? tooltipMesssage;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: boxDecoration.copyWith(
        shape: BoxShape.circle,
      ),
      child: Tooltip(
        message: tooltipMesssage ?? '',
        child: IconButton(
          onPressed: onPressed,
          iconSize: size,
          color: color,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
