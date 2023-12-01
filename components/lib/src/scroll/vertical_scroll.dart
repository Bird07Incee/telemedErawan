import 'package:components/src/scroll/base_scrollbar_component.dart';
import 'package:flutter/material.dart';

class VerticalScroll extends StatelessWidget {
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  final Widget child;
  final bool thumbVisibility;
  final bool trackVisibility;
  final EdgeInsetsGeometry? paddingScrollBar;

  const VerticalScroll({
    Key? key,
    this.physics,
    this.scrollController,
    this.thumbVisibility = false,
    this.trackVisibility = false,
    this.paddingScrollBar,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scroll = ScrollController();
    return BaseScrollBarComponent(
      controller: scrollController ?? scroll,
      trackVisibility: trackVisibility,
      thumbVisibility: thumbVisibility,
      paddingScrollBar: paddingScrollBar,
      child: SingleChildScrollView(
        controller: scrollController ?? scroll,
        physics: physics ?? const BouncingScrollPhysics(),
        child: child,
      ),
    );
  }
}
