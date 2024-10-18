import 'dart:convert';

import 'package:flutter/material.dart';

class GameTrackerSkin {
  GameTrackerSkinColors get colors => GameTrackerSkinColors();

  GameTrackerSkinTextStyles get textStyles => GameTrackerSkinTextStyles();

  GameTrackerSkinIcons get icons => GameTrackerSkinIcons();
}

class GameTrackerSkinColors with GameTrackerSkinColorsMixin {}

mixin GameTrackerSkinColorsMixin {
  Color get field => const Color.fromRGBO(78, 121, 77, 1);

  Color get endZone => const Color.fromRGBO(2, 80, 48, 1);

  Color get attention => const Color.fromRGBO(255, 214, 0, 1);

  Color get negative => const Color.fromRGBO(255, 78, 78, 1);

  Color get grey1 => const Color.fromRGBO(245, 245, 245, 1);

  Color get grey2 => const Color.fromRGBO(198, 194, 194, 1);

  Color get grey3 => const Color.fromRGBO(153, 153, 153, 1);

  Color get grey4 => const Color.fromRGBO(38, 36, 39, 1);

  Color get grey5 => const Color.fromRGBO(0, 0, 0, 1);

  Color get background => const Color.fromRGBO(36, 36, 36, 1);

  Color get scrimmage => const Color.fromRGBO(81, 150, 255, 1);

  Color get basketballSuccess => const Color.fromRGBO(39, 185, 45, 1);

  Color get basketballMiss => const Color.fromRGBO(228, 57, 57, 1);

  Color get basketballGrey1 => const Color.fromRGBO(255, 255, 255, 1);

  Color get basketballGrey2 => const Color.fromRGBO(138, 138, 138, 1);

  Color get basketballGrey3 => const Color.fromRGBO(44, 44, 44, 1);

  Color get basketballGrey4 => const Color.fromRGBO(29, 29, 29, 1);

  Color get playTrayOdd => const Color.fromRGBO(36, 36, 36, 1);

  Color get playTrayEven => const Color.fromRGBO(36, 36, 36, 0.98);

  Color get playTrayTitleColor => const Color.fromRGBO(245, 245, 245, 1);

  Color get footballGreyInfoColor => const Color.fromRGBO(67, 67, 67, 1);

  Color get basketballTimeContainerBackground =>
      const Color.fromRGBO(44, 44, 44, 1);

  Color get basketballStatsBackground => const Color.fromRGBO(44, 44, 44, 1);

  Color get footballFieldEndzoneBorder =>
      const Color.fromRGBO(197, 197, 197, 1);

  Color get footballFieldShimmerBaseColor => const Color(0xFF242424);

  Color get footballFieldShimmerHighlightColor => const Color(0xFF373737);
}

class GameTrackerSkinTextStyles with GameTrackerSkinTextStylesMixin {}

mixin GameTrackerSkinTextStylesMixin {
  TextStyle get body2 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        fontFamily: 'OpenSans',
        fontStyle: FontStyle.normal,
      );

  TextStyle get body1 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        fontFamily: 'OpenSansCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get body4Thick => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        fontFamily: 'OpenSansCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get body4Medium => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontFamily: 'OpenSansCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get body4Thin => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get body5Medium => const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get body5Thick => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w800,
        fontFamily: 'OpenSansCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get header2 => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get body6Thick => const TextStyle(
        fontSize: 8.5,
        fontWeight: FontWeight.w800,
        fontFamily: 'OpenSansCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get header1 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get header2Thin => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get body3 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'OpenSans',
        fontStyle: FontStyle.normal,
      );

  TextStyle get body1Italic => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        fontFamily: 'OpenSansCondensed',
        fontStyle: FontStyle.italic,
      );

  TextStyle get basketballHeader1Medium => const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeader2Black => const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w900,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeader2Medium => const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeader3Extrabold => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeader4Bold => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeader4Medium => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeader5Bold => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeader5Medium => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeader6Bold => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeaderBody1Medium => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeaderBody2Bold => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeaderBody2Medium => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballHeaderBody3Medium => const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get footballTitleMedium => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get footballPlayTraySubtitle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get footballPlayTrayTitle => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get footballMatchStateScore => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get footballMatchStateTeam => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get footballGameClock => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w800,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get footballMatchStateInfo => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        fontFamily: 'OpenSansCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get footballDriveInfoRegular => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w800,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get footballDriveInfoSmall => const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballScore => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballTeamName => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballFoulIndicator => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballBonusIndicator => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballPossessionArrow => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );

  TextStyle get basketballClock => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: 'SairaCondensed',
        fontStyle: FontStyle.normal,
      );
}

