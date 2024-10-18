// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'football_match_incident_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FootballMatchIncidentModel _$FootballMatchIncidentModelFromJson(Map<String, dynamic> json) {
return _FootballMatchIncidentModel.fromJson(json);
}

/// @nodoc
mixin _$FootballMatchIncidentModel {

@JsonKey(unknownEnumValue: FootballMatchIncidentEventType.unknown) FootballMatchIncidentEventType get event => throw _privateConstructorUsedError; String get eventId => throw _privateConstructorUsedError; SportLeague? get league => throw _privateConstructorUsedError; FootballMatchIncidentState? get start => throw _privateConstructorUsedError; FootballMatchIncidentState? get end => throw _privateConstructorUsedError; FootballMatchIncidentStateMetaData? get meta => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$FootballMatchIncidentModelCopyWith<FootballMatchIncidentModel> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $FootballMatchIncidentModelCopyWith<$Res>  {
  factory $FootballMatchIncidentModelCopyWith(FootballMatchIncidentModel value, $Res Function(FootballMatchIncidentModel) then) = _$FootballMatchIncidentModelCopyWithImpl<$Res, FootballMatchIncidentModel>;
@useResult
$Res call({
@JsonKey(unknownEnumValue: FootballMatchIncidentEventType.unknown) FootballMatchIncidentEventType event, String eventId, SportLeague? league, FootballMatchIncidentState? start, FootballMatchIncidentState? end, FootballMatchIncidentStateMetaData? meta
});


$FootballMatchIncidentStateCopyWith<$Res>? get start;$FootballMatchIncidentStateCopyWith<$Res>? get end;$FootballMatchIncidentStateMetaDataCopyWith<$Res>? get meta;
}

/// @nodoc
class _$FootballMatchIncidentModelCopyWithImpl<$Res,$Val extends FootballMatchIncidentModel> implements $FootballMatchIncidentModelCopyWith<$Res> {
  _$FootballMatchIncidentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? event = null,Object? eventId = null,Object? league = freezed,Object? start = freezed,Object? end = freezed,Object? meta = freezed,}) {
  return _then(_value.copyWith(
event: null == event ? _value.event : event // ignore: cast_nullable_to_non_nullable
as FootballMatchIncidentEventType,eventId: null == eventId ? _value.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,league: freezed == league ? _value.league : league // ignore: cast_nullable_to_non_nullable
as SportLeague?,start: freezed == start ? _value.start : start // ignore: cast_nullable_to_non_nullable
as FootballMatchIncidentState?,end: freezed == end ? _value.end : end // ignore: cast_nullable_to_non_nullable
as FootballMatchIncidentState?,meta: freezed == meta ? _value.meta : meta // ignore: cast_nullable_to_non_nullable
as FootballMatchIncidentStateMetaData?,
  )as $Val);
}
@override
@pragma('vm:prefer-inline')
$FootballMatchIncidentStateCopyWith<$Res>? get start {
    if (_value.start == null) {
    return null;
  }

  return $FootballMatchIncidentStateCopyWith<$Res>(_value.start!, (value) {
    return _then(_value.copyWith(start: value) as $Val);
  });
}@override
@pragma('vm:prefer-inline')
$FootballMatchIncidentStateCopyWith<$Res>? get end {
    if (_value.end == null) {
    return null;
  }

  return $FootballMatchIncidentStateCopyWith<$Res>(_value.end!, (value) {
    return _then(_value.copyWith(end: value) as $Val);
  });
}@override
@pragma('vm:prefer-inline')
$FootballMatchIncidentStateMetaDataCopyWith<$Res>? get meta {
    if (_value.meta == null) {
    return null;
  }

  return $FootballMatchIncidentStateMetaDataCopyWith<$Res>(_value.meta!, (value) {
    return _then(_value.copyWith(meta: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$FootballMatchIncidentModelImplCopyWith<$Res> implements $FootballMatchIncidentModelCopyWith<$Res> {
  factory _$$FootballMatchIncidentModelImplCopyWith(_$FootballMatchIncidentModelImpl value, $Res Function(_$FootballMatchIncidentModelImpl) then) = __$$FootballMatchIncidentModelImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: FootballMatchIncidentEventType.unknown) FootballMatchIncidentEventType event, String eventId, SportLeague? league, FootballMatchIncidentState? start, FootballMatchIncidentState? end, FootballMatchIncidentStateMetaData? meta
});


@override $FootballMatchIncidentStateCopyWith<$Res>? get start;@override $FootballMatchIncidentStateCopyWith<$Res>? get end;@override $FootballMatchIncidentStateMetaDataCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$FootballMatchIncidentModelImplCopyWithImpl<$Res> extends _$FootballMatchIncidentModelCopyWithImpl<$Res, _$FootballMatchIncidentModelImpl> implements _$$FootballMatchIncidentModelImplCopyWith<$Res> {
  __$$FootballMatchIncidentModelImplCopyWithImpl(_$FootballMatchIncidentModelImpl _value, $Res Function(_$FootballMatchIncidentModelImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? event = null,Object? eventId = null,Object? league = freezed,Object? start = freezed,Object? end = freezed,Object? meta = freezed,}) {
  return _then(_$FootballMatchIncidentModelImpl(
event: null == event ? _value.event : event // ignore: cast_nullable_to_non_nullable
as FootballMatchIncidentEventType,eventId: null == eventId ? _value.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,league: freezed == league ? _value.league : league // ignore: cast_nullable_to_non_nullable
as SportLeague?,start: freezed == start ? _value.start : start // ignore: cast_nullable_to_non_nullable
as FootballMatchIncidentState?,end: freezed == end ? _value.end : end // ignore: cast_nullable_to_non_nullable
as FootballMatchIncidentState?,meta: freezed == meta ? _value.meta : meta // ignore: cast_nullable_to_non_nullable
as FootballMatchIncidentStateMetaData?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$FootballMatchIncidentModelImpl  with DiagnosticableTreeMixin implements _FootballMatchIncidentModel {
  const _$FootballMatchIncidentModelImpl({@JsonKey(unknownEnumValue: FootballMatchIncidentEventType.unknown) required this.event, required this.eventId, this.league, this.start, this.end, this.meta});

  factory _$FootballMatchIncidentModelImpl.fromJson(Map<String, dynamic> json) => _$$FootballMatchIncidentModelImplFromJson(json);

@override@JsonKey(unknownEnumValue: FootballMatchIncidentEventType.unknown) final  FootballMatchIncidentEventType event;
@override final  String eventId;
@override final  SportLeague? league;
@override final  FootballMatchIncidentState? start;
@override final  FootballMatchIncidentState? end;
@override final  FootballMatchIncidentStateMetaData? meta;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FootballMatchIncidentModel(event: $event, eventId: $eventId, league: $league, start: $start, end: $end, meta: $meta)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'FootballMatchIncidentModel'))
    ..add(DiagnosticsProperty('event', event))..add(DiagnosticsProperty('eventId', eventId))..add(DiagnosticsProperty('league', league))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('meta', meta));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$FootballMatchIncidentModelImpl&&(identical(other.event, event) || other.event == event)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.league, league) || other.league == league)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,event,eventId,league,start,end,meta);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$FootballMatchIncidentModelImplCopyWith<_$FootballMatchIncidentModelImpl> get copyWith => __$$FootballMatchIncidentModelImplCopyWithImpl<_$FootballMatchIncidentModelImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$FootballMatchIncidentModelImplToJson(this, );
}
}


