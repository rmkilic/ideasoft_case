import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/core/extension/context_extension.dart';
import 'package:ideasoft_test_case/product/constant/cons_size.dart';

///Uygulamada kullanılacak paddinglerin bir yerden yönetilmesini istiyorum.
///Sabit değerleri değişkenlerle tutuyorum değişim istenildiğinde daha rahat yönetilebilir.
class ConsPadding extends EdgeInsets{
    
  ConsPadding.pagePadding(BuildContext context):super.symmetric(horizontal: context.width*.1);

  ///Sayfaların genel hizalamasında kullanılır
  ConsPadding.subPagePadding(BuildContext context):super.symmetric(horizontal: context.width*.03, vertical: context.height*.03);

  ConsPadding.horizontalSubPagePadding(BuildContext context):super.symmetric(horizontal: context.width*.03);
  ///Sayfa içerisindeki dikeyde hizalama için kullanılır
  ConsPadding.verticalMid():super.symmetric(vertical: ConsSize.mid);
  ConsPadding.verticalMin():super.symmetric(vertical: ConsSize.min);

  ConsPadding.vMidhMin():super.symmetric(vertical: ConsSize.mid, horizontal: ConsSize.min);

  ///TextFieldlar için content paddingde kullanılır.
  ConsPadding.allMid():super.all(ConsSize.mid);


}