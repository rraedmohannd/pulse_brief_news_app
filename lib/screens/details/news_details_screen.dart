import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/news_controller.dart';
import '../../models/news_article_model.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/animated_editorial_background.dart';
import '../../widgets/category_filter_chip.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/primary_action_button.dart';
import '../../widgets/status_badge.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({
    required this.article,
    required this.controller,
    super.key,
  });

  final NewsArticleModel article;
  final NewsController controller;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  late bool _isSaved;

  @override
  void initState() {
    super.initState();
    _isSaved = widget.controller.isSaved(widget.article.id);
  }

  void _toggleSaved() {
    widget.controller.toggleSaved(widget.article.id);
    setState(() => _isSaved = widget.controller.isSaved(widget.article.id));
  }

  Future<void> _openSource() async {
    final Uri uri = Uri.parse(widget.article.sourceUrl);
    final bool launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open the source link.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String publishedDate =
        DateFormat('MMMM d, yyyy - h:mm a').format(widget.article.publishedAt);
    final List<String> paragraphs = widget.article.content.split('\n\n');

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedEditorialBackground(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _DetailsHeroImage(article: widget.article),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          children: [
                            CategoryFilterChip(
                              label: widget.article.category,
                              isSelected: true,
                              onTap: () {},
                            ),
                            const SizedBox(width: 10),
                            StatusBadge(label: widget.article.readingTag),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Text(
                          widget.article.title,
                          style: AppTextStyles.display.copyWith(fontSize: 32),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        GlassCard(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: AppColors.seaMistBlue,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(
                                  Icons.person_outline_rounded,
                                  color: AppColors.tideBlue,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.article.author,
                                      style: AppTextStyles.bodyStrong,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${widget.article.source} - $publishedDate - ${widget.article.readingTime}',
                                      style: AppTextStyles.caption,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        for (final paragraph in paragraphs) ...[
                          Text(
                            paragraph,
                            style: AppTextStyles.body.copyWith(
                              fontSize: 16,
                              height: 1.72,
                              color: AppColors.slateText,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                        ],
                        const SizedBox(height: AppSpacing.sm),
                        PrimaryActionButton(
                          label: 'Open Source',
                          icon: Icons.open_in_new_rounded,
                          onTap: _openSource,
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        GlassCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Related Info', style: AppTextStyles.title),
                              const SizedBox(height: 10),
                              Text(
                                'This article is part of the ${widget.article.category} desk and is tagged as ${widget.article.readingTag}. Save it to keep it in your personal reading list.',
                                style: AppTextStyles.body,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
                child: Row(
                  children: [
                    _FloatingCircleButton(
                      tooltip: 'Back',
                      icon: Icons.arrow_back_rounded,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    const Spacer(),
                    _FloatingCircleButton(
                      tooltip: _isSaved ? 'Remove saved article' : 'Save article',
                      icon: _isSaved
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                      onTap: _toggleSaved,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsHeroImage extends StatelessWidget {
  const _DetailsHeroImage({required this.article});

  final NewsArticleModel article;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(34),
        bottomRight: Radius.circular(34),
      ),
      child: SizedBox(
        height: 360,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              article.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const ColoredBox(
                  color: AppColors.seaMistBlue,
                  child: Icon(Icons.image_not_supported_outlined, size: 42),
                );
              },
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.08),
                    Colors.black.withValues(alpha: 0.34),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingCircleButton extends StatelessWidget {
  const _FloatingCircleButton({
    required this.tooltip,
    required this.icon,
    required this.onTap,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white.withValues(alpha: 0.84),
      shape: const CircleBorder(),
      child: IconButton(
        tooltip: tooltip,
        onPressed: onTap,
        icon: Icon(icon),
        color: AppColors.slateText,
      ),
    );
  }
}
