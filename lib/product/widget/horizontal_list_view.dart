import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/product/constant/cons_color.dart';
import 'package:ideasoft_test_case/product/constant/cons_padding.dart';
import 'package:ideasoft_test_case/product/constant/cons_string.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';
import 'package:ideasoft_test_case/product/enum/image_enums.dart';
import 'package:ideasoft_test_case/product/widget/custom_button.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';

class HorizontalListView extends StatefulWidget {
  const HorizontalListView({super.key});

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: context.width,
      color: ConsColor.black,
      padding: ConsPadding.subPagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeadlineLarge(text: ConsString.oyununKurallariniBelirle, color: ConsColor.white, ),
          
          Padding(
            padding: ConsPadding.verticalMid(),
            child: CustomButton(text: ConsString.alisveriseBasla, callback: (){}, icon: IconEnums.right.icon,),
          ),
          Expanded(child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyListItems.length, itemBuilder: (context, index) => item(dummyListItems[index])))
        ],
      ),
    );
  }

  item(String itemPath)
  {
    return Padding(
      padding: const EdgeInsets.only(right:15.0),
      child: AspectRatio(aspectRatio: 1.3,
        child: Image.asset(itemPath)
      ),
    );
  }

  List<String> dummyListItems = [
    ImageEnums.banner_1.toPath,
    ImageEnums.banner_2.toPath,
    ImageEnums.banner_3.toPath,
  ];
}