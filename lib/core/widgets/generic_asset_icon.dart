import 'package:flutter/material.dart';

class GenericAssetIconWidget extends StatelessWidget {
  const GenericAssetIconWidget({
    super.key,
    this.centerFactor = _centerFactor,
    required this.iconAsset,
    this.iconSize = _iconSize,
    this.color,
  });

  final double centerFactor;
  final String iconAsset;
  final double iconSize;
  final Color? color;

  static const _centerFactor = 1.0;
  static const _iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: centerFactor,
      widthFactor: centerFactor,
      child: Image.asset(
        iconAsset,
        color: color,
        height: iconSize,
      ),
    );
  }
}
