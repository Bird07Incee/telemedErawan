import 'dart:io';

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class BuilderPage extends StatefulWidget {
  final Widget child;

  const BuilderPage({super.key, required this.child});

  @override
  State<BuilderPage> createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  @override
  Widget build(BuildContext context) {
    return _builderPage();
  }

  Widget _builderPage() {
    if (Platform.isAndroid) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.ebony,
          body: FakeDevicePixelRatio(child: widget.child),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.ebony,
        body: SafeArea(child: widget.child),
      );
    }
  }
}

class FakeDevicePixelRatio extends StatelessWidget {
  final Widget child;

  const FakeDevicePixelRatio({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final widthPixel = View.of(context).physicalSize.width;
    final windowRatio = View.of(context).devicePixelRatio;

    double fakeRatio = windowRatio;
    if (widthPixel <= 1080) {
      fakeRatio = windowRatio >= 3 ? 3 : windowRatio;
    }

    final ratio = fakeRatio / windowRatio;
    if (windowRatio < 3) {
      return child;
    }

    return FractionallySizedBox(
      widthFactor: 1 / ratio,
      heightFactor: 1 / ratio,
      child: Transform.scale(scale: ratio, child: child),
    );
  }
}