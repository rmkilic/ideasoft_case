import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/product/constant/cons_color.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/widget/text/text_title_large.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.text, this.icon, this.color= ConsColor.background, this.itemColor = ConsColor.black, required this.callback, this.iconIsRight = true});
  final String text;
  final IconData ?icon;
  //iconIsRight -> 2 değer alabilir Metnin sağında veya solunda olmasına karar verebiliriz
  final bool iconIsRight;
  final Color color;
  final Color itemColor;
  final VoidCallback callback;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.callback,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.color,
                shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
              ), 
    child: Padding(
      padding: ConsPadding.verticalMid(),
      child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.icon != null && !widget.iconIsRight ?
                    Icon(widget.icon, color: widget.itemColor,)
                    : Container(),
                    SizedBox(width:widget.icon != null && !widget.iconIsRight ? 10 : 0),
      
                    TextTitleLarge(text: widget.text, color: widget.itemColor,),
                    SizedBox(width:widget.icon != null && widget.iconIsRight ? 10 : 0),
                    widget.icon != null && widget.iconIsRight ?
                    Icon(widget.icon, color: widget.itemColor,)
                    : Container()
                  ],
                ),
    ),
              );
  }
}