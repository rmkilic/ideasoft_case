import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/model/category/get_category_model.dart';
import 'package:ideasoft_test_case/model/product/get_product_model.dart';
import 'package:ideasoft_test_case/provider/favorite_provider.dart';



final productList = StateProvider<List<ProductModel>>((ref) => []);
final categoryList = StateProvider<List<CategoryModel>>((ref) => []);


final expandableProductDetail = StateProvider<int?>((ref) => null);

final expandableBottomBar = StateProvider<int?>((ref) => null);


final favoriteProvider = StateNotifierProvider<FavoriteProvider, List<ProductModel>>((ref) => FavoriteProvider());