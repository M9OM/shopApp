import '../core/common/constants/assets_constants.dart';
import '../core/common/constants/colloctionName.dart';

class Category {
  final String icon, title, collection;

  Category({required this.icon, required this.title, required this.collection});
}

List<Category> demo_categories = [
  Category(
    icon: AssetsConstants.penPng,
    title: "اقلام",
    collection: pens,
  ),
  Category(
    icon: AssetsConstants.paperPng,
    title: "اوراق",
    collection: papers,
  ),
  Category(
    icon: AssetsConstants.notePng,
    title: "دفاتر",
    collection: noteBooks,
  ),
  Category(
    icon: AssetsConstants.toolsPng,
    title: "ادوات",
    collection: tools,
  ),
  Category(
    icon: AssetsConstants.eduPng,
    title: "تعليم",
    collection: edu,
  ),
];
