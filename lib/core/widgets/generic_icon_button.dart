import 'package:flutter/material.dart';

import '../core.dart';

class GenericIconButton extends StatefulWidget {
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
  State<GenericIconButton> createState() => _GenericIconButtonState();
}

class _GenericIconButtonState extends State<GenericIconButton> {
  bool _isHovered = false;
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isClicked = true),
      onTapUp: (_) => setState(() {
        _isClicked = false;
        _isHovered = false;
      }),
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: _opacity,
          child: DecoratedBox(
            decoration: widget.boxDecoration.copyWith(
              shape: BoxShape.circle,
            ),
            child: Tooltip(
              message: widget.tooltipMesssage ?? '',
              child: IconButton(
                onPressed: widget.onPressed,
                iconSize: widget.size,
                color: widget.color,
                icon: Icon(widget.icon),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double get _opacity {
    if (_isClicked) return 0.8;
    if (_isHovered) return 0.7;
    return 1.0;
  }
}
