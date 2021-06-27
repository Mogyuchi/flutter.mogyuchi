import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//https://github.com/flutter/flutter/blob/1d9032c7e1d867f071f2277eb1673e8f9b0274e3/packages/flutter/lib/src/material/page_transitions_theme.dart#L464-L482
class CustomTransitionsBuilder extends PageTransitionsBuilder {
  const CustomTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T>? route,
      BuildContext? context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return _CustomPageTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child,
    );
  }
}
// https://github.com/flutter/flutter/blob/e7b7ebc066c1b2a5aa5c19f8961307427e0142a6/packages/flutter/lib/src/material/page_transitions_theme.dart#L48-L146
class _CustomPageTransition extends StatelessWidget {
  const _CustomPageTransition({
    Key? key,
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
  }) : super(key: key);

  // The new page slides upwards just a little as its clip
  // rectangle exposes the page from bottom to top.
  static final Tween<Offset> _primaryTranslationTween = Tween<Offset>(
    begin: const Offset(0.0, 1.0),
    end: Offset.zero,
  );

  // The old page slides upwards a little as the new page appears.
  static final Tween<Offset> _secondaryTranslationTween = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, -1.0),
  );

  // The scrim obscures the old page by becoming increasingly opaque.
  static final Tween<double> _scrimOpacityTween = Tween<double>(
    begin: 0.0,
    end: 0.0,
  );

  // Used by all of the transition animations.
  static const Curve _transitionCurve = Cubic(0.20, 0.00, 0.00, 1.00);

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size size = constraints.biggest;

        final CurvedAnimation primaryAnimation = CurvedAnimation(
          parent: animation,
          curve: _transitionCurve,
          reverseCurve: _transitionCurve.flipped,
        );

        // Gradually expose the new page from bottom to top.
        final Animation<double> clipAnimation = Tween<double>(
          begin: 0.0,
          end: size.height,
        ).animate(primaryAnimation);

        final Animation<double> opacityAnimation = _scrimOpacityTween.animate(primaryAnimation);
        final Animation<Offset> primaryTranslationAnimation = _primaryTranslationTween.animate(primaryAnimation);

        final Animation<Offset> secondaryTranslationAnimation = _secondaryTranslationTween.animate(
          CurvedAnimation(
            parent: secondaryAnimation,
            curve: _transitionCurve,
            reverseCurve: _transitionCurve.flipped,
          ),
        );

        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Container(
              color: Colors.black.withOpacity(opacityAnimation.value),
              alignment: Alignment.bottomLeft,
              child: ClipRect(
                child: SizedBox(
                  height: clipAnimation.value,
                  child: OverflowBox(
                    alignment: Alignment.bottomLeft,
                    maxHeight: size.height,
                    child: child,
                  ),
                ),
              ),
            );
          },
          child: AnimatedBuilder(
            animation: secondaryAnimation,
            child: FractionalTranslation(
              translation: primaryTranslationAnimation.value,
              child: child,
            ),
            builder: (BuildContext context, Widget? child) {
              return FractionalTranslation(
                translation: secondaryTranslationAnimation.value,
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
