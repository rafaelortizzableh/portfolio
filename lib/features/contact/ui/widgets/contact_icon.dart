import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/core.dart';
import '../../contact.dart';

class ContactIcon extends StatefulWidget {
  const ContactIcon({
    super.key,
    required this.contactIconAndLink,
  });

  final ContactIconAndLinkRecord contactIconAndLink;

  @override
  State<ContactIcon> createState() => _ContactIconState();
}

class _ContactIconState extends State<ContactIcon> {
  bool _hovered = false;
  bool _tapped = false;

  static const _centerFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _tapped = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _tapped = true),
        onTapUp: (_) => setState(() {
          _tapped = false;
          _hovered = false;
        }),
        onLongPressCancel: () => setState(() {
          _tapped = false;
          _hovered = false;
        }),
        onTapCancel: () => setState(() {
          _tapped = false;
          _hovered = false;
        }),
        onTap: _launchUrl,
        child: AnimatedOpacity(
          duration: kThemeAnimationDuration,
          opacity: _opacity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Palette.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                heightFactor: _centerFactor,
                widthFactor: _centerFactor,
                child: Icon(
                  widget.contactIconAndLink.icon,
                  color: Palette.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _launchUrl() {
    unawaited(launchUrl(
      widget.contactIconAndLink.url,
      mode: LaunchMode.externalApplication,
    ));
  }

  double get _opacity {
    if (_tapped) {
      return 0.75;
    }
    if (_hovered) {
      return 0.85;
    }
    return 1.0;
  }
}
