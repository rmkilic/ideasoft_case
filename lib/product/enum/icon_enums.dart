import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///Uygulama içerisindeki kullanılan bütün iconları bir alanda tutuyorum
///Değişim istendiğinde tek bir alandan yönetilebilmeli
enum IconEnums
{
  photo(icon: Icons.photo),
  delete(icon: Icons.delete_sweep_outlined),
  minus(icon: FontAwesomeIcons.minus),
  add(icon: FontAwesomeIcons.plus),
  send(icon: Icons.send),
  search(icon: FontAwesomeIcons.magnifyingGlass),
  right(icon: Icons.arrow_forward),
  profile(icon: FontAwesomeIcons.circleUser),
  favorite(icon: FontAwesomeIcons.heart),
  favoriteFull(icon:FontAwesomeIcons.solidHeart),
  dot(icon: Icons.circle_sharp),
  circle(icon: Icons.circle_outlined),
  circleDone(icon: FontAwesomeIcons.solidCircleCheck),
  installment(icon: Icons.assignment),
  linkedin(icon:FontAwesomeIcons.linkedin),
  basket(icon: Icons.shopping_bag_outlined);
  const IconEnums({
    required this.icon
  });
  final IconData icon;
}