import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/model/product/get_product_model.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/widget/loading_widget.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';
import 'package:ideasoft_test_case/provider/all_provider.dart';
import 'package:ideasoft_test_case/service/product_service.dart';
import 'package:ideasoft_test_case/view/task_2/product/product_edit/product_edit_detail/product_edit_detail.dart';

class ProductListView extends ConsumerStatefulWidget {
  const ProductListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductListViewState();
}

class _ProductListViewState extends ConsumerState<ProductListView> {


  bool isLoading = false;

  changeLoading(bool value)
  {
    setState(() {
      isLoading = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: isLoading 
      ? const LoadingWidget()
      : _body
    );
  }

  AppBar get _appbar
  {
    return AppBar(
        title: Text(ConsString.silmekIcinKaydirin),
      );
  }

  Widget get _body
  {
    List<ProductModel> _productList = ref.watch(productList);

    return ListView.builder(
      itemCount: _productList.length,
      itemBuilder: (context, index) => productItem(_productList[index])
      );
  }

  productItem(ProductModel item)
  {
    return Padding(
      padding: ConsPadding.allMid(),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductEditDetail(item: item)));
        },
        child: Container(
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: .6, color: Colors.black54
            )
          ),
          child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction)
            async{
                changeLoading(true);
                await ProductService().deleteItem(item.id!).then((val)async{
                  if(val == "OK")
                  {
                    ref.read(productList.notifier).state = await ProductService().getList();
                    
                  }
                changeLoading(false);
        
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(val == "OK" ?'Ürün Silindi' : "Ürün Silinemedi"),
                    ),
                  );
                  
                });
                
        
            
               
                
              },
            background: Container(
              color: Colors.red,
              child: const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.0),
                child:  Align(
                  alignment: Alignment.centerRight,
                  child:  Icon(Icons.delete_sweep_outlined, color: Colors.white, size: 30.0,)),
              ),
            ),
            child: ListTile(
              leading: SizedBox(
                height: 80,
                child: AspectRatio(aspectRatio: 1.2,
                child: item.images?.first.originalUrl != null ? Image.network("http:${item.images!.first.originalUrl}") : Icon(Icons.photo),
                ),
              ),
              title: TextTitleLarge(text: item.name ?? item.fullName ?? ""),
              subtitle: TextBodyMedium(text: item.sku ?? item.barcode ?? ""),
              trailing: TextHeadlineLarge(text: (item.price1 ?? 0).toStringAsFixed(2)),
            ),
          ),
        ),
      ),
    );
  }
}