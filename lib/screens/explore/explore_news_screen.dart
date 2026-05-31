import 'package:flutter/material.dart';

import '../../controllers/news_controller.dart';
import '../../models/news_article_model.dart';
import '../../models/news_category_model.dart';
import '../../models/reading_tag_model.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/animated_editorial_background.dart';
import '../../widgets/category_filter_chip.dart';
import '../../widgets/empty_state_widget.dart';
import '../../widgets/news_article_card.dart';
import '../../widgets/reading_tag_chip.dart';
import '../../widgets/search_input.dart';
import '../../widgets/section_header.dart';
import '../details/news_details_screen.dart';

class ExploreNewsScreen extends StatefulWidget {
  const ExploreNewsScreen({
    required this.controller,
    super.key,
  });

  final NewsController controller;

  @override
  State<ExploreNewsScreen> createState() => _ExploreNewsScreenState();
}

class _ExploreNewsScreenState extends State<ExploreNewsScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  String _selectedTag = 'All';

  Future<void> _openDetails(NewsArticleModel article) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => NewsDetailsScreen(
          article: article,
          controller: widget.controller,
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<NewsCategoryModel> categories = widget.controller.getCategories();
    final List<ReadingTagModel> readingTags = widget.controller.getReadingTags();
    final List<NewsArticleModel> filteredArticles =
        widget.controller.searchAndFilterArticles(
      query: _searchQuery,
      category: _selectedCategory,
      tag: _selectedTag,
    );

    return AnimatedEditorialBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Explore News', style: AppTextStyles.headline),
                  const SizedBox(height: 6),
                  Text(
                    'Search, filter, and open the stories that matter to you.',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  SearchInput(
                    hint: 'Search title, source, category, or author',
                    onChanged: (value) => setState(() => _searchQuery = value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: 44,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return CategoryFilterChip(
                      label: 'All',
                      isSelected: _selectedCategory == 'All',
                      onTap: () => setState(() => _selectedCategory = 'All'),
                      articleCount: widget.controller.getAllArticles().length,
                    );
                  }

                  final NewsCategoryModel category = categories[index - 1];

                  return CategoryFilterChip(
                    label: category.name,
                    iconAssetPath: category.iconAssetPath,
                    articleCount: category.articleCount,
                    isSelected: _selectedCategory == category.name,
                    onTap: () => setState(() => _selectedCategory = category.name),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: 48,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: readingTags.length + 1,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ReadingTagChip(
                      label: 'All',
                      isSelected: _selectedTag == 'All',
                      onTap: () => setState(() => _selectedTag = 'All'),
                    );
                  }

                  final ReadingTagModel tag = readingTags[index - 1];

                  return ReadingTagChip(
                    label: tag.name,
                    isSelected: _selectedTag == tag.name,
                    onTap: () => setState(() => _selectedTag = tag.name),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SectionHeader(
                title: '${filteredArticles.length} stories',
                subtitle: _selectedCategory == 'All' && _selectedTag == 'All'
                    ? 'Curated from the PulseBrief desk.'
                    : 'Filtered by topic and reading style.',
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: filteredArticles.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.fromLTRB(20, 8, 20, 120),
                      child: Center(
                        child: EmptyStateWidget(
                          illustrationPath: 'assets/illustrations/empty_news.svg',
                          title: 'No matching stories',
                          message:
                              'Try a different search term, category, or reading tag.',
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
                      itemCount: filteredArticles.length,
                      itemBuilder: (context, index) {
                        final NewsArticleModel article = filteredArticles[index];

                        return NewsArticleCard(
                          article: article,
                          isSaved: widget.controller.isSaved(article.id),
                          onTap: () => _openDetails(article),
                          onSaveTap: () {
                            setState(() => widget.controller.toggleSaved(article.id));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  widget.controller.isSaved(article.id)
                                      ? 'Article saved.'
                                      : 'Article removed from saved.',
                                ),
                                backgroundColor: AppColors.slateText,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
