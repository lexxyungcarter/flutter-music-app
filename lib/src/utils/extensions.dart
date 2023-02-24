import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  TextStyle? get displayLarge => textTheme.displayLarge?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get displayMedium => textTheme.displayMedium?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get displaySmall => textTheme.displaySmall?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get headlineLarge => textTheme.headlineLarge?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get headlineMedium => textTheme.headlineMedium?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get headlineSmall => textTheme.headlineSmall?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get titleLarge => textTheme.titleLarge?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get titleMedium => textTheme.titleMedium?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get titleSmall => textTheme.titleSmall?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get labelLarge => textTheme.labelLarge?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get labelMedium => textTheme.labelMedium?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get labelSmall => textTheme.labelSmall?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get bodyLarge => textTheme.bodyLarge?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get bodyMedium => textTheme.bodyMedium?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
  TextStyle? get bodySmall => textTheme.bodySmall?.copyWith(
        fontFamily: 'ResidenzGrotesk',
        color: colors.onPrimary,
      );
}

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}

extension DurationString on String {
  /// Assumes a string (roughly) of the format '\d{1,2}:\d{2}'
  Duration toDuration() {
    final chunks = split(':');
    if (chunks.length == 1) {
      throw Exception('Invalid duration string: $this');
    } else if (chunks.length == 2) {
      return Duration(
        minutes: int.parse(chunks[0].trim()),
        seconds: int.parse(chunks[1].trim()),
      );
    } else if (chunks.length == 3) {
      return Duration(
        hours: int.parse(chunks[0].trim()),
        minutes: int.parse(chunks[1].trim()),
        seconds: int.parse(chunks[2].trim()),
      );
    } else {
      throw Exception('Invalid duration string: $this');
    }
  }
}

extension HumanizedDuration on Duration {
  String toHumanizedString() {
    final seconds = '${inSeconds % 60}'.padLeft(2, '0');
    String minutes = '${inMinutes % 60}';
    if (inHours > 0 || inMinutes == 0) {
      minutes = minutes.padLeft(2, '0');
    }
    String value = '$minutes:$seconds';
    if (inHours > 0) {
      value = '$inHours:$minutes:$seconds';
    }
    return value;
  }
}
