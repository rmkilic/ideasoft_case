import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/model/category/get_category_model.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';
import 'package:ideasoft_test_case/product/widget/custom_button.dart';
import 'package:ideasoft_test_case/product/widget/loading_widget.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';
import 'package:ideasoft_test_case/view/task_2/category/category_edit/category_edit_business.dart';

class CategoryEditView extends ConsumerStatefulWidget {
  const CategoryEditView({super.key, required this.item});
  final CategoryModel item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryEditViewState();
}



class _CategoryEditViewState extends CategoryEditBusiness {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: isLoading 
      ? const LoadingWidget() 
      : _body 
      );
  }

  AppBar get _appbar
  {
    return AppBar(
        title: Text("${ConsString.kategoriAdi} ${widget.item.id == 0 ? ConsString.eklenebilir : ConsString.guncellenebilir}"),
      );
  }

  Widget get _body
  {
    return Padding(
        padding: ConsPadding.horizontalSubPagePadding(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image,
            _textField,
            _categorySlug,
            _button
          ],
        ),
      );
    
  }

  Widget get _image
  {
    return SizedBox(
        height: 300,
        width: context.width,
        child: AspectRatio(aspectRatio: 1.2,
        child: item.imageUrl == null 
        ? Icon(IconEnums.photo.icon) 
        : Image.network("http:${item.imageUrl}"),
        ),
      );
  }

  Widget get _textField
  {
    return TextField(              
              controller: controller,              
    );
  }

  Widget get _categorySlug
  {
    return  TextTitleLarge(text: item.slug ?? "");
  }

  Widget get _button
  {
    return Center(
              child: CustomButton(text: widget.item.id == 0 ? ConsString.ekle : ConsString.guncelle, 
              color: ConsColor.purple, 
              itemColor: Colors.white, 
              callback: ()async
              {
                await onTapButton().then((value)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        value == "OK"
                         ? widget.item.id == 0
                          ? ConsString.kategoriEklendi
                          : ConsString.kategoriGuncellendi
                         : value ?? ConsString.basarisiz
                    ),),
                  );
                });
              } ),
            );
  }
}