class Category {
  final String icon, title;

  Category({required this.icon, required this.title});
}

List<Category> demo_categories = [
  Category(
    icon: "assets/icons/pen.png",
    title: "اقلام",
  ),
  Category(
    icon: "assets/icons/paper.png",
    title: "اوراق",
  ),
  Category(
    icon: "assets/icons/note.png",
    title: "دفاتر",
  ),
  Category(
    icon: "assets/icons/package.png",
    title: "تغليف",
  ),
];
