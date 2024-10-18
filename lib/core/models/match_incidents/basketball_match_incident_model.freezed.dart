// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basketball_match_incident_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BasketballMatchIncidentModel _$BasketballMatchIncidentModelFromJson(Map<String, dynamic> json) {
return _BasketballMatchIncidentModel.fromJson(json);
}

/// @nodoc
mixin _$BasketballMatchIncidentModel {

@JsonKey(unknownEnumValue: BasketballMatchIncidentEventType.unknown) BasketballMatchIncidentEventType get event => throw _privateConstructorUsedError;@JsonKey(name: 'event_id') String get eventId => throw _privateConstructorUsedError; SportLeague? get league => throw _privateConstructorUsedError; BasketballMatchIncidentStateMetaData? get meta => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$BasketballMatchIncidentModelCopyWith<BasketballMatchIncidentModel> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $BasketballMatchIncidentModelCopyWith<$Res>  {
  factory $BasketballMatchIncidentModelCopyWith(BasketballMatchIncidentModel value, $Res Function(BasketballMatchIncidentModel) then) = _$BasketballMatchIncidentModelCopyWithImpl<$Res, BasketballMatchIncidentModel>;
@useResult
$Res call({
@JsonKey(unknownEnumValue: BasketballMatchIncidentEventType.unknown) BasketballMatchIncidentEventType event,@JsonKey(name: 'event_id') String eventId, SportLeague? league, BasketballMatchIncidentStateMetaData? meta
});


$BasketballMatchIncidentStateMetaDataCopyWith<$Res>? get meta;
}

/// @nodoc
class _$BasketballMatchIncidentModelCopyWithImpl<$Res,$Val extends BasketballMatchIncidentModel> implements $BasketballMatchIncidentModelCopyWith<$Res> {
  _$BasketballMatchIncidentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? event = null,Object? eventId = null,Object? league = freezed,Object? meta = freezed,}) {
  return _then(_value.copyWith(
event: null == event ? _value.event : event // ignore: cast_nullable_to_non_nullable
as BasketballMatchIncidentEventType,eventId: null == eventId ? _value.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,league: freezed == league ? _value.league : league // ignore: cast_nullable_to_non_nullable
as SportLeague?,meta: freezed == meta ? _value.meta : meta // ignore: cast_nullable_to_non_nullable
as BasketballMatchIncidentStateMetaData?,
  )as $Val);
}
@override
@pragma('vm:prefer-inline')
$BasketballMatchIncidentStateMetaDataCopyWith<$Res>? get meta {
    if (_value.meta == null) {
    return null;
  }

  return $BasketballMatchIncidentStateMetaDataCopyWith<$Res>(_value.meta!, (value) {
    return _then(_value.copyWith(meta: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$BasketballMatchIncidentModelImplCopyWith<$Res> implements $BasketballMatchIncidentModelCopyWith<$Res> {
  factory _$$BasketballMatchIncidentModelImplCopyWith(_$BasketballMatchIncidentModelImpl value, $Res Function(_$BasketballMatchIncidentModelImpl) then) = __$$BasketballMatchIncidentModelImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: BasketballMatchIncidentEventType.unknown) BasketballMatchIncidentEventType event,@JsonKey(name: 'event_id') String eventId, SportLeague? league, BasketballMatchIncidentStateMetaData? meta
});


@override $BasketballMatchIncidentStateMetaDataCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$BasketballMatchIncidentModelImplCopyWithImpl<$Res> extends _$BasketballMatchIncidentModelCopyWithImpl<$Res, _$BasketballMatchIncidentModelImpl> implements _$$BasketballMatchIncidentModelImplCopyWith<$Res> {
  __$$BasketballMatchIncidentModelImplCopyWithImpl(_$BasketballMatchIncidentModelImpl _value, $Res Function(_$BasketballMatchIncidentModelImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? event = null,Object? eventId = null,Object? league = freezed,Object? meta = freezed,}) {
  return _then(_$BasketballMatchIncidentModelImpl(
event: null == event ? _value.event : event // ignore: cast_nullable_to_non_nullable
as BasketballMatchIncidentEventType,eventId: null == eventId ? _value.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,league: freezed == league ? _value.league : league // ignore: cast_nullable_to_non_nullable
as SportLeague?,meta: freezed == meta ? _value.meta : meta // ignore: cast_nullable_to_non_nullable
as BasketballMatchIncidentStateMetaData?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$BasketballMatchIncidentModelImpl  implements _BasketballMatchIncidentModel {
  const _$BasketballMatchIncidentModelImpl({@JsonKey(unknownEnumValue: BasketballMatchIncidentEventType.unknown) required this.event, @JsonKey(name: 'event_id') required this.eventId, this.league, this.meta});

  factory _$BasketballMatchIncidentModelImpl.fromJson(Map<String, dynamic> json) => _$$BasketballMatchIncidentModelImplFromJson(json);

@override@JsonKey(unknownEnumValue: BasketballMatchIncidentEventType.unknown) final  BasketballMatchIncidentEventType event;
@override@JsonKey(name: 'event_id') final  String eventId;
@override final  SportLeague? league;
@override final  BasketballMatchIncidentStateMetaData? meta;

@override
String toString() {
  return 'BasketballMatchIncidentModel(event: $event, eventId: $eventId, league: $league, meta: $meta)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$BasketballMatchIncidentModelImpl&&(identical(other.event, event) || other.event == event)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.league, league) || other.league == league)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,event,eventId,league,meta);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$BasketballMatchIncidentModelImplCopyWith<_$BasketballMatchIncidentModelImpl> get copyWith => __$$BasketballMatchIncidentModelImplCopyWithImpl<_$BasketballMatchIncidentModelImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$BasketballMatchIncidentModelImplToJson(this, );
}
}


abstract class _BasketballMatchIncidentModel implements BasketballMatchIncidentModel {
  const factory _BasketballMatchIncidentModel({@JsonKey(unknownEnumValue: BasketballMatchIncidentEventType.unknown) required final  BasketballMatchIncidentEventType event, @JsonKey(name: 'event_id') required final  String eventId, final  SportLeague? league, final  BasketballMatchIncidentStateMetaData? meta}) = _$BasketballMatchIncidentModelImpl;
  

  factory _BasketballMatchIncidentModel.fromJson(Map<String, dynamic> json) = _$BasketballMatchIncidentModelImpl.fromJson;

@override @JsonKey(unknownEnumValue: BasketballMatchIncidentEventType.unknown) BasketballMatchIncidentEventType get event;@override @JsonKey(name: 'event_id') String get eventId;@override  SportLeague? get league;@override  BasketballMatchIncidentStateMetaData? get meta;
@override @JsonKey(ignore: true)
_$$BasketballMatchIncidentModelImplCopyWith<_$BasketballMatchIncidentModelImpl> get copyWith => throw _privateConstructorUsedError;

}

BasketballMatchIncidentStateMetaData _$BasketballMatchIncidentStateMetaDataFromJson(Map<String, dynamic> json) {
return _BasketballMatchIncidentStateMetaData.fromJson(json);
}

/// @nodoc
mixin _$BasketballMatchIncidentStateMetaData {

 HomeOrAway? get side => throw _privateConstructorUsedError; int? get period => throw _privateConstructorUsedError; int? get attempts => throw _privateConstructorUsedError; int? get attempt => throw _privateConstructorUsedError; int? get remaining => throw _privateConstructorUsedError; int? get points => throw _privateConstructorUsedError; HomeOrAway? get possession => throw _privateConstructorUsedError; HomeOrAway? get possessionArrow => throw _privateConstructorUsedError; FoulType? get type => throw _privateConstructorUsedError; String? get reason => throw _privateConstructorUsedError; int? get gameClock => throw _privateConstructorUsedError; int? get homeTeamFouls => throw _privateConstructorUsedError; int? get awayTeamFouls => throw _privateConstructorUsedError; bool? get homeTeamBonus => throw _privateConstructorUsedError; bool? get awayTeamBonus => throw _privateConstructorUsedError; bool? get homeTeamDoubleBonus => throw _privateConstructorUsedError; bool? get awayTeamDoubleBonus => throw _privateConstructorUsedError; int? get homeScore => throw _privateConstructorUsedError; int? get awayScore => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$BasketballMatchIncidentStateMetaDataCopyWith<BasketballMatchIncidentStateMetaData> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $BasketballMatchIncidentStateMetaDataCopyWith<$Res>  {
  factory $BasketballMatchIncidentStateMetaDataCopyWith(BasketballMatchIncidentStateMetaData value, $Res Function(BasketballMatchIncidentStateMetaData) then) = _$BasketballMatchIncidentStateMetaDataCopyWithImpl<$Res, BasketballMatchIncidentStateMetaData>;
@useResult
$Res call({
 HomeOrAway? side, int? period, int? attempts, int? attempt, int? remaining, int? points, HomeOrAway? possession, HomeOrAway? possessionArrow, FoulType? type, String? reason, int? gameClock, int? homeTeamFouls, int? awayTeamFouls, bool? homeTeamBonus, bool? awayTeamBonus, bool? homeTeamDoubleBonus, bool? awayTeamDoubleBonus, int? homeScore, int? awayScore
});



}

/// @nodoc
class _$BasketballMatchIncidentStateMetaDataCopyWithImpl<$Res,$Val extends BasketballMatchIncidentStateMetaData> implements $BasketballMatchIncidentStateMetaDataCopyWith<$Res> {
  _$BasketballMatchIncidentStateMetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? side = freezed,Object? period = freezed,Object? attempts = freezed,Object? attempt = freezed,Object? remaining = freezed,Object? points = freezed,Object? possession = freezed,Object? possessionArrow = freezed,Object? type = freezed,Object? reason = freezed,Object? gameClock = freezed,Object? homeTeamFouls = freezed,Object? awayTeamFouls = freezed,Object? homeTeamBonus = freezed,Object? awayTeamBonus = freezed,Object? homeTeamDoubleBonus = freezed,Object? awayTeamDoubleBonus = freezed,Object? homeScore = freezed,Object? awayScore = freezed,}) {
  return _then(_value.copyWith(
side: freezed == side ? _value.side : side // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,period: freezed == period ? _value.period : period // ignore: cast_nullable_to_non_nullable
as int?,attempts: freezed == attempts ? _value.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int?,attempt: freezed == attempt ? _value.attempt : attempt // ignore: cast_nullable_to_non_nullable
as int?,remaining: freezed == remaining ? _value.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int?,points: freezed == points ? _value.points : points // ignore: cast_nullable_to_non_nullable
as int?,possession: freezed == possession ? _value.possession : possession // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,possessionArrow: freezed == possessionArrow ? _value.possessionArrow : possessionArrow // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,type: freezed == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as FoulType?,reason: freezed == reason ? _value.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,gameClock: freezed == gameClock ? _value.gameClock : gameClock // ignore: cast_nullable_to_non_nullable
as int?,homeTeamFouls: freezed == homeTeamFouls ? _value.homeTeamFouls : homeTeamFouls // ignore: cast_nullable_to_non_nullable
as int?,awayTeamFouls: freezed == awayTeamFouls ? _value.awayTeamFouls : awayTeamFouls // ignore: cast_nullable_to_non_nullable
as int?,homeTeamBonus: freezed == homeTeamBonus ? _value.homeTeamBonus : homeTeamBonus // ignore: cast_nullable_to_non_nullable
as bool?,awayTeamBonus: freezed == awayTeamBonus ? _value.awayTeamBonus : awayTeamBonus // ignore: cast_nullable_to_non_nullable
as bool?,homeTeamDoubleBonus: freezed == homeTeamDoubleBonus ? _value.homeTeamDoubleBonus : homeTeamDoubleBonus // ignore: cast_nullable_to_non_nullable
as bool?,awayTeamDoubleBonus: freezed == awayTeamDoubleBonus ? _value.awayTeamDoubleBonus : awayTeamDoubleBonus // ignore: cast_nullable_to_non_nullable
as bool?,homeScore: freezed == homeScore ? _value.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as int?,awayScore: freezed == awayScore ? _value.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as int?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$BasketballMatchIncidentStateMetaDataImplCopyWith<$Res> implements $BasketballMatchIncidentStateMetaDataCopyWith<$Res> {
  factory _$$BasketballMatchIncidentStateMetaDataImplCopyWith(_$BasketballMatchIncidentStateMetaDataImpl value, $Res Function(_$BasketballMatchIncidentStateMetaDataImpl) then) = __$$BasketballMatchIncidentStateMetaDataImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 HomeOrAway? side, int? period, int? attempts, int? attempt, int? remaining, int? points, HomeOrAway? possession, HomeOrAway? possessionArrow, FoulType? type, String? reason, int? gameClock, int? homeTeamFouls, int? awayTeamFouls, bool? homeTeamBonus, bool? awayTeamBonus, bool? homeTeamDoubleBonus, bool? awayTeamDoubleBonus, int? homeScore, int? awayScore
});



}

/// @nodoc
class __$$BasketballMatchIncidentStateMetaDataImplCopyWithImpl<$Res> extends _$BasketballMatchIncidentStateMetaDataCopyWithImpl<$Res, _$BasketballMatchIncidentStateMetaDataImpl> implements _$$BasketballMatchIncidentStateMetaDataImplCopyWith<$Res> {
  __$$BasketballMatchIncidentStateMetaDataImplCopyWithImpl(_$BasketballMatchIncidentStateMetaDataImpl _value, $Res Function(_$BasketballMatchIncidentStateMetaDataImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? side = freezed,Object? period = freezed,Object? attempts = freezed,Object? attempt = freezed,Object? remaining = freezed,Object? points = freezed,Object? possession = freezed,Object? possessionArrow = freezed,Object? type = freezed,Object? reason = freezed,Object? gameClock = freezed,Object? homeTeamFouls = freezed,Object? awayTeamFouls = freezed,Object? homeTeamBonus = freezed,Object? awayTeamBonus = freezed,Object? homeTeamDoubleBonus = freezed,Object? awayTeamDoubleBonus = freezed,Object? homeScore = freezed,Object? awayScore = freezed,}) {
  return _then(_$BasketballMatchIncidentStateMetaDataImpl(
side: freezed == side ? _value.side : side // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,period: freezed == period ? _value.period : period // ignore: cast_nullable_to_non_nullable
as int?,attempts: freezed == attempts ? _value.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int?,attempt: freezed == attempt ? _value.attempt : attempt // ignore: cast_nullable_to_non_nullable
as int?,remaining: freezed == remaining ? _value.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int?,points: freezed == points ? _value.points : points // ignore: cast_nullable_to_non_nullable
as int?,possession: freezed == possession ? _value.possession : possession // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,possessionArrow: freezed == possessionArrow ? _value.possessionArrow : possessionArrow // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,type: freezed == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as FoulType?,reason: freezed == reason ? _value.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,gameClock: freezed == gameClock ? _value.gameClock : gameClock // ignore: cast_nullable_to_non_nullable
as int?,homeTeamFouls: freezed == homeTeamFouls ? _value.homeTeamFouls : homeTeamFouls // ignore: cast_nullable_to_non_nullable
as int?,awayTeamFouls: freezed == awayTeamFouls ? _value.awayTeamFouls : awayTeamFouls // ignore: cast_nullable_to_non_nullable
as int?,homeTeamBonus: freezed == homeTeamBonus ? _value.homeTeamBonus : homeTeamBonus // ignore: cast_nullable_to_non_nullable
as bool?,awayTeamBonus: freezed == awayTeamBonus ? _value.awayTeamBonus : awayTeamBonus // ignore: cast_nullable_to_non_nullable
as bool?,homeTeamDoubleBonus: freezed == homeTeamDoubleBonus ? _value.homeTeamDoubleBonus : homeTeamDoubleBonus // ignore: cast_nullable_to_non_nullable
as bool?,awayTeamDoubleBonus: freezed == awayTeamDoubleBonus ? _value.awayTeamDoubleBonus : awayTeamDoubleBonus // ignore: cast_nullable_to_non_nullable
as bool?,homeScore: freezed == homeScore ? _value.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as int?,awayScore: freezed == awayScore ? _value.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$BasketballMatchIncidentStateMetaDataImpl  implements _BasketballMatchIncidentStateMetaData {
  const _$BasketballMatchIncidentStateMetaDataImpl({this.side, this.period, this.attempts, this.attempt, this.remaining, this.points, this.possession, this.possessionArrow, this.type, this.reason, this.gameClock, this.homeTeamFouls, this.awayTeamFouls, this.homeTeamBonus, this.awayTeamBonus, this.homeTeamDoubleBonus, this.awayTeamDoubleBonus, this.homeScore, this.awayScore});

  factory _$BasketballMatchIncidentStateMetaDataImpl.fromJson(Map<String, dynamic> json) => _$$BasketballMatchIncidentStateMetaDataImplFromJson(json);

@override final  HomeOrAway? side;
@override final  int? period;
@override final  int? attempts;
@override final  int? attempt;
@override final  int? remaining;
@override final  int? points;
@override final  HomeOrAway? possession;
@override final  HomeOrAway? possessionArrow;
@override final  FoulType? type;
@override final  String? reason;
@override final  int? gameClock;
@override final  int? homeTeamFouls;
@override final  int? awayTeamFouls;
@override final  bool? homeTeamBonus;
@override final  bool? awayTeamBonus;
@override final  bool? homeTeamDoubleBonus;
@override final  bool? awayTeamDoubleBonus;
@override final  int? homeScore;
@override final  int? awayScore;

@override
String toString() {
  return 'BasketballMatchIncidentStateMetaData(side: $side, period: $period, attempts: $attempts, attempt: $attempt, remaining: $remaining, points: $points, possession: $possession, possessionArrow: $possessionArrow, type: $type, reason: $reason, gameClock: $gameClock, homeTeamFouls: $homeTeamFouls, awayTeamFouls: $awayTeamFouls, homeTeamBonus: $homeTeamBonus, awayTeamBonus: $awayTeamBonus, homeTeamDoubleBonus: $homeTeamDoubleBonus, awayTeamDoubleBonus: $awayTeamDoubleBonus, homeScore: $homeScore, awayScore: $awayScore)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$BasketballMatchIncidentStateMetaDataImpl&&(identical(other.side, side) || other.side == side)&&(identical(other.period, period) || other.period == period)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.attempt, attempt) || other.attempt == attempt)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.points, points) || other.points == points)&&(identical(other.possession, possession) || other.possession == possession)&&(identical(other.possessionArrow, possessionArrow) || other.possessionArrow == possessionArrow)&&(identical(other.type, type) || other.type == type)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.gameClock, gameClock) || other.gameClock == gameClock)&&(identical(other.homeTeamFouls, homeTeamFouls) || other.homeTeamFouls == homeTeamFouls)&&(identical(other.awayTeamFouls, awayTeamFouls) || other.awayTeamFouls == awayTeamFouls)&&(identical(other.homeTeamBonus, homeTeamBonus) || other.homeTeamBonus == homeTeamBonus)&&(identical(other.awayTeamBonus, awayTeamBonus) || other.awayTeamBonus == awayTeamBonus)&&(identical(other.homeTeamDoubleBonus, homeTeamDoubleBonus) || other.homeTeamDoubleBonus == homeTeamDoubleBonus)&&(identical(other.awayTeamDoubleBonus, awayTeamDoubleBonus) || other.awayTeamDoubleBonus == awayTeamDoubleBonus)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hashAll([runtimeType,side,period,attempts,attempt,remaining,points,possession,possessionArrow,type,reason,gameClock,homeTeamFouls,awayTeamFouls,homeTeamBonus,awayTeamBonus,homeTeamDoubleBonus,awayTeamDoubleBonus,homeScore,awayScore]);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$BasketballMatchIncidentStateMetaDataImplCopyWith<_$BasketballMatchIncidentStateMetaDataImpl> get copyWith => __$$BasketballMatchIncidentStateMetaDataImplCopyWithImpl<_$BasketballMatchIncidentStateMetaDataImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$BasketballMatchIncidentStateMetaDataImplToJson(this, );
}
}


abstract class _BasketballMatchIncidentStateMetaData implements BasketballMatchIncidentStateMetaData {
  const factory _BasketballMatchIncidentStateMetaData({final  HomeOrAway? side, final  int? period, final  int? attempts, final  int? attempt, final  int? remaining, final  int? points, final  HomeOrAway? possession, final  HomeOrAway? possessionArrow, final  FoulType? type, final  String? reason, final  int? gameClock, final  int? homeTeamFouls, final  int? awayTeamFouls, final  bool? homeTeamBonus, final  bool? awayTeamBonus, final  bool? homeTeamDoubleBonus, final  bool? awayTeamDoubleBonus, final  int? homeScore, final  int? awayScore}) = _$BasketballMatchIncidentStateMetaDataImpl;
  

  factory _BasketballMatchIncidentStateMetaData.fromJson(Map<String, dynamic> json) = _$BasketballMatchIncidentStateMetaDataImpl.fromJson;

@override  HomeOrAway? get side;@override  int? get period;@override  int? get attempts;@override  int? get attempt;@override  int? get remaining;@override  int? get points;@override  HomeOrAway? get possession;@override  HomeOrAway? get possessionArrow;@override  FoulType? get type;@override  String? get reason;@override  int? get gameClock;@override  int? get homeTeamFouls;@override  int? get awayTeamFouls;@override  bool? get homeTeamBonus;@override  bool? get awayTeamBonus;@override  bool? get homeTeamDoubleBonus;@override  bool? get awayTeamDoubleBonus;@override  int? get homeScore;@override  int? get awayScore;
@override @JsonKey(ignore: true)
_$$BasketballMatchIncidentStateMetaDataImplCopyWith<_$BasketballMatchIncidentStateMetaDataImpl> get copyWith => throw _privateConstructorUsedError;

}
