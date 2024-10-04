import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/product/constant/cons_color.dart';
import 'package:ideasoft_test_case/product/constant/cons_padding.dart';
import 'package:ideasoft_test_case/product/constant/cons_string.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextField(                
      decoration: InputDecoration(                
        fillColor: ConsColor.white,
        filled: true,                                  
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            ),
        contentPadding: ConsPadding.allMid(),
        hintText: ConsString.emailHint,
        suffixIcon: Container(
        decoration: const BoxDecoration(
        border: Border(
              left: BorderSide(width: .6, color: ConsColor.grey),
              top: BorderSide.none,
              right: BorderSide.none,
              bottom: BorderSide.none,
              ),
            ),
          child:IconButton(onPressed: (){}, icon: Icon(IconEnums.send.icon))
          )
        ),                       
      );
  }
}