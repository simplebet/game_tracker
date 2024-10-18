import 'dart:math';

import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/team_model.dart';

extension TeamNameFormatter on String? {
  /// Only show the first 3 (2 if they are shorter than 3)
  /// characters of team short name
  String formattedTeamName() {
    if (this == null) {
      return '';
    }

    return this!.substring(0, min(3, this!.length)).trim();
  }

  /// parse the last word of `short_name`
  String parseTeamShortName() {
    if (this == null) {
      return '';
    }

    return this!.split(' ').last;
  }
}

extension TeamModelFormatter on TeamModel {
  String get matchStateName {
    if (shortName == null || abbrv == null) {
      return '';
    }

    if (league == SportLeague.cfb) {
      return shortName.formattedTeamName();
    }

    return abbrv.formattedTeamName();
  }

  String get footballFieldName {
    if (shortName == null) {
      return '';
    }

    if (league == SportLeague.cfb) {
      return shortName ?? '';
    }

    return shortName!.split(' ').last;
  }

  String get lastPlayTrayName {
    if (league == SportLeague.nfl) {
      return abbrv ?? '';
    }
    if (league == SportLeague.cfb) {
      return shortName ?? '';
    }

    return shortName!.split(' ').last;
  }
}
