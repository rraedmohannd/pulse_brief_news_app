class NewsArticleModel {
  const NewsArticleModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.category,
    required this.source,
    required this.author,
    required this.publishedAt,
    required this.readingTime,
    required this.imageUrl,
    required this.sourceUrl,
    required this.readingTag,
    required this.isBreaking,
  });

  final String id;
  final String title;
  final String summary;
  final String content;
  final String category;
  final String source;
  final String author;
  final DateTime publishedAt;
  final String readingTime;
  final String imageUrl;
  final String sourceUrl;
  final String readingTag;
  final bool isBreaking;
}
