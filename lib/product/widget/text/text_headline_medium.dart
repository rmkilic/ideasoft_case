import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';

class TextHeadlineMedium extends StatelessWidget {
  const TextHeadlineMedium({super.key, required this.text, this.fontWeight});
  final String text;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: context.textTheme.headlineMedium!.copyWith(fontWeight: fontWeight),
    );
  }
}