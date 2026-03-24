import 'package:flutter/material.dart';
import 'package:moodlog/core/constants/common.dart';
import 'package:moodlog/core/l10n/app_localizations.dart';

class MoodDistributionItem extends StatelessWidget {
  final String mood;
  final int count;
  final Color color;
  final double percentage;

  const MoodDistributionItem({
    super.key,
    required this.mood,
    required this.count,
    required this.color,
    this.percentage = 0,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.xs),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              CommonSizedBox.widthSm,
              Expanded(
                child: Text(
                  mood,
                  style: textTheme.bodyMedium,
                ),
              ),
              Text(
                AppLocalizations.of(
                  context,
                )!.statistics_mood_distribution_unit(count),
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          CommonSizedBox.heightXs,
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 4,
              backgroundColor: colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}
