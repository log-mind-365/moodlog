import 'package:flutter/material.dart';
import 'package:moodlog/core/constants/common.dart';
import 'package:moodlog/core/l10n/app_localizations.dart';
import 'package:moodlog/presentation/screens/statistics/statistics_view_model.dart';
import 'package:moodlog/presentation/widgets/base_card.dart';
import 'package:provider/provider.dart';

class WeeklyEmotionKeywords extends StatelessWidget {
  const WeeklyEmotionKeywords({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final topEmotions = context.select<StatisticsViewModel, List<String>>(
      (vm) => vm.weeklyTopEmotions,
    );

    return BaseCard(
      title: t.statistics_weekly_top_emotions,
      icon: Icons.favorite_outline,
      child: topEmotions.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.xl),
                child: Text(
                  t.statistics_mood_distribution_empty,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            )
          : Wrap(
              spacing: Spacing.sm,
              runSpacing: Spacing.sm,
              children: topEmotions.asMap().entries.map((entry) {
                final index = entry.key;
                final emotion = entry.value;
                return _EmotionChip(
                  emotion: emotion,
                  rank: index + 1,
                );
              }).toList(),
            ),
    );
  }
}

class _EmotionChip extends StatelessWidget {
  final String emotion;
  final int rank;

  const _EmotionChip({
    required this.emotion,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final colors = [
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.tertiary,
      colorScheme.primary.withValues(alpha: 0.7),
      colorScheme.secondary.withValues(alpha: 0.7),
    ];

    final color = colors[rank - 1];
    final isTop3 = rank <= 3;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.md,
        vertical: Spacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isTop3 ? 0.12 : 0.06),
        borderRadius: BorderRadius.circular(Roundness.xl),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withValues(alpha: 0.7)],
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          CommonSizedBox.widthSm,
          Text(
            emotion,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
