// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_incident_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InitialFootballPayloadModel _$InitialFootballPayloadModelFromJson(Map<String, dynamic> json) {
return _InitialFootballPayloadModel.fromJson(json);
}

/// @nodoc
mixin _$InitialFootballPayloadModel {

 List<FootballMatchIncidentModel> get plays => throw _privateConstructorUsedError;@JsonKey(name: 'is_covered?') bool get isCovered => throw _privateConstructorUsedError; StatsUpdateResponseModel? get stats => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$InitialFootballPayloadModelCopyWith<InitialFootballPayloadModel> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $InitialFootballPayloadModelCopyWith<$Res>  {
  factory $InitialFootballPayloadModelCopyWith(InitialFootballPayloadModel value, $Res Function(InitialFootballPayloadModel) then) = _$InitialFootballPayloadModelCopyWithImpl<$Res, InitialFootballPayloadModel>;
@useResult
$Res call({
 List<FootballMatchIncidentModel> plays,@JsonKey(name: 'is_covered?') bool isCovered, StatsUpdateResponseModel? stats
});


$StatsUpdateResponseModelCopyWith<$Res>? get stats;
}

/// @nodoc
class _$InitialFootballPayloadModelCopyWithImpl<$Res,$Val extends InitialFootballPayloadModel> implements $InitialFootballPayloadModelCopyWith<$Res> {
  _$InitialFootballPayloadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? plays = null,Object? isCovered = null,Object? stats = freezed,}) {
  return _then(_value.copyWith(
plays: null == plays ? _value.plays : plays // ignore: cast_nullable_to_non_nullable
as List<FootballMatchIncidentModel>,isCovered: null == isCovered ? _value.isCovered : isCovered // ignore: cast_nullable_to_non_nullable
as bool,stats: freezed == stats ? _value.stats : stats // ignore: cast_nullable_to_non_nullable
as StatsUpdateResponseModel?,
  )as $Val);
}
@override
@pragma('vm:prefer-inline')
$StatsUpdateResponseModelCopyWith<$Res>? get stats {
    if (_value.stats == null) {
    return null;
  }

  return $StatsUpdateResponseModelCopyWith<$Res>(_value.stats!, (value) {
    return _then(_value.copyWith(stats: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$InitialFootballPayloadModelImplCopyWith<$Res> implements $InitialFootballPayloadModelCopyWith<$Res> {
  factory _$$InitialFootballPayloadModelImplCopyWith(_$InitialFootballPayloadModelImpl value, $Res Function(_$InitialFootballPayloadModelImpl) then) = __$$InitialFootballPayloadModelImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 List<FootballMatchIncidentModel> plays,@JsonKey(name: 'is_covered?') bool isCovered, StatsUpdateResponseModel? stats
});


@override $StatsUpdateResponseModelCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$InitialFootballPayloadModelImplCopyWithImpl<$Res> extends _$InitialFootballPayloadModelCopyWithImpl<$Res, _$InitialFootballPayloadModelImpl> implements _$$InitialFootballPayloadModelImplCopyWith<$Res> {
  __$$InitialFootballPayloadModelImplCopyWithImpl(_$InitialFootballPayloadModelImpl _value, $Res Function(_$InitialFootballPayloadModelImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? plays = null,Object? isCovered = null,Object? stats = freezed,}) {
  return _then(_$InitialFootballPayloadModelImpl(
plays: null == plays ? _value._plays : plays // ignore: cast_nullable_to_non_nullable
as List<FootballMatchIncidentModel>,isCovered: null == isCovered ? _value.isCovered : isCovered // ignore: cast_nullable_to_non_nullable
as bool,stats: freezed == stats ? _value.stats : stats // ignore: cast_nullable_to_non_nullable
as StatsUpdateResponseModel?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$InitialFootballPayloadModelImpl  implements _InitialFootballPayloadModel {
  const _$InitialFootballPayloadModelImpl({required final  List<FootballMatchIncidentModel> plays, @JsonKey(name: 'is_covered?') required this.isCovered, required this.stats}): _plays = plays;

  factory _$InitialFootballPayloadModelImpl.fromJson(Map<String, dynamic> json) => _$$InitialFootballPayloadModelImplFromJson(json);

 final  List<FootballMatchIncidentModel> _plays;
@override List<FootballMatchIncidentModel> get plays {
  if (_plays is EqualUnmodifiableListView) return _plays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plays);
}

@override@JsonKey(name: 'is_covered?') final  bool isCovered;
@override final  StatsUpdateResponseModel? stats;

@override
String toString() {
  return 'InitialFootballPayloadModel(plays: $plays, isCovered: $isCovered, stats: $stats)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$InitialFootballPayloadModelImpl&&const DeepCollectionEquality().equals(other._plays, _plays)&&(identical(other.isCovered, isCovered) || other.isCovered == isCovered)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_plays),isCovered,stats);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$InitialFootballPayloadModelImplCopyWith<_$InitialFootballPayloadModelImpl> get copyWith => __$$InitialFootballPayloadModelImplCopyWithImpl<_$InitialFootballPayloadModelImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$InitialFootballPayloadModelImplToJson(this, );
}
}


abstract class _InitialFootballPayloadModel implements InitialFootballPayloadModel {
  const factory _InitialFootballPayloadModel({required final  List<FootballMatchIncidentModel> plays, @JsonKey(name: 'is_covered?') required final  bool isCovered, required final  StatsUpdateResponseModel? stats}) = _$InitialFootballPayloadModelImpl;
  

  factory _InitialFootballPayloadModel.fromJson(Map<String, dynamic> json) = _$InitialFootballPayloadModelImpl.fromJson;

@override  List<FootballMatchIncidentModel> get plays;@override @JsonKey(name: 'is_covered?') bool get isCovered;@override  StatsUpdateResponseModel? get stats;
@override @JsonKey(ignore: true)
_$$InitialFootballPayloadModelImplCopyWith<_$InitialFootballPayloadModelImpl> get copyWith => throw _privateConstructorUsedError;

}

InitialBasketballPayloadModel _$InitialBasketballPayloadModelFromJson(Map<String, dynamic> json) {
return _InitialBasketballPayloadModel.fromJson(json);
}

/// @nodoc
mixin _$InitialBasketballPayloadModel {

 List<BasketballMatchIncidentModel> get plays => throw _privateConstructorUsedError;@JsonKey(name: 'is_covered?') bool get isCovered => throw _privateConstructorUsedError; StatsUpdateResponseModel? get stats => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$InitialBasketballPayloadModelCopyWith<InitialBasketballPayloadModel> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $InitialBasketballPayloadModelCopyWith<$Res>  {
  factory $InitialBasketballPayloadModelCopyWith(InitialBasketballPayloadModel value, $Res Function(InitialBasketballPayloadModel) then) = _$InitialBasketballPayloadModelCopyWithImpl<$Res, InitialBasketballPayloadModel>;
@useResult
$Res call({
 List<BasketballMatchIncidentModel> plays,@JsonKey(name: 'is_covered?') bool isCovered, StatsUpdateResponseModel? stats
});


$StatsUpdateResponseModelCopyWith<$Res>? get stats;
}

/// @nodoc
class _$InitialBasketballPayloadModelCopyWithImpl<$Res,$Val extends InitialBasketballPayloadModel> implements $InitialBasketballPayloadModelCopyWith<$Res> {
  _$InitialBasketballPayloadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? plays = null,Object? isCovered = null,Object? stats = freezed,}) {
  return _then(_value.copyWith(
plays: null == plays ? _value.plays : plays // ignore: cast_nullable_to_non_nullable
as List<BasketballMatchIncidentModel>,isCovered: null == isCovered ? _value.isCovered : isCovered // ignore: cast_nullable_to_non_nullable
as bool,stats: freezed == stats ? _value.stats : stats // ignore: cast_nullable_to_non_nullable
as StatsUpdateResponseModel?,
  )as $Val);
}
@override
@pragma('vm:prefer-inline')
$StatsUpdateResponseModelCopyWith<$Res>? get stats {
    if (_value.stats == null) {
    return null;
  }

  return $StatsUpdateResponseModelCopyWith<$Res>(_value.stats!, (value) {
    return _then(_value.copyWith(stats: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$InitialBasketballPayloadModelImplCopyWith<$Res> implements $InitialBasketballPayloadModelCopyWith<$Res> {
  factory _$$InitialBasketballPayloadModelImplCopyWith(_$InitialBasketballPayloadModelImpl value, $Res Function(_$InitialBasketballPayloadModelImpl) then) = __$$InitialBasketballPayloadModelImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 List<BasketballMatchIncidentModel> plays,@JsonKey(name: 'is_covered?') bool isCovered, StatsUpdateResponseModel? stats
});


@override $StatsUpdateResponseModelCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$InitialBasketballPayloadModelImplCopyWithImpl<$Res> extends _$InitialBasketballPayloadModelCopyWithImpl<$Res, _$InitialBasketballPayloadModelImpl> implements _$$InitialBasketballPayloadModelImplCopyWith<$Res> {
  __$$InitialBasketballPayloadModelImplCopyWithImpl(_$InitialBasketballPayloadModelImpl _value, $Res Function(_$InitialBasketballPayloadModelImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? plays = null,Object? isCovered = null,Object? stats = freezed,}) {
  return _then(_$InitialBasketballPayloadModelImpl(
plays: null == plays ? _value._plays : plays // ignore: cast_nullable_to_non_nullable
as List<BasketballMatchIncidentModel>,isCovered: null == isCovered ? _value.isCovered : isCovered // ignore: cast_nullable_to_non_nullable
as bool,stats: freezed == stats ? _value.stats : stats // ignore: cast_nullable_to_non_nullable
as StatsUpdateResponseModel?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$InitialBasketballPayloadModelImpl  implements _InitialBasketballPayloadModel {
  const _$InitialBasketballPayloadModelImpl({required final  List<BasketballMatchIncidentModel> plays, @JsonKey(name: 'is_covered?') required this.isCovered, required this.stats}): _plays = plays;

  factory _$InitialBasketballPayloadModelImpl.fromJson(Map<String, dynamic> json) => _$$InitialBasketballPayloadModelImplFromJson(json);

 final  List<BasketballMatchIncidentModel> _plays;
@override List<BasketballMatchIncidentModel> get plays {
  if (_plays is EqualUnmodifiableListView) return _plays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plays);
}

@override@JsonKey(name: 'is_covered?') final  bool isCovered;
@override final  StatsUpdateResponseModel? stats;

@override
String toString() {
  return 'InitialBasketballPayloadModel(plays: $plays, isCovered: $isCovered, stats: $stats)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$InitialBasketballPayloadModelImpl&&const DeepCollectionEquality().equals(other._plays, _plays)&&(identical(other.isCovered, isCovered) || other.isCovered == isCovered)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_plays),isCovered,stats);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$InitialBasketballPayloadModelImplCopyWith<_$InitialBasketballPayloadModelImpl> get copyWith => __$$InitialBasketballPayloadModelImplCopyWithImpl<_$InitialBasketballPayloadModelImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$InitialBasketballPayloadModelImplToJson(this, );
}
}


abstract class _InitialBasketballPayloadModel implements InitialBasketballPayloadModel {
  const factory _InitialBasketballPayloadModel({required final  List<BasketballMatchIncidentModel> plays, @JsonKey(name: 'is_covered?') required final  bool isCovered, required final  StatsUpdateResponseModel? stats}) = _$InitialBasketballPayloadModelImpl;
  

  factory _InitialBasketballPayloadModel.fromJson(Map<String, dynamic> json) = _$InitialBasketballPayloadModelImpl.fromJson;

@override  List<BasketballMatchIncidentModel> get plays;@override @JsonKey(name: 'is_covered?') bool get isCovered;@override  StatsUpdateResponseModel? get stats;
@override @JsonKey(ignore: true)
_$$InitialBasketballPayloadModelImplCopyWith<_$InitialBasketballPayloadModelImpl> get copyWith => throw _privateConstructorUsedError;

}
