import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

// #1e69c2
// https://m3.material.io/theme-builder#/custom

class AppTheme {
  // Define your seed colors.
  static const Color primarySeedColor = Color(0xFF1f222b);
  static const Color secondarySeedColor = Color(0xFF5f385d);
  static const Color tertiarySeedColor = Color(0xFF8070ff);
  static const Color neutralSeedColor = Color(0xFFffffff);

  // Make a light ColorScheme from the seeds.
  static final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    // Primary key color is required, like seed color ColorScheme.fromSeed.
    primaryKey: primarySeedColor,
    // You can add optional own seeds for secondary and tertiary key colors.
    secondaryKey: secondarySeedColor,
    tertiaryKey: tertiarySeedColor,
    neutralKey: neutralSeedColor,
    // Tone chroma config and tone mapping is optional, if you do not add it
    // you get the config matching Flutter's Material 3 ColorScheme.fromSeed.
    tones: FlexTones.vivid(Brightness.light),
  );

  // Make a dark ColorScheme from the seeds.
  static final ColorScheme schemeDark = SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primaryKey: primarySeedColor,
    secondaryKey: secondarySeedColor,
    tertiaryKey: tertiarySeedColor,
    neutralKey: neutralSeedColor,
    tones: FlexTones.vivid(Brightness.dark),
  );
}
