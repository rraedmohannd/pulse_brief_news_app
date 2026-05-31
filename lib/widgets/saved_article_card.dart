import 'package:flutter/material.dart';

import '../models/news_article_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'glass_card.dart';
import 'status_badge.dart';

class SavedArticleCard extends StatelessWidget {
  const SavedArticleCard({
    required this.article,
    required this.onTap,
    required this.onRemoveTap,
    super.key,
  });

  final NewsArticleModel article;
  final VoidCallback onTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 90,
              height: 96,
              child: Image.network(
                article.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const ColoredBox(
                    color: AppColors.seaMistBlue,
                    child: Icon(Icons.image_not_supported_outlined),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusBadge(label: article.readingTag),
                const SizedBox(height: 8),
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.title.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  '${article.category} - ${article.source}',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.slateText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(article.readingTime, style: AppTextStyles.caption),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Remove saved article',
            onPressed: onRemoveTap,
            icon: const Icon(Icons.bookmark_remove_rounded),
            color: AppColors.tideBlue,
          ),
        ],
      ),
    );
  }
}
