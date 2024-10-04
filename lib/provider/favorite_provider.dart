import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/model/product/get_product_model.dart';


class FavoriteProvider extends StateNotifier<List<ProductModel>> {
  FavoriteProvider([List<ProductModel>? initial]) : super(initial ?? []);

  void add(ProductModel item) {
   
    state = [...state, item];
  }



  void remove(ProductModel item) {
    state = state.where((element) => element.id != item.id).toList();
  }

}