abstract class _FootballMatchIncidentModel implements FootballMatchIncidentModel {
  const factory _FootballMatchIncidentModel({@JsonKey(unknownEnumValue: FootballMatchIncidentEventType.unknown) required final  FootballMatchIncidentEventType event, required final  String eventId, final  SportLeague? league, final  FootballMatchIncidentState? start, final  FootballMatchIncidentState? end, final  FootballMatchIncidentStateMetaData? meta}) = _$FootballMatchIncidentModelImpl;
  

  factory _FootballMatchIncidentModel.fromJson(Map<String, dynamic> json) = _$FootballMatchIncidentModelImpl.fromJson;

@override @JsonKey(unknownEnumValue: FootballMatchIncidentEventType.unknown) FootballMatchIncidentEventType get event;@override  String get eventId;@override  SportLeague? get league;@override  FootballMatchIncidentState? get start;@override  FootballMatchIncidentState? get end;@override  FootballMatchIncidentStateMetaData? get meta;
@override @JsonKey(ignore: true)
_$$FootballMatchIncidentModelImplCopyWith<_$FootballMatchIncidentModelImpl> get copyWith => throw _privateConstructorUsedError;

}

FootballMatchIncidentState _$FootballMatchIncidentStateFromJson(Map<String, dynamic> json) {
return _FootballMatchIncidentState.fromJson(json);
}

