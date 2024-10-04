import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/model/product/get_product_model.dart';
import 'package:ideasoft_test_case/product/constant/cons_color.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';
import 'package:ideasoft_test_case/product/model/expansion_model.dart';
import 'package:ideasoft_test_case/product/model/suggestion_list_item.dart';
import 'package:ideasoft_test_case/product/widget/bottom_bar.dart';
import 'package:ideasoft_test_case/product/widget/complex/custom_appbar.dart';
import 'package:ideasoft_test_case/product/widget/custom_button.dart';
import 'package:ideasoft_test_case/product/widget/expandable_list.dart';
import 'package:ideasoft_test_case/product/widget/footer.dart';
import 'package:ideasoft_test_case/product/widget/news.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';
import 'package:ideasoft_test_case/provider/all_provider.dart';

class ProductDetailView extends ConsumerStatefulWidget {
  const ProductDetailView({super.key, required this.item});
  final ProductModel item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends ConsumerState<ProductDetailView> {
  List<int> dropBoxItems = [1,2,3,4,5,6,7,8,9,10];
  late int _selectedDropBoxItem;
  
  @override
  void initState() {
    for(Images item in (widget.item.images ?? []))
    {
      if((item.originalUrl ?? "").isNotEmpty)
      {
        currentImage = item.originalUrl!;
        break;
      }
    }
    _selectedDropBoxItem = dropBoxItems.first;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConsColor.background,
      appBar: CustomAppbar(context, ref.watch(productList)),
      body: ListView(
        children: [
          _detail(),
          const News(),
          const BottomBar(),
          const Footer()
        ],
      ),
    );
}


  

  String currentImage = "";
  _detail()
  {
    return Column(
      children: [
        _imageShowcase(currentImage),
        _imageGaleryView(),
        _itemInfo()
      ],
    );
  }

  _imageShowcase(String url)
  {
    List<ProductModel> favoriteList =  ref.watch(favoriteProvider).toList();
    List<ProductModel> favoriteList2= favoriteList.where((e)=> e.id == widget.item.id).toList();
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.height*.8,
        maxWidth: context.width
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(aspectRatio: 1.2,
            child: Image.network("http:$url"),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: (){
                if(favoriteList.where((e)=> e.id == widget.item.id).toList().isEmpty)
                {
                  ref.read(favoriteProvider.notifier).add(widget.item);
                }
                else
                {
                  ref.read(favoriteProvider.notifier).remove(widget.item);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  
                  border: Border.all(width: .6,color: Colors.grey,)
                ),
                padding: ConsPadding.allMid(),
                child: Center(child: Icon(favoriteList2.isEmpty 
                ? IconEnums.favorite.icon 
                : IconEnums.favoriteFull.icon, 
                color: favoriteList2.isEmpty 
                ? Colors.grey 
                : Colors.red,
                size: 16.0,
                ),),
              ),
            ))
        ],
      ),
    );
  }

  _imageGaleryView()
  {
    return ConstrainedBox(constraints: BoxConstraints(
      maxHeight: context.height*.25,
      maxWidth: context.width, 
    ),
    child: Column(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate((widget.item.images ?? []).length, (index)=> _imageGaleryItem(widget.item.images?[index].originalUrl ?? "")),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate((widget.item.images ?? []).length, (index)=> _imageGaleryDot(widget.item.images?[index].originalUrl ?? "")),
        )
      ],
    ),
    
    );
  }

  _imageGaleryItem(String url)
  {
    return InkWell(
      onTap: ()
      {
        setState(() {
          currentImage = url;
        });
      },
      child: Padding(
        
        padding: ConsPadding.allMid(),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(
            width: .8,
            color: url == currentImage ? ConsColor.black : Colors.transparent
          )),
          child: AspectRatio(aspectRatio: .8,
            child: Image.network("http:$url"),
          ),
        ),
      ),
    );
  }

  _imageGaleryDot(String url)
  {
    return Padding(
      padding: ConsPadding.vMidhMin(),
      child: Icon(IconEnums.dot.icon, color: url == currentImage ? ConsColor.purple : ConsColor.grey, size: 16.0,),
    );
  }

  _itemInfo()
  {
    return Padding(
      padding: ConsPadding.subPagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: ConsPadding.verticalMid(),
            child: TextHeadlineMedium(text:widget.item.fullName ?? widget.item.name ?? "",),
          ),
      
          Padding(
            padding: ConsPadding.verticalMid(),
            child: TextHeadlineMedium(text:"${(widget.item.price1 ?? widget.item.buyingPrice  ?? 0).toStringAsFixed(2)} TL"),
          ),
      
          _itemSubTitle(title: "Stok Kodu", value: widget.item.sku ?? ""),
          _itemSubTitle(title: "Garanti Süresi", value: widget.item.warranty != null ? "${widget.item.warranty.toString()} Ay" : "-"),
          _itemSubTitle(title: "Fiyat", value: "${widget.item.stockAmount.toString()} ${widget.item.currency?.label} + KDV"),
          SizedBox(height: ConsSize.mid,),
          _dropBox(),
          _addChart(),
          _expansionList(),
          
        ],
      ),
    );
  }

  _itemSubTitle({required String title, required String value})
  {
    return Row(
      children: [
        Expanded(child: TextBodyMedium(text:title, color:Colors.black45),)
        ,const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(":", style: TextStyle(color: Colors.black45),),
        ),
        Expanded(flex:3, child: TextBodyMedium(text:value.toString(), color:Colors.black45),)

      ],
    );
  }

  
  _dropBox()
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: ConsColor.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: .5, color: ConsColor.grey)
        ),
        child: DropdownButton<int>(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          underline: const SizedBox(),
          isExpanded: true,
          value: _selectedDropBoxItem,
          items: List.generate(dropBoxItems.length,
           (index) => DropdownMenuItem(value: dropBoxItems[index],child: TextTitleLarge(text: dropBoxItems[index].toString()),)
           ), onChanged: (val){
            if(val != null)
            {
            _selectedDropBoxItem = val;
            setState(() {
              
            });
            }
           }),
      ),
    );
  }

  _addChart()
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: context.width,
        height: 50,
        child: CustomButton(text: "SEPETE EKLE", callback: (){}, icon: IconEnums.basket.icon, color: ConsColor.black, itemColor: ConsColor.white, iconIsRight: false,)),
    );
  }

