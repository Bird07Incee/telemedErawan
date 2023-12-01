import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Page page({dynamic params}) {
    return NoTransitionPage(child: this);
  }

  Page blank() {
    return NoTransitionPage(child: this);
  }
}
