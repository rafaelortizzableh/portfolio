import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

import '../core.dart';

class CloseFullScreenButton extends StatelessWidget {
  const CloseFullScreenButton({
    super.key,
    required this.color,
    this.onClose,
    this.size = 37.0,
  });

  final Color color;
  final VoidCallback? onClose;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GenericIconButton(
      icon: CupertinoIcons.xmark_circle,
      color: color,
      size: size,
      onPressed: () {
        if (onClose != null) onClose!();

        Navigator.pop(context);
      },
      tooltipMesssage: context.l10n.closeCta,
    );
  }
}
