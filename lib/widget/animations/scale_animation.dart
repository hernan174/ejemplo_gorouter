import 'package:flutter/material.dart';

class ScaleChange extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double aniBegin;
  final double aniEnd;
  final double opacidadBegin;
  final double opacidadEnd;

  const ScaleChange(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 600),
      this.delay = const Duration(milliseconds: 0),
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.aniBegin = 0.0,
      this.aniEnd = 1.0,
      this.opacidadBegin = 0.0,
      this.opacidadEnd = 1.0})
      : super(key: key);

  @override
  ScaleChangeState createState() => ScaleChangeState();
}

/// State class, where the magic happens
class ScaleChangeState extends State<ScaleChange>
    with SingleTickerProviderStateMixin {
  bool disposed = false;
  late Animation<double> animation;

  late AnimationController controller;
  late Animation<double> opacidad;

  @override
  void dispose() {
    disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    opacidad = Tween(begin: widget.opacidadBegin, end: widget.opacidadEnd)
        .animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 1, curve: Curves.easeInOut)));

    animation = Tween(begin: widget.aniBegin, end: widget.aniEnd)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        if (!disposed) {
          controller.forward();
        }
      });
    }

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate && widget.delay.inMilliseconds == 0) {
      controller.forward();
    }

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: opacidad.value,
            child: Transform.scale(
              scale: animation.value,
              child: widget.child,
            ),
          );
        });
  }
}
