import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../core.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  late final Future<void> _precacheFuture;
  static const _animationDuration = Duration(milliseconds: 1500);

  @override
  void initState() {
    super.initState();
    RendererBinding.instance.deferFirstFrame();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheFuture = preloadAssetImages(context).whenComplete(() {
      RendererBinding.instance.allowFirstFrame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        child: FutureBuilder<void>(
          future: _precacheFuture,
          builder: (context, snapshot) {
            final shouldShowErrorScreen = snapshot.maybeWhen(
              error: (_, __) => true,
              orElse: () => false,
            );

            if (shouldShowErrorScreen) {
              return _ErrorWidget(errorMessage: snapshot.error.toString());
            }

            final shouldShowSplashScreen = snapshot.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            final child =
                !shouldShowSplashScreen ? widget.child : const _SplashWidget();

            return AnimatedSwitcher(
              duration: _animationDuration,
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: _positionTween(
                    animation,
                  ),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Palette.grey,
                    ),
                    child: child,
                  ),
                );
              },
              child: child,
            );
          },
        ),
      ),
    );
  }

  Animation<Offset> _positionTween(Animation<double> animation) {
    return Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    )
        .chain(
          CurveTween(curve: Sprung.criticallyDamped),
        )
        .animate(animation);
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    // ignore: unused_element
    super.key,
    required this.errorMessage,
  });
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Palette.grey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error:\n'
              '$errorMessage',
              style: AppTextStyles.mediumStrong.copyWith(
                color: Palette.white,
              ),
              textAlign: TextAlign.center,
            ),
            AppConstants.verticalSpacing8,
          ],
        ),
      ),
    );
  }
}

class _SplashWidget extends StatelessWidget {
  const _SplashWidget({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: Image.asset(
          'assets/images/Icon-512.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