/// @nodoc
mixin _$FootballMatchIncidentState {

 int? get distance => throw _privateConstructorUsedError; int? get down => throw _privateConstructorUsedError; HomeOrAway? get possession => throw _privateConstructorUsedError; HomeOrAway? get side => throw _privateConstructorUsedError; int? get yardline => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$FootballMatchIncidentStateCopyWith<FootballMatchIncidentState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $FootballMatchIncidentStateCopyWith<$Res>  {
  factory $FootballMatchIncidentStateCopyWith(FootballMatchIncidentState value, $Res Function(FootballMatchIncidentState) then) = _$FootballMatchIncidentStateCopyWithImpl<$Res, FootballMatchIncidentState>;
@useResult
$Res call({
 int? distance, int? down, HomeOrAway? possession, HomeOrAway? side, int? yardline
});



}

/// @nodoc
class _$FootballMatchIncidentStateCopyWithImpl<$Res,$Val extends FootballMatchIncidentState> implements $FootballMatchIncidentStateCopyWith<$Res> {
  _$FootballMatchIncidentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? distance = freezed,Object? down = freezed,Object? possession = freezed,Object? side = freezed,Object? yardline = freezed,}) {
  return _then(_value.copyWith(
distance: freezed == distance ? _value.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,down: freezed == down ? _value.down : down // ignore: cast_nullable_to_non_nullable
as int?,possession: freezed == possession ? _value.possession : possession // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,side: freezed == side ? _value.side : side // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,yardline: freezed == yardline ? _value.yardline : yardline // ignore: cast_nullable_to_non_nullable
as int?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$FootballMatchIncidentStateImplCopyWith<$Res> implements $FootballMatchIncidentStateCopyWith<$Res> {
  factory _$$FootballMatchIncidentStateImplCopyWith(_$FootballMatchIncidentStateImpl value, $Res Function(_$FootballMatchIncidentStateImpl) then) = __$$FootballMatchIncidentStateImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int? distance, int? down, HomeOrAway? possession, HomeOrAway? side, int? yardline
});



}

/// @nodoc
class __$$FootballMatchIncidentStateImplCopyWithImpl<$Res> extends _$FootballMatchIncidentStateCopyWithImpl<$Res, _$FootballMatchIncidentStateImpl> implements _$$FootballMatchIncidentStateImplCopyWith<$Res> {
  __$$FootballMatchIncidentStateImplCopyWithImpl(_$FootballMatchIncidentStateImpl _value, $Res Function(_$FootballMatchIncidentStateImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? distance = freezed,Object? down = freezed,Object? possession = freezed,Object? side = freezed,Object? yardline = freezed,}) {
  return _then(_$FootballMatchIncidentStateImpl(
distance: freezed == distance ? _value.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,down: freezed == down ? _value.down : down // ignore: cast_nullable_to_non_nullable
as int?,possession: freezed == possession ? _value.possession : possession // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,side: freezed == side ? _value.side : side // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,yardline: freezed == yardline ? _value.yardline : yardline // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$FootballMatchIncidentStateImpl  with DiagnosticableTreeMixin implements _FootballMatchIncidentState {
  const _$FootballMatchIncidentStateImpl({this.distance, this.down, this.possession, this.side, this.yardline});

  factory _$FootballMatchIncidentStateImpl.fromJson(Map<String, dynamic> json) => _$$FootballMatchIncidentStateImplFromJson(json);

@override final  int? distance;
@override final  int? down;
@override final  HomeOrAway? possession;
@override final  HomeOrAway? side;
@override final  int? yardline;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FootballMatchIncidentState(distance: $distance, down: $down, possession: $possession, side: $side, yardline: $yardline)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'FootballMatchIncidentState'))
    ..add(DiagnosticsProperty('distance', distance))..add(DiagnosticsProperty('down', down))..add(DiagnosticsProperty('possession', possession))..add(DiagnosticsProperty('side', side))..add(DiagnosticsProperty('yardline', yardline));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$FootballMatchIncidentStateImpl&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.down, down) || other.down == down)&&(identical(other.possession, possession) || other.possession == possession)&&(identical(other.side, side) || other.side == side)&&(identical(other.yardline, yardline) || other.yardline == yardline));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,distance,down,possession,side,yardline);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$FootballMatchIncidentStateImplCopyWith<_$FootballMatchIncidentStateImpl> get copyWith => __$$FootballMatchIncidentStateImplCopyWithImpl<_$FootballMatchIncidentStateImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$FootballMatchIncidentStateImplToJson(this, );
}
}


