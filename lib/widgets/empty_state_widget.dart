import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'glass_card.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    required this.illustrationPath,
    required this.title,
    required this.message,
    super.key,
  });

  final String illustrationPath;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(illustrationPath, width: 132, height: 132),
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.title,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(color: AppColors.secondaryText),
          ),
        ],
      ),
    );
  }
}
