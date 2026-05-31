import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CategoryFilterChip extends StatelessWidget {
  const CategoryFilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
    this.iconAssetPath,
    this.articleCount,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final String? iconAssetPath;
  final int? articleCount;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isSelected ? AppColors.tideBlue : AppColors.white.withValues(alpha: 0.7);
    final Color foregroundColor =
        isSelected ? AppColors.white : AppColors.slateText;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: isSelected
                  ? AppColors.tideBlue
                  : AppColors.white.withValues(alpha: 0.82),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.tideBlue.withValues(alpha: isSelected ? 0.22 : 0.08),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconAssetPath != null) ...[
                SvgPicture.asset(
                  iconAssetPath!,
                  width: 18,
                  height: 18,
                  colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  color: foregroundColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (articleCount != null) ...[
                const SizedBox(width: 8),
                Text(
                  articleCount.toString(),
                  style: AppTextStyles.caption.copyWith(
                    color: foregroundColor.withValues(alpha: 0.82),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
