import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';

class TextBodyLarge extends StatelessWidget {
  const TextBodyLarge({super.key, required this.text, this.fontWeight, this.color});
  final String text;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: context.textTheme.bodyLarge!.copyWith(fontWeight: fontWeight, color: color),
    );
  }
}