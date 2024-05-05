import '../core/common/constants/assets_constants.dart';

class Category {
  final String icon, title;

  Category({required this.icon, required this.title});
}

List<Category> demo_categories = [
  Category(
    icon: AssetsConstants.penPng,
    title: "اقلام",
  ),
  Category(
    icon:AssetsConstants.paperPng,
    title: "اوراق",
  ),
  Category(
    icon: AssetsConstants.notePng,
    title: "دفاتر",
  ),
  Category(
    icon:AssetsConstants.toolsPng,
    title: "ادوات",
  ),
    Category(
    icon:AssetsConstants.eduPng,
    title: "تعليم",
  ),
];
