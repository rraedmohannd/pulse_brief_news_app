import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../controllers/news_controller.dart';
import '../../models/news_article_model.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/animated_editorial_background.dart';
import '../../widgets/featured_article_card.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/news_article_card.dart';
import '../../widgets/section_header.dart';
import '../../widgets/status_badge.dart';
import '../details/news_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.controller,
    required this.onExploreRequested,
    required this.onSavedRequested,
    super.key,
  });

  final NewsController controller;
  final VoidCallback onExploreRequested;
  final VoidCallback onSavedRequested;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    final List<NewsArticleModel> articles = widget.controller.getAllArticles();
    final NewsArticleModel featured = widget.controller.getBreakingArticles().isNotEmpty
        ? widget.controller.getBreakingArticles().first
        : articles.first;
    final List<NewsArticleModel> trending = widget.controller.getTrendingArticles();
    final int savedCount = widget.controller.getSavedArticles().length;
    final String dateLabel = DateFormat('EEEE, MMMM d').format(DateTime.now());

    return AnimatedEditorialBackground(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/app_logo.svg', width: 48, height: 48),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('PulseBrief', style: AppTextStyles.display),
                        const SizedBox(height: 4),
                        Text(
                          'Smart news, beautifully organized.',
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              const StatusBadge(label: 'Editorial Ocean Edition'),
              const SizedBox(height: AppSpacing.xl),
              FeaturedArticleCard(
                article: featured,
                isSaved: widget.controller.isSaved(featured.id),
                onTap: () => _openDetails(featured),
                onSaveTap: () {
                  setState(() => widget.controller.toggleSaved(featured.id));
                },
              ),
              const SizedBox(height: AppSpacing.xl),
              GlassCard(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Today\'s Brief', style: AppTextStyles.title),
                          const SizedBox(height: 8),
                          Text(
                            '$dateLabel - ${articles.length} curated stories across ${widget.controller.getCategories().length} categories.',
                            style: AppTextStyles.body,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.seaMistBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.auto_stories_rounded,
                        color: AppColors.tideBlue,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              SectionHeader(
                title: 'Categories',
                subtitle: 'Browse the newsroom by topic.',
                action: TextButton(
                  onPressed: widget.onExploreRequested,
                  child: const Text('Explore'),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                height: 108,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.controller.getCategories().length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final category = widget.controller.getCategories()[index];

                    return GlassCard(
                      onTap: widget.onExploreRequested,
                      padding: const EdgeInsets.all(14),
                      borderRadius: 22,
                      child: SizedBox(
                        width: 126,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              category.iconAssetPath,
                              width: 28,
                              height: 28,
                            ),
                            Text(
                              category.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodyStrong,
                            ),
                            Text(
                              '${category.articleCount} articles',
                              style: AppTextStyles.caption,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              SectionHeader(
                title: 'Trending Articles',
                subtitle: 'Stories readers are opening now.',
                action: TextButton(
                  onPressed: widget.onExploreRequested,
                  child: const Text('View all'),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              ListView.builder(
                itemCount: trending.length > 3 ? 3 : trending.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final article = trending[index];

                  return NewsArticleCard(
                    article: article,
                    isSaved: widget.controller.isSaved(article.id),
                    onTap: () => _openDetails(article),
                    onSaveTap: () {
                      setState(() => widget.controller.toggleSaved(article.id));
                    },
                  );
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              GlassCard(
                child: Row(
                  children: [
                    const Icon(
                      Icons.bookmarks_rounded,
                      color: AppColors.tideBlue,
                      size: 30,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('$savedCount saved articles', style: AppTextStyles.title),
                          const SizedBox(height: 4),
                          Text(
                            'Your reading list stays ready for later.',
                            style: AppTextStyles.body,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      tooltip: 'Open saved articles',
                      onPressed: widget.onSavedRequested,
                      icon: const Icon(Icons.arrow_forward_rounded),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              SectionHeader(title: 'Quick Actions'),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: _QuickActionCard(
                      icon: Icons.grid_view_rounded,
                      label: 'Browse Categories',
                      onTap: widget.onExploreRequested,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _QuickActionCard(
                      icon: Icons.local_fire_department_rounded,
                      label: 'Trending News',
                      onTap: widget.onExploreRequested,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _QuickActionCard(
                icon: Icons.bookmark_added_rounded,
                label: 'Saved Articles',
                onTap: widget.onSavedRequested,
                wide: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
    this.wide = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: wide ? 18 : 16),
      borderRadius: 22,
      child: Row(
        mainAxisAlignment: wide ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.tideBlue),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyStrong,
            ),
          ),
        ],
      ),
    );
  }
}
