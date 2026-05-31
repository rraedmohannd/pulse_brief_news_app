class NewsCategoryModel {
  const NewsCategoryModel({
    required this.id,
    required this.name,
    required this.iconAssetPath,
    required this.articleCount,
  });

  final String id;
  final String name;
  final String iconAssetPath;
  final int articleCount;
}
