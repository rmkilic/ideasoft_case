import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/model/category/get_category_model.dart';
import 'package:ideasoft_test_case/provider/all_provider.dart';
import 'package:ideasoft_test_case/service/category_service.dart';
import 'package:ideasoft_test_case/view/task_2/category/category_edit/category_edit_view.dart';
import 'package:ideasoft_test_case/view/task_2/category/category_list/category_list_view.dart';

abstract class CategoryListBusiness extends ConsumerState<CategoryListView>{

  bool isLoading = false;

  changeLoading(bool value)
  {
    setState(() {
      isLoading = value;
    });
  }

  onTapNewItem() {
    List<CategoryModel> _categoryList = ref.watch(categoryList);

    CategoryModel newModel = _categoryList.first;
    newModel.id = 0;
    newModel.name = "";
    newModel.slug = "";
    newModel.createdAt = DateTime.now().toIso8601String();
    onTapCategoryButton(newModel);
  }

  onTapCategoryButton(CategoryModel item)
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CategoryEditView(item: item)));     
  }

  Future<String?> onDismissed(DismissDirection direction, CategoryModel item)async
  { 
    String? retVal;
    changeLoading(true);
    await CategoryService().deleteItem(item.id!).then((val)async{
      if(val == "OK")
      {
        ref.read(categoryList.notifier).state = await CategoryService().getList();
        
      }
      changeLoading(false);

      retVal = val;
      
    });
    return retVal;
  }




}