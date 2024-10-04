import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/provider/all_provider.dart';
import 'package:ideasoft_test_case/service/category_service.dart';
import 'package:ideasoft_test_case/service/product_service.dart';
import 'package:ideasoft_test_case/view/login/login_view.dart';

abstract class LoginBusiness extends ConsumerState<LoginView>{


  Future<void> onTapTask1()async
  {
      ref.read(productList.notifier).state = await ProductService().getList();
      ref.read(categoryList.notifier).state = await CategoryService().getList();
   
  }

 Future<void> onTapTask2()async
  {
      ref.read(productList.notifier).state = await ProductService().getList();
      ref.read(categoryList.notifier).state = await CategoryService().getList();
  }
}