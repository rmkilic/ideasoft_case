import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/product/constant/cons_color.dart';
import 'package:ideasoft_test_case/product/constant/cons_padding.dart';
import 'package:ideasoft_test_case/product/constant/cons_string.dart';
import 'package:ideasoft_test_case/product/enum/image_enums.dart';
import 'package:ideasoft_test_case/product/model/category_item_model.dart';
import 'package:ideasoft_test_case/product/widget/custom_button.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {
   Categories({super.key});
  List<CategoryItemModel> dummyItemList = [
    CategoryItemModel(imagePath: ImageEnums.category_1.toPath, buttonText: ConsString.kadin),
    CategoryItemModel(imagePath: ImageEnums.category_2.toPath, buttonText: ConsString.erkek),
    CategoryItemModel(imagePath: ImageEnums.category_3.toPath, buttonText: ConsString.cocuk),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(dummyItemList.length, (index)=>(categorie(context, dummyItemList[index]))),
    );
  }

  categorie(BuildContext context, CategoryItemModel item)
  {
    return Padding(
      padding: ConsPadding.subPagePadding(context),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          elevation: 10.0,
          child: Stack(
            children: [
            Positioned.fill (child: FittedBox(fit: BoxFit.fitHeight, child: Image.asset(item.imagePath))),
            Positioned(
              bottom: 10,
              left: 10,
              child: CustomButton(text: item.buttonText, callback: (){}, color: ConsColor.black, itemColor: ConsColor.white,))
            ],
          ),
        ),
      ),
    );
  }
}


