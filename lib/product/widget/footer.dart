import 'package:flutter/material.dart';
import 'package:ideasoft_test_case/core/constant/app_constant.dart';
import 'package:ideasoft_test_case/product/constant/index.dart';
import 'package:ideasoft_test_case/product/enum/icon_enums.dart';
import 'package:ideasoft_test_case/product/enum/image_enums.dart';
import 'package:ideasoft_test_case/product/widget/text/index.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: 50.0,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Image.asset(ImageEnums.logo.toPath),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index)=> IconButton(icon:Icon(IconEnums.linkedin.icon), onPressed: (){launchURL();},)),
        ),
        Container(
          width: double.infinity,
          color: ConsColor.black,
          padding: ConsPadding.allMid(),
          child: const Center(child: 
          TextBodyLarge(text: AppConstant.designer, color: ConsColor.white,))
        )
      ],
    );
  }

  launchURL({String? link}) async {

 try
 {
   Uri uri = Uri.parse(link ?? AppConstant.LINKEDINADRESS);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
 }
 catch(e)
 {
  Exception(e);
 }
}
}