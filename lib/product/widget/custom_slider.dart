
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';
import 'package:ideasoft_test_case/product/enum/image_enums.dart';
import 'package:ideasoft_test_case/product/widget/custom_button.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';

class AnimatedSwitchers extends StatefulWidget {
  @override
  _AnimatedSwitchersState createState() => _AnimatedSwitchersState();
}

class _AnimatedSwitchersState extends State<AnimatedSwitchers> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 2;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            setState(() {
              _currentIndex = (_currentIndex + 1) % 2;
            });
          } else if (details.delta.dx < 0) {
            setState(() {
              _currentIndex = (_currentIndex - 1) % 2;
            });
          }
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: _currentIndex == 0 ? Widget1() : Widget2(),
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  const Widget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageEnums.slider_1.toPath),

        Expanded(
          child: Padding(
            padding: ConsPadding.allMid(),
            child: Align(
              alignment: Alignment.centerLeft ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  TextHeadlineLarge(text: ConsString.sliderBasligi, fontWeight: FontWeight.bold,),
                  TextTitleLarge(text: ConsString.sliderIcerigi, fontWeight: FontWeight.bold,),
                  CustomButton(text: ConsString.button, callback: () { 
      
                   }, icon: IconEnums.right.icon,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Widget2 extends StatelessWidget {
  const Widget2({super.key});

  @override
  Widget build(BuildContext context) {
  return Column(
      children: [
        Image.asset(ImageEnums.slider_1.toPath),

        Expanded(
          child: Padding(
            padding: ConsPadding.allMid(),
            child: Align(
              alignment:  Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment:  CrossAxisAlignment.end,
                children: [
                  TextHeadlineLarge(text: ConsString.sliderBasligi, fontWeight: FontWeight.bold,),
                  TextTitleLarge(text: ConsString.sliderIcerigi, fontWeight: FontWeight.bold,),
                  CustomButton(text: ConsString.button, callback: () { 
                 
                   }, icon: IconEnums.right.icon,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


