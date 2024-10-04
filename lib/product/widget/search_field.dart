

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/model/product/get_product_model.dart';
import 'package:ideasoft_test_case/product/constant/cons_string.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';
import 'package:ideasoft_test_case/view/task_2/product/product_detail/product_detail_view.dart';
import 'package:searchfield/searchfield.dart';

class SearchFieldSample extends ConsumerStatefulWidget {
  const SearchFieldSample( this.products,{ super.key});
  final List<ProductModel> products;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchFieldSampleState();
}

class _SearchFieldSampleState extends ConsumerState<SearchFieldSample> {


  late List<ProductModel> filterProductList;
  int suggestionsCount = 3;
  final focus = FocusNode();

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    filterProductList = widget.products;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    Widget searchChild(ProductModel item) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListTile(
            leading: (item.images ?? []).isNotEmpty ? AspectRatio(aspectRatio: 1.2, child: Image.network("http:${item.images!.first.thumbUrl ?? ""}")) : Icon(Icons.image),
            title: Text(item.name ?? ""),
          )
        );
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchField<ProductModel>(
                  onSearchTextChanged: (val){setState(() {
                    filterProductList = widget.products.where((e)=> (e.name ?? e.fullName ?? "") .contains(val)).toList();
                  });},
                  maxSuggestionsInViewPort: 3,
                  itemHeight: 65,
                  suggestionAction: SuggestionAction.unfocus,
                  searchInputDecoration: SearchInputDecoration(
                    hintText: ConsString.searchHint,
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                    prefixIcon: Icon(IconEnums.search.icon, size: 16.0,),
                    cursorColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSuggestionTap: (SearchFieldListItem<ProductModel> item) {
                    if(item.item != null)
                    {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailView(item: item.item!)));
                      searchController.clear();
                    }
                    
                  },
                  suggestions: filterProductList
                      .map(
                        (e) => SearchFieldListItem<ProductModel>(e.name ?? "",
                            item: e,
                            child: searchChild(e)),
                      )
                      .toList(),
                ),
              )
             ;
  }
}