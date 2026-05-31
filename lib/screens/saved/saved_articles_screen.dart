import 'package:flutter/material.dart';

import '../../controllers/news_controller.dart';
import '../../models/news_article_model.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/animated_editorial_background.dart';
import '../../widgets/empty_state_widget.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/saved_article_card.dart';
import '../details/news_details_screen.dart';

class SavedArticlesScreen extends StatefulWidget {
  const SavedArticlesScreen({
    required this.controller,
    super.key,
  });

  final NewsController controller;

  @override
  State<SavedArticlesScreen> createState() => _SavedArticlesScreenState();
}

class _SavedArticlesScreenState extends State<SavedArticlesScreen> {
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
    final List<NewsArticleModel> savedArticles = widget.controller.getSavedArticles();

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
                  Text('Saved Articles', style: AppTextStyles.headline),
                  const SizedBox(height: 6),
                  Text('Your personal reading list.', style: AppTextStyles.body),
                  const SizedBox(height: AppSpacing.lg),
                  GlassCard(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.collections_bookmark_rounded,
                          color: AppColors.tideBlue,
                          size: 32,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            '${savedArticles.length} saved articles',
                            style: AppTextStyles.title,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Expanded(
              child: savedArticles.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 120),
                      child: Center(
                        child: EmptyStateWidget(
                          illustrationPath: 'assets/illustrations/saved_articles.svg',
                          title: 'No saved articles yet',
                          message:
                              'No saved articles yet. Save articles from Explore to read them later.',
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
                      itemCount: savedArticles.length,
                      itemBuilder: (context, index) {
                        final NewsArticleModel article = savedArticles[index];

                        return SavedArticleCard(
                          article: article,
                          onTap: () => _openDetails(article),
                          onRemoveTap: () {
                            setState(() => widget.controller.toggleSaved(article.id));
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
