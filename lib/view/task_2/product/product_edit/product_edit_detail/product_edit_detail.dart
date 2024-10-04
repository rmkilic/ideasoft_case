import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/model/product/get_product_model.dart';
import 'package:ideasoft_test_case/product/constant/cons_color.dart';
import 'package:ideasoft_test_case/product/widget/custom_button.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';
import 'package:ideasoft_test_case/service/product_service.dart';

class ProductEditDetail extends StatefulWidget {
  const ProductEditDetail({super.key, required this.item});
  final ProductModel item;
  @override
  State<ProductEditDetail> createState() => _ProductEditDetailState();
}

class _ProductEditDetailState extends State<ProductEditDetail> {
  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  late ProductModel item;
  changeLoadingState(bool value)
  {
    setState(() {
      isLoading = value;
    });
  }
  @override
  void initState() {
    controller.text = widget.item.name ?? "";
    item = widget.item;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Adı Güncellenebilir"),
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator()) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: context.width,
              child: AspectRatio(aspectRatio: 1.2,
              child: Image.network("http:${item.images!.first.originalUrl}"),
              ),
            ),
            TextField(
              controller: controller,
              
            ),
            TextHeadlineMedium(text: (item.price1 ?? 0).toStringAsFixed(2)),
            TextTitleLarge(text: item.sku ?? ""),
            Center(
              child: CustomButton(text: "Güncelle", color: ConsColor.purple, itemColor: Colors.white, callback: ()async{
                changeLoadingState(true);
                item.name = controller.text;
                await ProductService().putItem(item).then(
                  (value)
                  {
                    if(value == "OK")
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Ürünün Adı Güncellendi"),
                      ),
                    );
                    }
                  }
                );
                changeLoadingState(false);
                      
              }),
            )
          ],
        ),
      ),
    );
  }
}