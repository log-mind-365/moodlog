import 'package:flutter/material.dart';
import 'package:moodlog/core/constants/common.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final String title;
  final IconData icon;
  final Color? titleColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool showHeader;

  const BaseCard({
    super.key,
    required this.child,
    required this.title,
    required this.icon,
    this.titleColor,
    this.iconColor,
    this.backgroundColor,
    this.padding,
    this.showHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveTitleColor = titleColor ?? colorScheme.onSurface;
    final effectiveIconColor = iconColor ?? colorScheme.primary;
    final effectiveBackgroundColor =
        backgroundColor ?? colorScheme.surfaceContainer;
    final effectivePadding = padding ?? CommonPadding.xl;

    return Container(
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(Roundness.card),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: effectivePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showHeader) ...[
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(Spacing.sm),
                    decoration: BoxDecoration(
                      color: effectiveIconColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(Roundness.button),
                    ),
                    child: Icon(icon, color: effectiveIconColor, size: 18),
                  ),
                  CommonSizedBox.widthMd,
                  Expanded(
                    child: Text(
                      title,
                      style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: effectiveTitleColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              CommonSizedBox.heightXl,
            ],
            child,
          ],
        ),
      ),
    );
  }
}
