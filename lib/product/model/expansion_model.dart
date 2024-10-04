import 'package:flutter/material.dart';

class ExpansionItem
{
  final String title;
  final List<Widget> child;
  final int index;

  const ExpansionItem({required this.title,  required this.child, required this.index});
}