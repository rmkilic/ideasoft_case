import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/widget/custom_button.dart';
import 'package:ideasoft_test_case/view/task_2/admin_menu/admin_menu_business.dart';

class AdminMenuView extends StatefulWidget {
  const AdminMenuView({super.key});

  @override
  State<AdminMenuView> createState() => _AdminMenuViewState();
}

class _AdminMenuViewState extends AdminMenuBusiness {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: _body,
    );
  }

  AppBar get _appbar
  {
    return AppBar(
        title: Text(ConsString.adminApi),
      );
  }

  Widget get _body
  {
    return Column(
        children: [
          _urunButton,
          _categoryButton,
      
        ],
      );
  }

  Widget get _urunButton
  {
    return Expanded(
      child: Padding(
        padding: ConsPadding.allMid(),
        child: SizedBox(
          width: context.width,          
          child: CustomButton(
            text: ConsString.urunSayfasi,
            color: ConsColor.purple, 
            itemColor: Colors.white, 
            callback: onTapProductButton
            )),
      ),
    );
  }

  Widget get _categoryButton
  {
    return Expanded(child: Padding(
        padding: ConsPadding.allMid(),
        child: SizedBox(
            width: context.width,
            child: CustomButton(
              text: ConsString.kategoriSayfasi, 
              color: ConsColor.black, 
              itemColor: Colors.white, 
              callback: onTapCategoryButton
              )),
    ));
  }
}