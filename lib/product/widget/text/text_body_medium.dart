import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';

class TextBodyMedium extends StatelessWidget {
  const TextBodyMedium({super.key, required this.text, this.fontWeight, this.color = Colors.black});
  final String text;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: context.textTheme.bodyMedium!.copyWith(fontWeight: fontWeight, color: color),
    );
  }
}