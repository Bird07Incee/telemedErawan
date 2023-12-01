import 'dart:io';

import 'package:flutter/material.dart';

class BaseScrollBarComponent extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? paddingScrollBar;
  final ScrollController? controller;
  final bool thumbVisibility;
  final bool trackVisibility;

  const BaseScrollBarComponent({
    Key? key,
    required this.child,
    this.controller,
    this.paddingScrollBar,
    this.thumbVisibility = false,
    this.trackVisibility = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return MediaQuery(
        data: MediaQuery.of(context).removePadding(removeBottom: true),
        child: SafeArea(
          child: _boxScrollBar(),
        ),
      );
    }
    return _boxScrollBar();
  }

  Widget _boxScrollBar() {
    return Scrollbar(
      controller: controller,
      thumbVisibility: thumbVisibility,
      trackVisibility: trackVisibility,
      child: Container(
        color: Colors.transparent,
        margin: paddingScrollBar ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
