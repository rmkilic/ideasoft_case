import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/widget/custom_button.dart';
import 'package:ideasoft_test_case/view/task_1/home/home_view.dart';
import 'package:ideasoft_test_case/view/login/login_business.dart';
import 'package:ideasoft_test_case/view/task_2/admin_menu/admin_menu_view.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends LoginBusiness {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: _body,
    );
  }

  AppBar get _appbar
  {
    return AppBar(title: Text(ConsString.gorevSecimi),);
  }

  Widget get _body
  {
    return SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(text: ConsString.gorev1, callback: ()async{await onTapTask1().then((value)
            {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeView()));

            });}, color: ConsColor.purple, itemColor: ConsColor.white,),
            SizedBox(height: ConsSize.mid,),
            CustomButton(text: ConsString.gorev2, callback:()async{await onTapTask2().then((val)
            {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminMenuView()));

            });} , color: ConsColor.black, itemColor: ConsColor.white,)     
          ],
        ),
      );
  }
}