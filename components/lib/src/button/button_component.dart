import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final bool enabled;
  final double? rippleRadius;
  final Color? overlayColor;
  final BoxDecoration? decoration;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final ValueChanged<TapDownDetails>? onTapDown;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;
  final Widget child;

  const ButtonComponent({
    super.key,
    this.enabled = true,
    this.onTap,
    this.onDoubleTap,
    this.onTapDown,
    this.onLongPress,
    this.decoration,
    this.rippleRadius,
    this.overlayColor,
    this.onHover,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final radius = rippleRadius ?? AppSize.radius4;
    return Material(
      type: MaterialType.transparency,
      color: decoration?.color ?? Colors.white,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: enabled ? onTap : null,
        onTapDown: enabled ? onTapDown : null,
        onHover: enabled ? onHover : null,
        onLongPress: enabled ? onLongPress : null,
        onDoubleTap: enabled ? onDoubleTap : null,
        radius: radius,
        borderRadius: BorderRadius.circular(radius),
        overlayColor: MaterialStateProperty.all(overlayColor),
        child: DecoratedBox(
          decoration: decoration ?? _boxDecoration(),
          child: child,
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return decoration?.copyWith(color: Colors.transparent) ??
        BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(AppSize.radius4),
        );
  }
}
