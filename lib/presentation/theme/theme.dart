import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodlog/core/constants/common.dart';
import 'package:moodlog/domain/entities/font/font_type.dart';
import 'package:moodlog/presentation/theme/colors.dart';

abstract final class AppTheme {
  static ThemeData lightTheme(FontType fontType) {
    final cs = ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
      brightness: Brightness.light,
    );
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: cs.surfaceContainerLowest,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: cs.surfaceContainer,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      fontFamily: fontType is LocalFont ? fontType.fontName : null,
      brightness: Brightness.light,
      scaffoldBackgroundColor: cs.surfaceContainerLowest,
      textTheme: _getTextTheme(fontType),
      colorScheme: cs,
      cardTheme: _buildCardTheme(cs),
      filledButtonTheme: _buildFilledButtonTheme(cs),
      bottomSheetTheme: _buildBottomSheetTheme(cs),
      inputDecorationTheme: _buildInputDecorationTheme(),
      chipTheme: _buildChipTheme(cs),
    );
  }

  static ThemeData darkTheme(FontType fontType) {
    final cs = ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
      brightness: Brightness.dark,
    );
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: cs.surfaceContainerLowest,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: cs.surfaceContainer,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      fontFamily: fontType is LocalFont ? fontType.fontName : null,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: cs.surfaceContainerLowest,
      textTheme: _getTextTheme(fontType),
      colorScheme: cs,
      cardTheme: _buildCardTheme(cs),
      filledButtonTheme: _buildFilledButtonTheme(cs),
      bottomSheetTheme: _buildBottomSheetTheme(cs),
      inputDecorationTheme: _buildInputDecorationTheme(),
      chipTheme: _buildChipTheme(cs),
    );
  }

  static CardThemeData _buildCardTheme(ColorScheme cs) {
    return CardThemeData(
      color: cs.surfaceContainer,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Roundness.card),
      ),
      clipBehavior: Clip.hardEdge,
    );
  }

  static FilledButtonThemeData _buildFilledButtonTheme(ColorScheme cs) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: cs.surfaceContainer,
        foregroundColor: cs.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Roundness.button),
        ),
      ),
    );
  }

  static BottomSheetThemeData _buildBottomSheetTheme(ColorScheme cs) {
    return BottomSheetThemeData(
      backgroundColor: cs.surface,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Roundness.card)),
      ),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme() {
    return const InputDecorationTheme(
      border: UnderlineInputBorder(),
    );
  }

  static ChipThemeData _buildChipTheme(ColorScheme cs) {
    return ChipThemeData(
      selectedColor: cs.primaryContainer,
      checkmarkColor: cs.onPrimaryContainer,
    );
  }

  static const _boldFontWeight = FontWeight.bold;

  static TextTheme _getTextTheme(FontType fontType) {
    const baseTheme = TextTheme(
      displayLarge: TextStyle(fontSize: 57, fontWeight: _boldFontWeight),
      displayMedium: TextStyle(fontSize: 45, fontWeight: _boldFontWeight),
      displaySmall: TextStyle(fontSize: 36, fontWeight: _boldFontWeight),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: _boldFontWeight),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: _boldFontWeight),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: _boldFontWeight),
      titleLarge: TextStyle(fontSize: 22, fontWeight: _boldFontWeight),
      titleMedium: TextStyle(fontSize: 16, fontWeight: _boldFontWeight),
      titleSmall: TextStyle(fontSize: 14, fontWeight: _boldFontWeight),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      bodySmall: TextStyle(fontSize: 12),
      labelLarge: TextStyle(fontSize: 14, fontWeight: _boldFontWeight),
      labelMedium: TextStyle(fontSize: 12, fontWeight: _boldFontWeight),
      labelSmall: TextStyle(fontSize: 11, fontWeight: _boldFontWeight),
    );

    if (fontType is GoogleFontEntity) {
      try {
        return GoogleFonts.getTextTheme(
          fontType.family,
          baseTheme,
        );
      } catch (e) {
        return baseTheme;
      }
    }

    return baseTheme;
  }
}
