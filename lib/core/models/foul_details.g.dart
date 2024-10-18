// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foul_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoulDetailsImpl _$$FoulDetailsImplFromJson(Map<String, dynamic> json) =>
    _$FoulDetailsImpl(
      awayTotal: (json['away_total'] as num?)?.toInt() ?? 0,
      homeTotal: (json['home_total'] as num?)?.toInt() ?? 0,
      awayTwoMinute: (json['away_two_minute'] as num?)?.toInt() ?? 0,
      homeTwoMinute: (json['home_two_minute'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FoulDetailsImplToJson(_$FoulDetailsImpl instance) =>
    <String, dynamic>{
      'away_total': instance.awayTotal,
      'home_total': instance.homeTotal,
      'away_two_minute': instance.awayTwoMinute,
      'home_two_minute': instance.homeTwoMinute,
    };
