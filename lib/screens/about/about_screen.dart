import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/animated_editorial_background.dart';
import '../../widgets/glass_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedEditorialBackground(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 92,
                      height: 92,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.tideBlue.withValues(alpha: 0.16),
                            blurRadius: 24,
                            offset: const Offset(0, 14),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset('assets/icons/app_logo.svg'),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text('PulseBrief', style: AppTextStyles.display),
                    const SizedBox(height: 8),
                    Text(
                      'A smart Flutter news digest for categorized reading, search, details, and saved articles.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              const _InfoCard(
                title: 'Project Idea',
                icon: Icons.lightbulb_outline_rounded,
                lines: [
                  'PulseBrief is a Flutter news app that includes categories, news list, article details, and saved articles.',
                ],
              ),
              const _InfoCard(
                title: 'Academic Requirements',
                icon: Icons.school_outlined,
                lines: [
                  '4+ screens',
                  'Bottom navigation',
                  'ListView.builder',
                  'Models',
                  'Controller',
                  'Assets and network images',
                  'Packages',
                  'Search and filter',
                  'Data passing',
                ],
              ),
              const _InfoCard(
                title: 'MVC Architecture',
                icon: Icons.account_tree_outlined,
                lines: [
                  'Models hold article/category data',
                  'Screens display UI',
                  'Controller manages search, filtering, and saved articles',
                ],
              ),
              const _InfoCard(
                title: 'OOP Concepts',
                icon: Icons.layers_outlined,
                lines: [
                  'Encapsulation',
                  'Abstraction',
                  'Composition',
                ],
              ),
              const _InfoCard(
                title: 'Packages',
                icon: Icons.extension_outlined,
                lines: [
                  'google_fonts',
                  'flutter_svg',
                  'url_launcher',
                  'intl',
                ],
              ),
              const _InfoCard(
                title: 'Version',
                icon: Icons.verified_outlined,
                lines: ['Version 1.0.0'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.icon,
    required this.lines,
  });

  final String title;
  final IconData icon;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.seaMistBlue,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.tideBlue),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(title, style: AppTextStyles.title)),
            ],
          ),
          const SizedBox(height: 14),
          for (final line in lines)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: AppColors.tideBlue,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      line,
                      style: AppTextStyles.body,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
