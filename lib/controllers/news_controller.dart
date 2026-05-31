import '../data/mock_news_data.dart';
import '../models/news_article_model.dart';
import '../models/news_category_model.dart';
import '../models/reading_tag_model.dart';

class NewsController {
  final List<NewsArticleModel> _articles = MockNewsData.articles;
  final List<NewsCategoryModel> _categories = MockNewsData.categories;
  final List<ReadingTagModel> _readingTags = MockNewsData.readingTags;
  final Set<String> _savedArticleIds = <String>{};

  List<NewsArticleModel> getAllArticles() => List.unmodifiable(_articles);

  List<NewsCategoryModel> getCategories() => List.unmodifiable(_categories);

  List<ReadingTagModel> getReadingTags() => List.unmodifiable(_readingTags);

  List<NewsArticleModel> getBreakingArticles() {
    return _articles.where((article) => article.isBreaking).toList();
  }

  List<NewsArticleModel> getTrendingArticles() {
    return _articles
        .where((article) => article.readingTag == 'Trending')
        .toList();
  }

  List<NewsArticleModel> searchArticles(String query) {
    final String normalizedQuery = query.trim().toLowerCase();

    if (normalizedQuery.isEmpty) {
      return getAllArticles();
    }

    return _articles.where((article) {
      return article.title.toLowerCase().contains(normalizedQuery) ||
          article.summary.toLowerCase().contains(normalizedQuery) ||
          article.category.toLowerCase().contains(normalizedQuery) ||
          article.source.toLowerCase().contains(normalizedQuery) ||
          article.author.toLowerCase().contains(normalizedQuery);
    }).toList();
  }

  List<NewsArticleModel> filterByCategory(String category) {
    if (category == 'All') {
      return getAllArticles();
    }

    return _articles
        .where((article) => article.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  List<NewsArticleModel> filterByReadingTag(String tag) {
    if (tag == 'All') {
      return getAllArticles();
    }

    return _articles
        .where((article) => article.readingTag.toLowerCase() == tag.toLowerCase())
        .toList();
  }

  List<NewsArticleModel> searchAndFilterArticles({
    required String query,
    required String category,
    required String tag,
  }) {
    final String normalizedQuery = query.trim().toLowerCase();

    return _articles.where((article) {
      final bool matchesQuery = normalizedQuery.isEmpty ||
          article.title.toLowerCase().contains(normalizedQuery) ||
          article.summary.toLowerCase().contains(normalizedQuery) ||
          article.category.toLowerCase().contains(normalizedQuery) ||
          article.source.toLowerCase().contains(normalizedQuery) ||
          article.author.toLowerCase().contains(normalizedQuery);
      final bool matchesCategory =
          category == 'All' || article.category.toLowerCase() == category.toLowerCase();
      final bool matchesTag =
          tag == 'All' || article.readingTag.toLowerCase() == tag.toLowerCase();

      return matchesQuery && matchesCategory && matchesTag;
    }).toList();
  }

  void toggleSaved(String articleId) {
    if (_savedArticleIds.contains(articleId)) {
      _savedArticleIds.remove(articleId);
    } else {
      _savedArticleIds.add(articleId);
    }
  }

  bool isSaved(String articleId) {
    return _savedArticleIds.contains(articleId);
  }

  List<NewsArticleModel> getSavedArticles() {
    return _articles
        .where((article) => _savedArticleIds.contains(article.id))
        .toList();
  }
}
