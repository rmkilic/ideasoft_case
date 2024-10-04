import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/model/category/get_category_model.dart';
import 'package:ideasoft_test_case/provider/all_provider.dart';
import 'package:ideasoft_test_case/service/category_service.dart';
import 'package:ideasoft_test_case/view/task_2/category/category_edit/category_edit_view.dart';

abstract class CategoryEditBusiness extends ConsumerState<CategoryEditView>{

  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  late CategoryModel item;
  changeLoadingState(bool value)
  {
    setState(() {
      isLoading = value;
    });
  }
  @override
  void initState() {
    controller.text = widget.item.name ?? "";
    item = widget.item;
    super.initState();
  }

  Future<String?> onTapButton()async{
    String? retVal ;
      changeLoadingState(true);
      item.name = controller.text;
      if(widget.item.id == 0)
      {
        await CategoryService().postItem(item).then(
        (value)
        {
          retVal = value;
          
        }
      );
      }
      else
      {
        await CategoryService().putItem(item).then(
        (value)
        {
          retVal = value;

          
        }
      );
      }
      ref.read(categoryList.notifier).state = await CategoryService().getList();

    
      
      changeLoadingState(false);
      return retVal;
                      
    }

}