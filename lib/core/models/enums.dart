import 'package:json_annotation/json_annotation.dart';

enum ResponseStatus { unknown, success, error }

const matchStatusEnumMap = {
  MatchStatus.active: 'active',
  MatchStatus.preMatch: 'prematch',
  MatchStatus.ended: 'ended',
  MatchStatus.quarterEnded: 'quarter_ended',
};

const matchStatusFromString = {
  'active': MatchStatus.active,
  'prematch': MatchStatus.preMatch,
  'ended': MatchStatus.ended,
  'quarter_ended': MatchStatus.quarterEnded,
};

enum MatchStatus {
  unknown,
  @JsonValue('prematch')
  preMatch,
  active,
  ended,
  quarterEnded,
}

enum SportLeague {
  unknown,
  nfl,
  nba,
  mlb,
  cfb,
  cbb,
  ifl,
  liv;

  String get displayedTitle => name.toUpperCase();
}

extension SportLeagueCategory on SportLeague {
  bool get isBasketballLeagues =>
      [SportLeague.cbb, SportLeague.nba].contains(this);

  bool get isFootballLeagues =>
      [SportLeague.nfl, SportLeague.cfb].contains(this);

  bool get isNFL => SportLeague.nfl == this;

  bool get isCFB => SportLeague.cfb == this;

  bool get isBaseballLeagues => [
        SportLeague.mlb,
      ].contains(this);
}

enum HomeOrAway { unknown, home, away, none }

enum EntityType { unknown, player, team, match }

const entityTypeEnumMap = {
  EntityType.player: 'player',
  EntityType.team: 'team',
  EntityType.match: 'match',
};

enum InningType {
  unknown,
  top,
  bottom,
}

extension NameVariations on InningType {
  String get abbreviation {
    switch (this) {
      case InningType.bottom:
        return 'B';
      case InningType.top:
        return 'T';
      default:
        return '';
    }
  }
}

const inningTypeEnumMap = {
  InningType.top: 'Top',
  InningType.bottom: 'Bot',
};

const inningTypeFullnameEnumMap = {
  'Top': InningType.top,
  'Bottom': InningType.bottom,
};
