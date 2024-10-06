import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer(
      {super.key,
      required this.widget,
      required this.height,
      required this.width});
  final Widget? widget;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25,
            ),
            color: Theme.of(context).colorScheme.tertiary.withOpacity(
                  0.3,
                ),
          ),
          child: Center(child: widget),
        ),
      ),
    );
  }
}
