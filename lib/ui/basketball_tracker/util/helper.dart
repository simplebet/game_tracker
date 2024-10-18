import 'dart:js_interop';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/basketball_match_incident_model.dart';
import 'package:game_tracker/ui/shared/text_utils.dart';

@JS('postMessageToWebkit')
external void postMessageToWebkit(String event, String data);

String getPeriodStartText(int period, SportLeague? league) {
  if (league == null) {
    return '';
  }

  /// NBA: Start of 1st/2nd/3rd/4th/OT period - 4 Quarter
  if (league == SportLeague.nba) {
    switch (period) {
      case 1:
      case 2:
      case 3:
      case 4:
        return 'START OF $period${formatOrdinalSuffix(period)} QUARTER';
      case 5:
        return 'START OF OT';
      default:
        if (period > 5) {
          return 'START OF OT${period - 4}';
        }
        return '';
    }
  }

  /// CBB: Start of 1st/2nd/OT period - 2 Half
  switch (period) {
    case 1:
    case 2:
      return 'START OF $period${formatOrdinalSuffix(period)} HALF';
    case 3:
      return 'START OF OT';
    default:
      if (period > 3) {
        return 'START OF OT${period - 2}';
      }
      return '';
  }
}

String getPeriodEndText(int period, SportLeague? league) {
  if (league == null) {
    return '';
  }

  /// NBA: END of 1/2/3/4, OT period - 4
  if (league == SportLeague.nba) {
    switch (period) {
      case 1:
      case 2:
      case 3:
      case 4:
        return 'END OF $period${formatOrdinalSuffix(period)} QUARTER';
      case 5:
        return 'END OF OT';
      default:
        if (period > 5) {
          return 'END OF OT${period - 4}';
        }
        return '';
    }
  }

  /// CBB: END of 1/2, OT period - 2
  switch (period) {
    case 1:
    case 2:
      return 'END OF $period${formatOrdinalSuffix(period)} HALF';
    case 3:
      return 'END OF OT';
    default:
      if (period > 3) {
        return 'END OF OT${period - 2}';
      }
      return '';
  }
}

String getFreeThrowNumberText(BasketballMatchIncidentEventType type) {
  switch (type) {
    case BasketballMatchIncidentEventType.freeThrowAwardedOneAndOne:
      return '1-2';
    case BasketballMatchIncidentEventType.freeThrowAwardedOne:
      return '1';
    case BasketballMatchIncidentEventType.freeThrowAwardedTwo:
      return '2';
    case BasketballMatchIncidentEventType.freeThrowAwardedThree:
      return '3';
    default:
      return '';
  }
}

String getFreeThrowText(BasketballMatchIncidentEventType type) {
  if (type == BasketballMatchIncidentEventType.freeThrowAwardedOne) {
    return 'Free Throw';
  }

  return 'Free Throws';
}