_expansionList()
{
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Column(
      children: [
        DetailExpandableList(list: [
        ExpansionItem(title: ConsString.urunBilgisi, child: [Container(height: 20, color: Colors.white,)], index: 0),
        ExpansionItem(title: ConsString.yorumlar,  child: [_commentsSubItems()], index: 1),
        ExpansionItem(title: ConsString.taksitSecenekleri,  child: [_installmentSubItems()], index: 2),
        ExpansionItem(title: ConsString.onerileriniz, child: [_suggestionSubItems()], index: 3)
        ])
       ],
    ),
  );
}

_pushButton()
{
  return CustomButton(text: ConsString.gonder, callback: (){}, color: ConsColor.purple, itemColor: ConsColor.white,);
}
_commentsSubItems()
{
  return Container(
    color: Colors.white,
    width: context.width,
    height: 100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextBodyLarge(text: ConsString.ilkYorum),
        CustomButton(text: ConsString.yorumYaz, callback: (){}, color: ConsColor.purple, itemColor: ConsColor.white,)
      ],
    ),
  );
}

_installmentSubItems()
{
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: context.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
        
        border: Border.all(width: .6, color: ConsColor.grey)),
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(IconEnums.installment.icon, size: 50.0,),
            TextBodyLarge(text: ConsString.taksitSecenegiBulunamadi)
          ],
        ),
      ),
    ),
  );
}

static final List<SuggestionListItem> _dummySuggestionList = [
SuggestionListItem(title: ConsString.urunResmiBozuk),
SuggestionListItem(title: ConsString.urunAciklamasiEksik),
SuggestionListItem(title: ConsString.urunBilgilerindeHata),
SuggestionListItem(title: ConsString.urunFiyati),
SuggestionListItem(title: ConsString.urunAlternatif),

];
_suggestionSubItems()
{
  return Container(
    width: context.width,
    color: ConsColor.white,
    child: Padding(
      padding: ConsPadding.allMid(),
      child: Column(
        children: [
          Padding(
            padding: ConsPadding.verticalMid(),
            child: TextBodyLarge(text: ConsString.urunOneri,
            
            ),
          ),
          Column(
            children: List.generate(_dummySuggestionList.length, (index)=> _suggestionListItem(_dummySuggestionList[index])),
          ),
          _pushButton()

        ],
      ),
    ),
  );
} 
_suggestionListItem(SuggestionListItem item)
{
  return InkWell(
    onTap: (){
        setState(() {
          item.isDone = !item.isDone;
        });
      },
    child: Padding(
      padding: ConsPadding.verticalMin(),
      child: Row(
        children: [
          Icon(item.isDone ? IconEnums.circleDone.icon : IconEnums.circle.icon, color: ConsColor.grey, size: 24.0,),
          SizedBox(width: ConsSize.min,),
          Expanded(child: TextBodyLarge(text:item.title, color: Colors.black54))
        ],
      ),
    ),
  );
}
  


}



