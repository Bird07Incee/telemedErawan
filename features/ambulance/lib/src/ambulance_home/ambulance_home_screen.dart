import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class AmbulanceHomeScreen extends StatefulWidget {
  const AmbulanceHomeScreen({super.key});

  @override
  State<AmbulanceHomeScreen> createState() => _AmbulanceHomeScreenState();
}

class _AmbulanceHomeScreenState extends State<AmbulanceHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _boxTextTest(),
      ],
    );
  }

  Widget _boxTextTest() {
    return Text(
      'Testing Home',
      style: NotoSansStyle.normal.copyWith(color: AppColors.white),
    );
  }
}
