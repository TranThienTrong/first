class Meal {
  late final String id;
  late final List<String> categoriesId;
  late final String? title;
  late final String? imageUrl;
  late final List<String>? ingredients;

  late final bool? isVegan;
  late final bool? isSugarFree;

  Meal(
      {required this.id,
      required this.categoriesId,
      this.title,
      this.imageUrl,
      this.ingredients,
      this.isVegan,
      this.isSugarFree});

  get categoryId => this.categoriesId;


}
