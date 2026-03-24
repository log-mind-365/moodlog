import 'package:flutter/material.dart';
import 'package:moodlog/core/constants/common.dart';
import 'package:moodlog/core/constants/enum.dart';
import 'package:moodlog/core/l10n/app_localizations.dart';
import 'package:moodlog/presentation/screens/statistics/statistics_view_model.dart';
import 'package:moodlog/presentation/widgets/base_card.dart';
import 'package:provider/provider.dart';

class WeeklySummaryCard extends StatelessWidget {
  const WeeklySummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final totalCheckIns = context.select<StatisticsViewModel, int>(
      (vm) => vm.weeklyCheckInsList.length,
    );
    final avgMood = context.select<StatisticsViewModel, double>(
      (vm) => vm.weeklyAverageMood,
    );
    final mostFrequentMood = context.select<StatisticsViewModel, MoodType?>(
      (vm) => vm.weeklyMostFrequentMood,
    );

    return BaseCard(
      title: t.statistics_weekly_summary,
      icon: Icons.calendar_view_week,
      child: Row(
        spacing: Spacing.md,
        children: [
          Expanded(
            child: _SummaryItem(
              label: t.statistics_weekly_total_checkins,
              value: totalCheckIns.toString(),
              icon: Icons.check_circle_outline,
              color: colorScheme.primary,
            ),
          ),
          Expanded(
            child: _SummaryItem(
              label: t.statistics_weekly_avg_mood,
              value: avgMood > 0 ? avgMood.toStringAsFixed(1) : '-',
              icon: Icons.sentiment_satisfied_alt,
              color: colorScheme.secondary,
            ),
          ),
          Expanded(
            child: _SummaryItem(
              label: t.statistics_weekly_most_frequent_mood,
              value: mostFrequentMood?.emoji ?? '-',
              valueStyle: textTheme.headlineLarge,
              icon: Icons.trending_up,
              color: mostFrequentMood != null
                  ? Color(mostFrequentMood.colorValue)
                  : colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final TextStyle? valueStyle;

  const _SummaryItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.lg,
        horizontal: Spacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(Roundness.cardInner),
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style:
                valueStyle ??
                textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
          CommonSizedBox.heightXs,
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
