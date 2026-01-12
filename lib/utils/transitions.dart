import 'package:flutter/material.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
    : super(
        transitionDuration: const Duration(milliseconds: 280),
        reverseTransitionDuration: const Duration(milliseconds: 220),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page,
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              const begin = Offset(
                -0.15,
                0.0,
              ); // starts slightly left (predictive feel)
              const end = Offset.zero;
              var curve = Curves.easeOutCubic;

              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
      );
}

class SlideLeftRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideLeftRoute({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          // Using a slightly smoother curve than standard easeInOut
          const curve = Curves.easeOutCubic;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
        reverseTransitionDuration: const Duration(milliseconds: 400),
      );
}
