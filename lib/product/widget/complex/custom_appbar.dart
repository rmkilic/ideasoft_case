import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/model/product/get_product_model.dart';
import 'package:ideasoft_test_case/product/constant/cons_color.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';
import 'package:ideasoft_test_case/product/enum/image_enums.dart';
import 'package:ideasoft_test_case/product/widget/search_field.dart';
import 'package:ideasoft_test_case/view/login/login_view.dart';


class CustomAppbar extends AppBar {
  final BuildContext context; 
  final List<ProductModel> products;
  CustomAppbar(this.context, this.products ,{super.key}):super(
    
    backgroundColor: ConsColor.background,
      leadingWidth: 80,
      leading: _leading,
      actions: _actions(context),
      bottom: PreferredSize(preferredSize: Size(context.width, 60), child:  SearchFieldSample( products,),),
    
  );

  static Padding get _leading {
    return Padding(
      padding: const EdgeInsets.only(left:10.0),
      child: InkWell(
      onTap: (){
      },
      child: Image.asset(ImageEnums.logo.toPath),
        ),
    );
  }



  static List<Widget>  _actions(BuildContext context)
  {
    return [
        _actionIcon(context, IconEnums.profile.icon),
        _actionIcon(context, IconEnums.favorite.icon),
        _actionIcon(context, IconEnums.basket.icon, isStack: true),
      ];
  }
  
   static Widget _actionIcon(BuildContext context, IconData icon,{bool isStack = false, int value = 0, Color color = ConsColor.purple})
  {
    return InkWell(
      onTap: ()
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginView()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 25,
          width: 25,
          child: Stack(
            children: [
              Positioned.fill(child: Icon(icon, size: 20.0,)),
              Visibility(
                visible: isStack,
                child: Positioned(
                  top: 0,
                  right: 0,
                  child: SizedBox(
                    height: 14,
                    width: 14,
                    child: CircleAvatar(
                      backgroundColor: color,
                      child: Center(child: FittedBox(child: Text("$value", style: const TextStyle(color: ConsColor.white),))),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
}

