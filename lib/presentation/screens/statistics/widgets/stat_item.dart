import 'package:flutter/material.dart';
import 'package:moodlog/core/constants/common.dart';

class StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const StatItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.lg,
        horizontal: Spacing.md,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(Roundness.cardInner),
      ),
      child: Column(
        children: [
          Icon(icon, size: 28, color: colorScheme.primary),
          CommonSizedBox.heightSm,
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          CommonSizedBox.heightXs,
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
