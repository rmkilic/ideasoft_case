import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideasoft_test_case/product/constant/cons_color.dart';
import 'package:ideasoft_test_case/product/widget/bottom_banner.dart';
import 'package:ideasoft_test_case/product/widget/bottom_bar.dart';
import 'package:ideasoft_test_case/product/widget/categories.dart';
import 'package:ideasoft_test_case/product/widget/complex/custom_appbar.dart';
import 'package:ideasoft_test_case/product/widget/custom_slider.dart';
import 'package:ideasoft_test_case/product/widget/footer.dart';
import 'package:ideasoft_test_case/product/widget/horizontal_list_view.dart';
import 'package:ideasoft_test_case/product/widget/news.dart';
import 'package:ideasoft_test_case/provider/all_provider.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConsColor.background,
      appBar: CustomAppbar(context, ref.watch(productList)),
      body: ListView(
        children: [
          AnimatedSwitchers(),
          const HorizontalListView(),
          Categories(),
          const BottomBanner(),
          const News(),
          const BottomBar(),
          const Footer()
        ],
      ),
    );
  }


  

}


