import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/view/task_2/admin_menu/admin_menu_view.dart';
import 'package:ideasoft_test_case/view/task_2/category/category_list/category_list_view.dart';
import 'package:ideasoft_test_case/view/task_2/product/product_edit/product_list/product_list_view.dart';

abstract class AdminMenuBusiness extends State<AdminMenuView>{


  onTapProductButton()
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ProductListView()));
  }

  onTapCategoryButton()
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CategoryListView()));
  }
}