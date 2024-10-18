import 'package:game_tracker/ui/shared/enums.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

extension Analytics on Mixpanel {
  void trackEvent(
      {required AnalyticsEvents event,
      String? league,
      String? matchId,
      String? awayTeam,
      String? homeTeam,
      String? status}) {
    track(event.name, properties: {
      'league': league,
      'matchId': matchId,
      'awayTeam': awayTeam,
      'homeTeam': homeTeam,
      'gameStatus': status,
    });
  }
}
