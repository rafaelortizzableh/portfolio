import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FadingLargeSliverAppBar extends StatelessWidget {
  const FadingLargeSliverAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.background,
    this.bottom,
    this.elevation,
    this.shadowColor,
    this.forceElevated = false,
    this.foregroundColor,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.pinned = true,
    this.titleTextStyle,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.collapsedHeight,
    this.expandedHeight,
    this.floating = false,
    this.snap = false,
    this.stretch = true,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.shape,
    this.toolbarHeight = kToolbarHeight,
    this.leadingWidth,
    this.stretchModes = const <StretchMode>[StretchMode.zoomBackground],
    required this.fadeAt,
  })  : assert(floating || !snap,
            'The "snap" argument only makes sense for floating app bars.'),
        assert(stretchTriggerOffset > 0.0),
        assert(
          collapsedHeight == null || collapsedHeight > toolbarHeight,
          'The "collapsedHeight" argument has to be larger than [toolbarHeight].',
        );
  final double fadeAt;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? background;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? shadowColor;
  final Color? foregroundColor;
  final bool forceElevated;
  final Color? backgroundColor;
  final Brightness? brightness;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final TextStyle? titleTextStyle;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double titleSpacing;
  final double? collapsedHeight;
  final double? expandedHeight;
  final bool floating;
  final ShapeBorder? shape;
  final bool snap;
  final bool stretch;
  final double stretchTriggerOffset;
  final AsyncCallback? onStretchTrigger;
  final double toolbarHeight;
  final double? leadingWidth;
  final bool pinned;
  final List<StretchMode> stretchModes;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      pinned: pinned,
      leading: leading,
      actions: actions,
      actionsIconTheme: actionsIconTheme,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      bottom: bottom,
      centerTitle: centerTitle,
      collapsedHeight: collapsedHeight,
      elevation: elevation,
      excludeHeaderSemantics: excludeHeaderSemantics,
      floating: floating,
      forceElevated: forceElevated,
      iconTheme: iconTheme,
      key: key,
      leadingWidth: leadingWidth,
      onStretchTrigger: onStretchTrigger,
      primary: primary,
      shadowColor: shadowColor,
      shape: shape,
      snap: snap,
      stretch: stretch,
      stretchTriggerOffset: stretchTriggerOffset,
      titleTextStyle: titleTextStyle,
      titleSpacing: titleSpacing,
      toolbarHeight: toolbarHeight,
      foregroundColor: foregroundColor,
      expandedHeight: expandedHeight,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final top = constraints.biggest.height;

          return FlexibleSpaceBar(
            centerTitle: centerTitle,
            stretchModes: stretchModes,
            background: AnimatedOpacity(
              opacity: fadeAt >= top ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: background,
            ),
            title: AnimatedOpacity(
              opacity: fadeAt >= top ? 1 : 0,
              duration: const Duration(milliseconds: 100),
              child: title,
            ),
          );
        },
      ),
    );
  }
}