class GameTrackerSkinIcons with GameTrackerSkinIconsMixin {}

mixin GameTrackerSkinIconsMixin {
  AssetDescriptor get timeoutWarped => AssetDescriptor(
        name: 'timeoutWarped',
        location: 'assets/icons/timeoutWarped.png',
      );

  AssetDescriptor get basketballMiss => AssetDescriptor(
        name: 'basketballMiss',
        location: 'assets/icons/basketballMiss.png',
      );

  AssetDescriptor get timeout => AssetDescriptor(
        name: 'timeout',
        location: 'assets/icons/timeout.png',
      );

  AssetDescriptor get lastPlay => AssetDescriptor(
        name: 'lastPlay',
        location: 'assets/icons/lastPlay.png',
      );

  AssetDescriptor get possession => AssetDescriptor(
        name: 'possession',
        location: 'assets/icons/possession.png',
      );

  AssetDescriptor get chevron => AssetDescriptor(
        name: 'chevron',
        location: 'assets/icons/chevron.png',
      );

  AssetDescriptor get field => AssetDescriptor(
        name: 'field',
        location: 'assets/icons/field.png',
      );

  AssetDescriptor get basketballMake => AssetDescriptor(
        name: 'basketballMake',
        location: 'assets/icons/basketballMake.png',
      );

  AssetDescriptor get switchView => AssetDescriptor(
        name: 'switchView',
        location: 'assets/icons/switchView.png',
      );

  AssetDescriptor get foul => AssetDescriptor(
        name: 'foul',
        location: 'assets/icons/foul.png',
      );

  AssetDescriptor get foulWarped => AssetDescriptor(
        name: 'foulWarped',
        location: 'assets/icons/foulWarped.png',
      );

  AssetDescriptor get statsViewButton => AssetDescriptor(
        name: 'statsViewButton',
        location: 'assets/icons/statsViewButton.png',
      );

  AssetDescriptor get matchNotCoverd => AssetDescriptor(
        name: 'matchNotCoverd',
        location: 'assets/icons/not_covered_match.png',
      );

  AssetDescriptor get matchDisabled => AssetDescriptor(
        name: 'matchDisabled',
        location: 'assets/icons/disabled_match.png',
      );

  AssetDescriptor get backboard => AssetDescriptor(
        name: 'backboard',
        location: 'assets/images/basketball_backboard_minimized.png',
      );

  AssetDescriptor get matchNotCoverdMiniminzed => AssetDescriptor(
        name: 'matchNotCoverdMiniminzed',
        location: 'assets/icons/game_not_covered_minimzed.png',
      );

  AssetDescriptor get matchDisabledMinimized => AssetDescriptor(
        name: '',
        location: 'assets/icons/disabled_match_minimized.png',
      );
}

class AssetDescriptor {
  AssetDescriptor({
    required this.location,
    required this.name,
    this.data,
  });

  final String location;
  final String name;

  final String? data;

  Image asImage({
    double? width,
    double? height,
    Color? color,
    Key? key,
  }) {
    if (data != null) {
      final String base64String = data!.split('base64,').last;
      return Image.memory(
        base64Decode(base64String),
        key: key,
        width: width,
        height: height,
        color: color,
      );
    }
    return Image.asset(
      location,
      key: key,
      width: width,
      height: height,
      color: color,
    );
  }
}
