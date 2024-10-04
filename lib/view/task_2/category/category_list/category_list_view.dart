import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/model/category/get_category_model.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';
import 'package:ideasoft_test_case/product/widget/loading_widget.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';
import 'package:ideasoft_test_case/provider/all_provider.dart';
import 'package:ideasoft_test_case/view/task_2/category/category_list/category_list_business.dart';

class CategoryListView extends ConsumerStatefulWidget {
  const CategoryListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryListViewState();
}



class _CategoryListViewState extends CategoryListBusiness {

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
        title: Text(ConsString.silmekIcinKaydirin),
      );
  }

  Widget get _body
  {
    List<CategoryModel> _categoryList = ref.watch(categoryList);
    return ListView.builder(
      itemCount: _categoryList.length + 1,
      itemBuilder: (context, index) => 
      index == 0 
      ? newItem()
      : categoryItem(_categoryList[index -1],index)
      );
  }

  newItem()
  {
  return Padding(
    padding: ConsPadding.allMid(),
    child: InkWell(
      onTap: onTapNewItem,
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ConsColor.purple,
          border: Border.all(
            width: .6, color: Colors.black54
          )
        ),
        child: ListTile(
          
            leading: SizedBox(
              height: 80,
              child: AspectRatio(aspectRatio: 1.2,
              child:  Icon(IconEnums.add.icon, color: ConsColor.white,),
              ),
            ),
            title: TextTitleLarge(text: ConsString.yeniKategori, color: ConsColor.white,),
            
          
          )
      ),
    ),
  );
}

  categoryItem(CategoryModel item, int index)
  {
    return Padding(
      padding: ConsPadding.allMid(),
      child: InkWell(
        onTap: (){
          onTapCategoryButton(item);
        },
        child: Container(
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: .6, color: Colors.black54
            )
          ),
          child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) async{  
              await onDismissed(direction, item).then((val)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(val == "OK" ? ConsString.kategoriSilindi: ConsString.kategoriSilinemedi ),
                ),
              );
              });
              },
            background: Container(
              color: Colors.red,
              child:  Padding(
                padding: ConsPadding.horizontalSubPagePadding(context),
                child:  Align(
                  alignment: Alignment.centerRight,
                  child:  Icon(IconEnums.delete.icon, color: ConsColor.white, size: 30.0,)),
              ),
            ),
            child: ListTile(
              leading: SizedBox(
                height: 80,
                child: AspectRatio(aspectRatio: 1.2,
                child: item.imageUrl != null ? Image.network("http:${item.imageUrl}") : Icon(IconEnums.photo.icon),
                ),
              ),
              title: TextTitleLarge(text: item.name ?? ""),
              subtitle: TextBodyMedium(text: item.slug ?? ""),
            
            ),
          ),
        ),
      ),
    );
  }
}