import 'dart:ui';

import 'package:game_tracker/core/models/team_model.dart';

extension HexColor on TeamModel {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color toColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  Color get primaryColor {
    final colorHexPrimaryUppercase = colorHexPrimary?.toUpperCase();

    /// defaulting to black when we receive white/black primary color
    if (colorHexPrimaryUppercase == '#FFFFFF' ||
        colorHexPrimaryUppercase == '#FDF9D8' ||
        colorHexPrimaryUppercase == '#FFF' ||
        colorHexPrimaryUppercase == '#000') {
      return toColor('#000000');
    }

    return toColor(colorHexPrimary!);
  }

  Color get secondaryColor {
    final colorHexSecondaryUppercase = colorHexSecondary?.toUpperCase();

    /// defaulting to black when we receive white/black primary color
    if (colorHexSecondaryUppercase == '#FFFFFF' ||
        colorHexSecondaryUppercase == '#FDF9D8' ||
        colorHexSecondaryUppercase == '#FFF' ||
        colorHexSecondaryUppercase == '#000') {
      return toColor('#000000');
    }

    return toColor(colorHexSecondary!);
  }
}
