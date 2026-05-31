import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ReadingTagChip extends StatelessWidget {
  const ReadingTagChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      showCheckmark: false,
      labelStyle: AppTextStyles.caption.copyWith(
        color: isSelected ? AppColors.slateText : AppColors.secondaryText,
        fontWeight: FontWeight.w800,
      ),
      selectedColor: AppColors.sandBeige,
      backgroundColor: AppColors.white.withValues(alpha: 0.72),
      side: BorderSide(
        color: isSelected
            ? AppColors.warmSand
            : AppColors.white.withValues(alpha: 0.82),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    );
  }
}
