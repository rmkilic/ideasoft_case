enum ImageEnums
{
  logo(path: "img_logo.webp"),
  slider_1(path:"img_slider.webp"),
  banner_1(path:"img_banner_1.webp"),
  banner_2(path:"img_banner_2.webp"),
  banner_3(path:"img_banner_3.webp"),
  category_1(path:"img_banner_category_1.png"),
  category_2(path:"img_banner_category_2.png"),
  category_3(path:"img_banner_category_3.png"),
  bannerExtended(path:"img_banner_4.png"),
  news(path:"img_banner_5.webp");
  const ImageEnums({required this.path});
  final String path;

}

extension ImageExtension on ImageEnums{



  String get toPath => 'assets/images/$path';


}