abstract class _FootballMatchIncidentState implements FootballMatchIncidentState {
  const factory _FootballMatchIncidentState({final  int? distance, final  int? down, final  HomeOrAway? possession, final  HomeOrAway? side, final  int? yardline}) = _$FootballMatchIncidentStateImpl;
  

  factory _FootballMatchIncidentState.fromJson(Map<String, dynamic> json) = _$FootballMatchIncidentStateImpl.fromJson;

@override  int? get distance;@override  int? get down;@override  HomeOrAway? get possession;@override  HomeOrAway? get side;@override  int? get yardline;
@override @JsonKey(ignore: true)
_$$FootballMatchIncidentStateImplCopyWith<_$FootballMatchIncidentStateImpl> get copyWith => throw _privateConstructorUsedError;

}

FootballMatchIncidentStateMetaData _$FootballMatchIncidentStateMetaDataFromJson(Map<String, dynamic> json) {
return _FootballMatchIncidentStateMetaData.fromJson(json);
}

/// @nodoc
mixin _$FootballMatchIncidentStateMetaData {

 int get driveNumber => throw _privateConstructorUsedError; int get playNumber => throw _privateConstructorUsedError; int? get period => throw _privateConstructorUsedError; bool? get correction => throw _privateConstructorUsedError; bool? get goalToGo => throw _privateConstructorUsedError; HomeOrAway? get side => throw _privateConstructorUsedError; HomeOrAway? get winner => throw _privateConstructorUsedError; HomeOrAway? get receiving => throw _privateConstructorUsedError; int? get netYards => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$FootballMatchIncidentStateMetaDataCopyWith<FootballMatchIncidentStateMetaData> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $FootballMatchIncidentStateMetaDataCopyWith<$Res>  {
  factory $FootballMatchIncidentStateMetaDataCopyWith(FootballMatchIncidentStateMetaData value, $Res Function(FootballMatchIncidentStateMetaData) then) = _$FootballMatchIncidentStateMetaDataCopyWithImpl<$Res, FootballMatchIncidentStateMetaData>;
@useResult
$Res call({
 int driveNumber, int playNumber, int? period, bool? correction, bool? goalToGo, HomeOrAway? side, HomeOrAway? winner, HomeOrAway? receiving, int? netYards
});



}

/// @nodoc
class _$FootballMatchIncidentStateMetaDataCopyWithImpl<$Res,$Val extends FootballMatchIncidentStateMetaData> implements $FootballMatchIncidentStateMetaDataCopyWith<$Res> {
  _$FootballMatchIncidentStateMetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? driveNumber = null,Object? playNumber = null,Object? period = freezed,Object? correction = freezed,Object? goalToGo = freezed,Object? side = freezed,Object? winner = freezed,Object? receiving = freezed,Object? netYards = freezed,}) {
  return _then(_value.copyWith(
driveNumber: null == driveNumber ? _value.driveNumber : driveNumber // ignore: cast_nullable_to_non_nullable
as int,playNumber: null == playNumber ? _value.playNumber : playNumber // ignore: cast_nullable_to_non_nullable
as int,period: freezed == period ? _value.period : period // ignore: cast_nullable_to_non_nullable
as int?,correction: freezed == correction ? _value.correction : correction // ignore: cast_nullable_to_non_nullable
as bool?,goalToGo: freezed == goalToGo ? _value.goalToGo : goalToGo // ignore: cast_nullable_to_non_nullable
as bool?,side: freezed == side ? _value.side : side // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,winner: freezed == winner ? _value.winner : winner // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,receiving: freezed == receiving ? _value.receiving : receiving // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,netYards: freezed == netYards ? _value.netYards : netYards // ignore: cast_nullable_to_non_nullable
as int?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$FootballMatchIncidentStateMetaDataImplCopyWith<$Res> implements $FootballMatchIncidentStateMetaDataCopyWith<$Res> {
  factory _$$FootballMatchIncidentStateMetaDataImplCopyWith(_$FootballMatchIncidentStateMetaDataImpl value, $Res Function(_$FootballMatchIncidentStateMetaDataImpl) then) = __$$FootballMatchIncidentStateMetaDataImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int driveNumber, int playNumber, int? period, bool? correction, bool? goalToGo, HomeOrAway? side, HomeOrAway? winner, HomeOrAway? receiving, int? netYards
});



}

/// @nodoc
class __$$FootballMatchIncidentStateMetaDataImplCopyWithImpl<$Res> extends _$FootballMatchIncidentStateMetaDataCopyWithImpl<$Res, _$FootballMatchIncidentStateMetaDataImpl> implements _$$FootballMatchIncidentStateMetaDataImplCopyWith<$Res> {
  __$$FootballMatchIncidentStateMetaDataImplCopyWithImpl(_$FootballMatchIncidentStateMetaDataImpl _value, $Res Function(_$FootballMatchIncidentStateMetaDataImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? driveNumber = null,Object? playNumber = null,Object? period = freezed,Object? correction = freezed,Object? goalToGo = freezed,Object? side = freezed,Object? winner = freezed,Object? receiving = freezed,Object? netYards = freezed,}) {
  return _then(_$FootballMatchIncidentStateMetaDataImpl(
driveNumber: null == driveNumber ? _value.driveNumber : driveNumber // ignore: cast_nullable_to_non_nullable
as int,playNumber: null == playNumber ? _value.playNumber : playNumber // ignore: cast_nullable_to_non_nullable
as int,period: freezed == period ? _value.period : period // ignore: cast_nullable_to_non_nullable
as int?,correction: freezed == correction ? _value.correction : correction // ignore: cast_nullable_to_non_nullable
as bool?,goalToGo: freezed == goalToGo ? _value.goalToGo : goalToGo // ignore: cast_nullable_to_non_nullable
as bool?,side: freezed == side ? _value.side : side // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,winner: freezed == winner ? _value.winner : winner // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,receiving: freezed == receiving ? _value.receiving : receiving // ignore: cast_nullable_to_non_nullable
as HomeOrAway?,netYards: freezed == netYards ? _value.netYards : netYards // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$FootballMatchIncidentStateMetaDataImpl  with DiagnosticableTreeMixin implements _FootballMatchIncidentStateMetaData {
  const _$FootballMatchIncidentStateMetaDataImpl({required this.driveNumber, required this.playNumber, this.period, this.correction, this.goalToGo, this.side, this.winner, this.receiving, this.netYards});

  factory _$FootballMatchIncidentStateMetaDataImpl.fromJson(Map<String, dynamic> json) => _$$FootballMatchIncidentStateMetaDataImplFromJson(json);

@override final  int driveNumber;
@override final  int playNumber;
@override final  int? period;
@override final  bool? correction;
@override final  bool? goalToGo;
@override final  HomeOrAway? side;
@override final  HomeOrAway? winner;
@override final  HomeOrAway? receiving;
@override final  int? netYards;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FootballMatchIncidentStateMetaData(driveNumber: $driveNumber, playNumber: $playNumber, period: $period, correction: $correction, goalToGo: $goalToGo, side: $side, winner: $winner, receiving: $receiving, netYards: $netYards)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'FootballMatchIncidentStateMetaData'))
    ..add(DiagnosticsProperty('driveNumber', driveNumber))..add(DiagnosticsProperty('playNumber', playNumber))..add(DiagnosticsProperty('period', period))..add(DiagnosticsProperty('correction', correction))..add(DiagnosticsProperty('goalToGo', goalToGo))..add(DiagnosticsProperty('side', side))..add(DiagnosticsProperty('winner', winner))..add(DiagnosticsProperty('receiving', receiving))..add(DiagnosticsProperty('netYards', netYards));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$FootballMatchIncidentStateMetaDataImpl&&(identical(other.driveNumber, driveNumber) || other.driveNumber == driveNumber)&&(identical(other.playNumber, playNumber) || other.playNumber == playNumber)&&(identical(other.period, period) || other.period == period)&&(identical(other.correction, correction) || other.correction == correction)&&(identical(other.goalToGo, goalToGo) || other.goalToGo == goalToGo)&&(identical(other.side, side) || other.side == side)&&(identical(other.winner, winner) || other.winner == winner)&&(identical(other.receiving, receiving) || other.receiving == receiving)&&(identical(other.netYards, netYards) || other.netYards == netYards));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,driveNumber,playNumber,period,correction,goalToGo,side,winner,receiving,netYards);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$FootballMatchIncidentStateMetaDataImplCopyWith<_$FootballMatchIncidentStateMetaDataImpl> get copyWith => __$$FootballMatchIncidentStateMetaDataImplCopyWithImpl<_$FootballMatchIncidentStateMetaDataImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$FootballMatchIncidentStateMetaDataImplToJson(this, );
}
}


abstract class _FootballMatchIncidentStateMetaData implements FootballMatchIncidentStateMetaData {
  const factory _FootballMatchIncidentStateMetaData({required final  int driveNumber, required final  int playNumber, final  int? period, final  bool? correction, final  bool? goalToGo, final  HomeOrAway? side, final  HomeOrAway? winner, final  HomeOrAway? receiving, final  int? netYards}) = _$FootballMatchIncidentStateMetaDataImpl;
  

  factory _FootballMatchIncidentStateMetaData.fromJson(Map<String, dynamic> json) = _$FootballMatchIncidentStateMetaDataImpl.fromJson;

@override  int get driveNumber;@override  int get playNumber;@override  int? get period;@override  bool? get correction;@override  bool? get goalToGo;@override  HomeOrAway? get side;@override  HomeOrAway? get winner;@override  HomeOrAway? get receiving;@override  int? get netYards;
@override @JsonKey(ignore: true)
_$$FootballMatchIncidentStateMetaDataImplCopyWith<_$FootballMatchIncidentStateMetaDataImpl> get copyWith => throw _privateConstructorUsedError;

}
