import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = switch (label) {
      'Breaking' => AppColors.softCoralAlert,
      'Trending' => AppColors.lightAquaBlue,
      'Quick Read' => AppColors.successMint,
      'Deep Dive' => AppColors.sandBeige,
      'Important' => AppColors.warningSandGold,
      _ => AppColors.seaMistBlue,
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.slateText,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
