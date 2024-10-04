import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';
import 'package:ideasoft_test_case/product/enum/image_enums.dart';
import 'package:ideasoft_test_case/product/widget/custom_button.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';

class BottomBanner extends StatefulWidget {
  const BottomBanner({super.key});

  @override
  State<BottomBanner> createState() => _BottomBannerState();
}

class _BottomBannerState extends State<BottomBanner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConsPadding.verticalMid(),
      child: Column(
        children: [
          AspectRatio(aspectRatio: 3.7,
          child: Image.asset(ImageEnums.bannerExtended.toPath),
          ),
          Padding(
            padding: ConsPadding.subPagePadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: ConsPadding.verticalMid(),
                  child: TextHeadlineLarge(text: ConsString.hareketeGecmeZamani)
                ),
                CustomButton(text: ConsString.alisveriseBasla, callback: (){}, icon: IconEnums.right.icon,)
              ],
            ),
          )
        ],
      ),
    );
  }
}