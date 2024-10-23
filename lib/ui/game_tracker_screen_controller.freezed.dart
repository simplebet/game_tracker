// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_tracker_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameTrackerScreenState _$GameTrackerScreenStateFromJson(Map<String, dynamic> json) {
return _GameTrackerScreenState.fromJson(json);
}

/// @nodoc
mixin _$GameTrackerScreenState {

 List<MatchModel>? get allMatches => throw _privateConstructorUsedError; SportLeague? get league => throw _privateConstructorUsedError; MatchModel? get match => throw _privateConstructorUsedError; List<FootballMatchIncidentModel>? get footballIncidents => throw _privateConstructorUsedError; List<BasketballMatchIncidentModel>? get basketballIncidents => throw _privateConstructorUsedError; List<FootballMatchIncidentModel>? get pastFootballIncidents => throw _privateConstructorUsedError; FootballMatchIncidentDriveListModel? get selectedFootballPlaysList => throw _privateConstructorUsedError; bool get matchIsDisabled => throw _privateConstructorUsedError; bool get matchIsCovered => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$GameTrackerScreenStateCopyWith<GameTrackerScreenState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $GameTrackerScreenStateCopyWith<$Res>  {
  factory $GameTrackerScreenStateCopyWith(GameTrackerScreenState value, $Res Function(GameTrackerScreenState) then) = _$GameTrackerScreenStateCopyWithImpl<$Res, GameTrackerScreenState>;
@useResult
$Res call({
 List<MatchModel>? allMatches, SportLeague? league, MatchModel? match, List<FootballMatchIncidentModel>? footballIncidents, List<BasketballMatchIncidentModel>? basketballIncidents, List<FootballMatchIncidentModel>? pastFootballIncidents, FootballMatchIncidentDriveListModel? selectedFootballPlaysList, bool matchIsDisabled, bool matchIsCovered
});


$MatchModelCopyWith<$Res>? get match;$FootballMatchIncidentDriveListModelCopyWith<$Res>? get selectedFootballPlaysList;
}

/// @nodoc
class _$GameTrackerScreenStateCopyWithImpl<$Res,$Val extends GameTrackerScreenState> implements $GameTrackerScreenStateCopyWith<$Res> {
  _$GameTrackerScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? allMatches = freezed,Object? league = freezed,Object? match = freezed,Object? footballIncidents = freezed,Object? basketballIncidents = freezed,Object? pastFootballIncidents = freezed,Object? selectedFootballPlaysList = freezed,Object? matchIsDisabled = null,Object? matchIsCovered = null,}) {
  return _then(_value.copyWith(
allMatches: freezed == allMatches ? _value.allMatches : allMatches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>?,league: freezed == league ? _value.league : league // ignore: cast_nullable_to_non_nullable
as SportLeague?,match: freezed == match ? _value.match : match // ignore: cast_nullable_to_non_nullable
as MatchModel?,footballIncidents: freezed == footballIncidents ? _value.footballIncidents : footballIncidents // ignore: cast_nullable_to_non_nullable
as List<FootballMatchIncidentModel>?,basketballIncidents: freezed == basketballIncidents ? _value.basketballIncidents : basketballIncidents // ignore: cast_nullable_to_non_nullable
as List<BasketballMatchIncidentModel>?,pastFootballIncidents: freezed == pastFootballIncidents ? _value.pastFootballIncidents : pastFootballIncidents // ignore: cast_nullable_to_non_nullable
as List<FootballMatchIncidentModel>?,selectedFootballPlaysList: freezed == selectedFootballPlaysList ? _value.selectedFootballPlaysList : selectedFootballPlaysList // ignore: cast_nullable_to_non_nullable
as FootballMatchIncidentDriveListModel?,matchIsDisabled: null == matchIsDisabled ? _value.matchIsDisabled : matchIsDisabled // ignore: cast_nullable_to_non_nullable
as bool,matchIsCovered: null == matchIsCovered ? _value.matchIsCovered : matchIsCovered // ignore: cast_nullable_to_non_nullable
as bool,
  )as $Val);
}
@override
@pragma('vm:prefer-inline')
$MatchModelCopyWith<$Res>? get match {
    if (_value.match == null) {
    return null;
  }

  return $MatchModelCopyWith<$Res>(_value.match!, (value) {
    return _then(_value.copyWith(match: value) as $Val);
  });
}@override
@pragma('vm:prefer-inline')
$FootballMatchIncidentDriveListModelCopyWith<$Res>? get selectedFootballPlaysList {
    if (_value.selectedFootballPlaysList == null) {
    return null;
  }

  return $FootballMatchIncidentDriveListModelCopyWith<$Res>(_value.selectedFootballPlaysList!, (value) {
    return _then(_value.copyWith(selectedFootballPlaysList: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$GameTrackerScreenStateImplCopyWith<$Res> implements $GameTrackerScreenStateCopyWith<$Res> {
  factory _$$GameTrackerScreenStateImplCopyWith(_$GameTrackerScreenStateImpl value, $Res Function(_$GameTrackerScreenStateImpl) then) = __$$GameTrackerScreenStateImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 List<MatchModel>? allMatches, SportLeague? league, MatchModel? match, List<FootballMatchIncidentModel>? footballIncidents, List<BasketballMatchIncidentModel>? basketballIncidents, List<FootballMatchIncidentModel>? pastFootballIncidents, FootballMatchIncidentDriveListModel? selectedFootballPlaysList, bool matchIsDisabled, bool matchIsCovered
});


@override $MatchModelCopyWith<$Res>? get match;@override $FootballMatchIncidentDriveListModelCopyWith<$Res>? get selectedFootballPlaysList;
}

/// @nodoc
class __$$GameTrackerScreenStateImplCopyWithImpl<$Res> extends _$GameTrackerScreenStateCopyWithImpl<$Res, _$GameTrackerScreenStateImpl> implements _$$GameTrackerScreenStateImplCopyWith<$Res> {
  __$$GameTrackerScreenStateImplCopyWithImpl(_$GameTrackerScreenStateImpl _value, $Res Function(_$GameTrackerScreenStateImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? allMatches = freezed,Object? league = freezed,Object? match = freezed,Object? footballIncidents = freezed,Object? basketballIncidents = freezed,Object? pastFootballIncidents = freezed,Object? selectedFootballPlaysList = freezed,Object? matchIsDisabled = null,Object? matchIsCovered = null,}) {
  return _then(_$GameTrackerScreenStateImpl(
allMatches: freezed == allMatches ? _value._allMatches : allMatches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>?,league: freezed == league ? _value.league : league // ignore: cast_nullable_to_non_nullable
as SportLeague?,match: freezed == match ? _value.match : match // ignore: cast_nullable_to_non_nullable
as MatchModel?,footballIncidents: freezed == footballIncidents ? _value._footballIncidents : footballIncidents // ignore: cast_nullable_to_non_nullable
as List<FootballMatchIncidentModel>?,basketballIncidents: freezed == basketballIncidents ? _value._basketballIncidents : basketballIncidents // ignore: cast_nullable_to_non_nullable
as List<BasketballMatchIncidentModel>?,pastFootballIncidents: freezed == pastFootballIncidents ? _value._pastFootballIncidents : pastFootballIncidents // ignore: cast_nullable_to_non_nullable
as List<FootballMatchIncidentModel>?,selectedFootballPlaysList: freezed == selectedFootballPlaysList ? _value.selectedFootballPlaysList : selectedFootballPlaysList // ignore: cast_nullable_to_non_nullable
as FootballMatchIncidentDriveListModel?,matchIsDisabled: null == matchIsDisabled ? _value.matchIsDisabled : matchIsDisabled // ignore: cast_nullable_to_non_nullable
as bool,matchIsCovered: null == matchIsCovered ? _value.matchIsCovered : matchIsCovered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$GameTrackerScreenStateImpl  implements _GameTrackerScreenState {
  const _$GameTrackerScreenStateImpl({final  List<MatchModel>? allMatches, this.league, this.match, final  List<FootballMatchIncidentModel>? footballIncidents, final  List<BasketballMatchIncidentModel>? basketballIncidents, final  List<FootballMatchIncidentModel>? pastFootballIncidents, this.selectedFootballPlaysList, this.matchIsDisabled = false, this.matchIsCovered = true}): _allMatches = allMatches,_footballIncidents = footballIncidents,_basketballIncidents = basketballIncidents,_pastFootballIncidents = pastFootballIncidents;

  factory _$GameTrackerScreenStateImpl.fromJson(Map<String, dynamic> json) => _$$GameTrackerScreenStateImplFromJson(json);

 final  List<MatchModel>? _allMatches;
@override List<MatchModel>? get allMatches {
  final value = _allMatches;
  if (value == null) return null;
  if (_allMatches is EqualUnmodifiableListView) return _allMatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  SportLeague? league;
@override final  MatchModel? match;
 final  List<FootballMatchIncidentModel>? _footballIncidents;
@override List<FootballMatchIncidentModel>? get footballIncidents {
  final value = _footballIncidents;
  if (value == null) return null;
  if (_footballIncidents is EqualUnmodifiableListView) return _footballIncidents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<BasketballMatchIncidentModel>? _basketballIncidents;
@override List<BasketballMatchIncidentModel>? get basketballIncidents {
  final value = _basketballIncidents;
  if (value == null) return null;
  if (_basketballIncidents is EqualUnmodifiableListView) return _basketballIncidents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<FootballMatchIncidentModel>? _pastFootballIncidents;
@override List<FootballMatchIncidentModel>? get pastFootballIncidents {
  final value = _pastFootballIncidents;
  if (value == null) return null;
  if (_pastFootballIncidents is EqualUnmodifiableListView) return _pastFootballIncidents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  FootballMatchIncidentDriveListModel? selectedFootballPlaysList;
@override@JsonKey() final  bool matchIsDisabled;
@override@JsonKey() final  bool matchIsCovered;

@override
String toString() {
  return 'GameTrackerScreenState(allMatches: $allMatches, league: $league, match: $match, footballIncidents: $footballIncidents, basketballIncidents: $basketballIncidents, pastFootballIncidents: $pastFootballIncidents, selectedFootballPlaysList: $selectedFootballPlaysList, matchIsDisabled: $matchIsDisabled, matchIsCovered: $matchIsCovered)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$GameTrackerScreenStateImpl&&const DeepCollectionEquality().equals(other._allMatches, _allMatches)&&(identical(other.league, league) || other.league == league)&&(identical(other.match, match) || other.match == match)&&const DeepCollectionEquality().equals(other._footballIncidents, _footballIncidents)&&const DeepCollectionEquality().equals(other._basketballIncidents, _basketballIncidents)&&const DeepCollectionEquality().equals(other._pastFootballIncidents, _pastFootballIncidents)&&(identical(other.selectedFootballPlaysList, selectedFootballPlaysList) || other.selectedFootballPlaysList == selectedFootballPlaysList)&&(identical(other.matchIsDisabled, matchIsDisabled) || other.matchIsDisabled == matchIsDisabled)&&(identical(other.matchIsCovered, matchIsCovered) || other.matchIsCovered == matchIsCovered));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allMatches),league,match,const DeepCollectionEquality().hash(_footballIncidents),const DeepCollectionEquality().hash(_basketballIncidents),const DeepCollectionEquality().hash(_pastFootballIncidents),selectedFootballPlaysList,matchIsDisabled,matchIsCovered);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$GameTrackerScreenStateImplCopyWith<_$GameTrackerScreenStateImpl> get copyWith => __$$GameTrackerScreenStateImplCopyWithImpl<_$GameTrackerScreenStateImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$GameTrackerScreenStateImplToJson(this, );
}
}


abstract class _GameTrackerScreenState implements GameTrackerScreenState {
  const factory _GameTrackerScreenState({final  List<MatchModel>? allMatches, final  SportLeague? league, final  MatchModel? match, final  List<FootballMatchIncidentModel>? footballIncidents, final  List<BasketballMatchIncidentModel>? basketballIncidents, final  List<FootballMatchIncidentModel>? pastFootballIncidents, final  FootballMatchIncidentDriveListModel? selectedFootballPlaysList, final  bool matchIsDisabled, final  bool matchIsCovered}) = _$GameTrackerScreenStateImpl;
  

  factory _GameTrackerScreenState.fromJson(Map<String, dynamic> json) = _$GameTrackerScreenStateImpl.fromJson;

@override  List<MatchModel>? get allMatches;@override  SportLeague? get league;@override  MatchModel? get match;@override  List<FootballMatchIncidentModel>? get footballIncidents;@override  List<BasketballMatchIncidentModel>? get basketballIncidents;@override  List<FootballMatchIncidentModel>? get pastFootballIncidents;@override  FootballMatchIncidentDriveListModel? get selectedFootballPlaysList;@override  bool get matchIsDisabled;@override  bool get matchIsCovered;
@override @JsonKey(ignore: true)
_$$GameTrackerScreenStateImplCopyWith<_$GameTrackerScreenStateImpl> get copyWith => throw _privateConstructorUsedError;

}
