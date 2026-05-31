import 'package:flutter/material.dart';

import '../models/news_article_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'status_badge.dart';

class FeaturedArticleCard extends StatelessWidget {
  const FeaturedArticleCard({
    required this.article,
    required this.isSaved,
    required this.onTap,
    required this.onSaveTap,
    super.key,
  });

  final NewsArticleModel article;
  final bool isSaved;
  final VoidCallback onTap;
  final VoidCallback onSaveTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: AppColors.seaMistBlue,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 300,
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
                        Colors.black.withValues(alpha: 0.58),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 18,
                  left: 18,
                  right: 18,
                  child: Row(
                    children: [
                      const StatusBadge(label: 'Breaking'),
                      const Spacer(),
                      IconButton.filledTonal(
                        tooltip: isSaved ? 'Remove saved article' : 'Save article',
                        onPressed: onSaveTap,
                        icon: Icon(
                          isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.category,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.white.withValues(alpha: 0.88),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        article.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.headline.copyWith(
                          color: AppColors.white,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${article.source} - ${article.readingTime}',
                        style: AppTextStyles.bodyStrong.copyWith(
                          color: AppColors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
