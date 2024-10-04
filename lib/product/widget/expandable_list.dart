/* import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/product/model/expansion_model.dart';
import 'package:ideasoft_test_case/product/widget/bottom_bar.dart';

class DetailExpandableList extends StatefulWidget {
  const DetailExpandableList({super.key, required this.list});
  final List<ExpansionItem> list;

  @override
  State<DetailExpandableList> createState() => _DetailExpandableListState();
}

class _DetailExpandableListState extends State<DetailExpandableList> {
  int? _expandedIndex;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.list.length, (index) => _expansionItem(widget.list[index]))
    );
  }

  _expansionItem(ExpansionItem item)
  {
    return ExpansionTile(
      controller: item.controller,
            title: Text('Item ${item.index + 1}'),
            backgroundColor: _expandedIndex == item.index ? Colors.purple[100] : Colors.white,
            children: [
              Container(
                height: 50, // Genişletilmiş kısım yüksekliği
                color: Colors.white,
                alignment: Alignment.center,
                child: Text(
                  'Details for Item ${item.index + 1}',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            //initiallyExpanded: _expandedIndex == item.index,
            onExpansionChanged: (isExpanded) {
              _toggleExpansion(item.index);
            },
          );
  }


void _toggleExpansion(int index) {
    setState(() {
      // Eğer yeni bir index seçilmişse, o indexi genişlet
      _expandedIndex = _expandedIndex == index ? null : index;
      List<ExpansionItem> _closed = widget.list.where((item)=> item.index != _expandedIndex).toList();
      for(var i in _closed)
      {
        i.controller.collapse();
      }
    });
  }
}






 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/product/constant/cons_color.dart';
import 'package:ideasoft_test_case/product/model/expansion_model.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';
import 'package:ideasoft_test_case/provider/all_provider.dart';

class DetailExpandableList extends ConsumerStatefulWidget {
  const DetailExpandableList({super.key, required this.list});
  final List<ExpansionItem> list;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailExpandableListState();
}

class _DetailExpandableListState extends ConsumerState<DetailExpandableList> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.list.length, (index) => _expansionItem(widget.list[index]))
    );
  }

    _expansionItem(ExpansionItem item)
  {
    int? _expandedIndex = ref.watch(expandableProductDetail);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ExpansionTile(
        shape: const Border(),
              key: UniqueKey(),
              collapsedBackgroundColor: Colors.grey.shade200,
              iconColor: _expandedIndex == item.index ? Colors.white : Colors.black,
              title: TextTitleLarge(text: item.title, color: _expandedIndex == item.index ? Colors.white : Colors.black,),
              backgroundColor: ConsColor.purple,
              children: item.child,
              initiallyExpanded: _expandedIndex == item.index,
              onExpansionChanged: (isExpanded) {
                _toggleExpansion(item.index);
              },
            ),
    );
  }


void _toggleExpansion(int index) {
    int? expandedIndex = ref.watch(expandableProductDetail);
    
      ref.read(expandableProductDetail.notifier).state = index != expandedIndex ? index : null;
    
  }

}
