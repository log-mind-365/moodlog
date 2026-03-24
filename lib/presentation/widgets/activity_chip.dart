import 'package:flutter/material.dart';
import 'package:moodlog/core/constants/common.dart';
import 'package:moodlog/domain/entities/journal/activity.dart';

class ActivityChip extends StatelessWidget {
  final Activity activity;
  final bool isCompact;

  const ActivityChip({
    super.key,
    required this.activity,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('#${activity.name}'),
      labelStyle: (isCompact
              ? Theme.of(context).textTheme.labelSmall
              : Theme.of(context).textTheme.labelMedium)
          ?.copyWith(color: Theme.of(context).colorScheme.outline),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      side: BorderSide.none,
      visualDensity: isCompact ? VisualDensity.compact : VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? Spacing.xs : Spacing.sm,
      ),
    );
  }
}
