import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/enum/image_enums.dart';
import 'package:ideasoft_test_case/product/widget/email_field.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConsColor.black,
      child: Padding(
        padding: ConsPadding.subPagePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextHeadlineLarge(text: ConsString.haberler, color: ConsColor.white,),            
            Padding(
              padding: ConsPadding.verticalMid(),
              child: const EmailField(),
            ),
            Padding(
              padding: ConsPadding.verticalMid(),
              child: AspectRatio(aspectRatio: 1,
              child: Image.asset(ImageEnums.news.toPath),),
            )
          ],
        ),
      ),
    );
  }
}