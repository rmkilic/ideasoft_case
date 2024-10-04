import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/product/constant/cons_color.dart';
import 'package:ideasoft_test_case/product/widget/custom_button.dart';
import 'package:ideasoft_test_case/view/task_2/category/category_list/category_list_view.dart';
import 'package:ideasoft_test_case/view/task_2/product/product_edit/product_list/product_list_view.dart';

class AdminMenu extends StatefulWidget {
  const AdminMenu({super.key});

  @override
  State<AdminMenu> createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Mode"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: context.width,
                
                child: CustomButton(text: "Ürün sayfası", color: ConsColor.purple, itemColor: Colors.white, callback: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ProductListView()));
              })),
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: context.width,
                child: CustomButton(text: "Kategori sayfası", color: ConsColor.black, itemColor: Colors.white, callback: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CategoryListView()));

                })),
          )),
      
        ],
      ),
    );
  }
}