
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';
import 'package:ideasoft_test_case/product/model/expansion_model.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';
import 'package:ideasoft_test_case/provider/all_provider.dart';

class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({super.key});
  

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {


    _subTitleItem({required String text})
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(onTap:  (){},child: TextBodyMedium(text: text,),)),
    );
  }

late List<ExpansionItem> dummyExpansionModel;
@override
  void initState() {
   dummyExpansionModel = [
    ExpansionItem(title: ConsString.kurumsal, child: 
    [      
         _subTitleItem(text: ConsString.hakkimizda),
         _subTitleItem(text: ConsString.magazalar),
         _subTitleItem(text: ConsString.iletisim),
    ], index: 0),
     ExpansionItem(title: ConsString.yardim, child: 
    [
         _subTitleItem(text: ConsString.yardimMerkezi),
         _subTitleItem(text: ConsString.sss),
         _subTitleItem(text: ConsString.siparis),
    ], index: 1),

     ExpansionItem(title: ConsString.alisveris, child: 
    [
         _subTitleItem(text: ConsString.mss),
         _subTitleItem(text: ConsString.gizlilikGuvenlik),
         _subTitleItem(text: ConsString.iptalIade),
         _subTitleItem(text: ConsString.kvp),
    ], index: 2),

     ExpansionItem(title: ConsString.bilgi, child: 
    [
         _subTitleItem(text: ConsString.blog),
         _subTitleItem(text: ConsString.kargoTakip),
         _subTitleItem(text: ConsString.iletisimFormu),
         _subTitleItem(text: ConsString.siparisSorgula),
    ], index: 3),

     ExpansionItem(title: ConsString.uyelik, child: 
    [
         _subTitleItem(text: ConsString.yeniUyelik),
         _subTitleItem(text: ConsString.uyeGirisi),
         _subTitleItem(text: ConsString.sifremiUnuttum),
    ], index: 4),
   ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(dummyExpansionModel.length, (index) => _expansionItem(dummyExpansionModel[index]))
    );
  }

    _expansionItem(ExpansionItem item)
  {
    int? expandedIndex = ref.watch(expandableBottomBar);
    return Padding(
      padding: ConsPadding.horizontalSubPagePadding(context),

      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: ConsPadding.subPagePadding(context),
        shape: const Border(),
              key: UniqueKey(),
              title: Container(
              padding: ConsPadding.allMid(),
              decoration: BoxDecoration(border: Border.all(width: .6, color: Colors.black54)),child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.title),
                Builder(
                  builder: (context) {
                    return Icon(expandedIndex == item.index   ? IconEnums.minus.icon : IconEnums.add.icon, size: 20.0,);
                  }
                )
              ],
            )),
            showTrailingIcon: false,
              initiallyExpanded: expandedIndex == item.index,
              onExpansionChanged: (isExpanded) {
                _toggleExpansion(item.index);
              },
              
              children: item.child,
            ),
    );
  }


void _toggleExpansion(int index) {
    int? expandedIndex = ref.watch(expandableBottomBar);
    
      ref.read(expandableBottomBar.notifier).state = index != expandedIndex ? index : null;
    
  }

}
