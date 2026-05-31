import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/news_article_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'glass_card.dart';
import 'status_badge.dart';

class NewsArticleCard extends StatelessWidget {
  const NewsArticleCard({
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
    final String publishedDate = DateFormat('MMM d, yyyy').format(article.publishedAt);

    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 112,
              height: 132,
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
            child: SizedBox(
              height: 132,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      StatusBadge(label: article.readingTag),
                      const Spacer(),
                      IconButton(
                        tooltip: isSaved ? 'Remove saved article' : 'Save article',
                        onPressed: onSaveTap,
                        visualDensity: VisualDensity.compact,
                        icon: Icon(
                          isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                          color: isSaved ? AppColors.tideBlue : AppColors.tertiaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.title.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      article.summary,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.secondaryText,
                        height: 1.35,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          '${article.category} - ${article.source}',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.slateText,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '$publishedDate - ${article.readingTime}',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
