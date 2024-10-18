// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchesResponseDataModel _$MatchesResponseDataModelFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return _MatchesResponseDataModelSuccess.fromJson(json);
    case 'error':
      return _MatchesResponseDataModelError.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'MatchesResponseDataModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MatchesResponseDataModel {
  ResponseStatus get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MatchListDataModel data, ResponseStatus status)
        success,
    required TResult Function(ErrorResponseModel error, ResponseStatus status)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MatchListDataModel data, ResponseStatus status)? success,
    TResult? Function(ErrorResponseModel error, ResponseStatus status)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MatchListDataModel data, ResponseStatus status)? success,
    TResult Function(ErrorResponseModel error, ResponseStatus status)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchesResponseDataModelSuccess value) success,
    required TResult Function(_MatchesResponseDataModelError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MatchesResponseDataModelSuccess value)? success,
    TResult? Function(_MatchesResponseDataModelError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchesResponseDataModelSuccess value)? success,
    TResult Function(_MatchesResponseDataModelError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchesResponseDataModelCopyWith<MatchesResponseDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesResponseDataModelCopyWith<$Res> {
  factory $MatchesResponseDataModelCopyWith(MatchesResponseDataModel value,
          $Res Function(MatchesResponseDataModel) then) =
      _$MatchesResponseDataModelCopyWithImpl<$Res, MatchesResponseDataModel>;
  @useResult
  $Res call({ResponseStatus status});
}

/// @nodoc
class _$MatchesResponseDataModelCopyWithImpl<$Res,
        $Val extends MatchesResponseDataModel>
    implements $MatchesResponseDataModelCopyWith<$Res> {
  _$MatchesResponseDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResponseStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchesResponseDataModelSuccessImplCopyWith<$Res>
    implements $MatchesResponseDataModelCopyWith<$Res> {
  factory _$$MatchesResponseDataModelSuccessImplCopyWith(
          _$MatchesResponseDataModelSuccessImpl value,
          $Res Function(_$MatchesResponseDataModelSuccessImpl) then) =
      __$$MatchesResponseDataModelSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MatchListDataModel data, ResponseStatus status});

  $MatchListDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$MatchesResponseDataModelSuccessImplCopyWithImpl<$Res>
    extends _$MatchesResponseDataModelCopyWithImpl<$Res,
        _$MatchesResponseDataModelSuccessImpl>
    implements _$$MatchesResponseDataModelSuccessImplCopyWith<$Res> {
  __$$MatchesResponseDataModelSuccessImplCopyWithImpl(
      _$MatchesResponseDataModelSuccessImpl _value,
      $Res Function(_$MatchesResponseDataModelSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_$MatchesResponseDataModelSuccessImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MatchListDataModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResponseStatus,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchListDataModelCopyWith<$Res> get data {
    return $MatchListDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchesResponseDataModelSuccessImpl
    implements _MatchesResponseDataModelSuccess {
  const _$MatchesResponseDataModelSuccessImpl(
      {required this.data,
      this.status = ResponseStatus.success,
      final String? $type})
      : $type = $type ?? 'success';

  factory _$MatchesResponseDataModelSuccessImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MatchesResponseDataModelSuccessImplFromJson(json);

  @override
  final MatchListDataModel data;
  @override
  @JsonKey()
  final ResponseStatus status;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MatchesResponseDataModel.success(data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesResponseDataModelSuccessImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesResponseDataModelSuccessImplCopyWith<
          _$MatchesResponseDataModelSuccessImpl>
      get copyWith => __$$MatchesResponseDataModelSuccessImplCopyWithImpl<
          _$MatchesResponseDataModelSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MatchListDataModel data, ResponseStatus status)
        success,
    required TResult Function(ErrorResponseModel error, ResponseStatus status)
        error,
  }) {
    return success(data, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MatchListDataModel data, ResponseStatus status)? success,
    TResult? Function(ErrorResponseModel error, ResponseStatus status)? error,
  }) {
    return success?.call(data, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MatchListDataModel data, ResponseStatus status)? success,
    TResult Function(ErrorResponseModel error, ResponseStatus status)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchesResponseDataModelSuccess value) success,
    required TResult Function(_MatchesResponseDataModelError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MatchesResponseDataModelSuccess value)? success,
    TResult? Function(_MatchesResponseDataModelError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchesResponseDataModelSuccess value)? success,
    TResult Function(_MatchesResponseDataModelError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchesResponseDataModelSuccessImplToJson(
      this,
    );
  }
}

abstract class _MatchesResponseDataModelSuccess
    implements MatchesResponseDataModel {
  const factory _MatchesResponseDataModelSuccess(
      {required final MatchListDataModel data,
      final ResponseStatus status}) = _$MatchesResponseDataModelSuccessImpl;

  factory _MatchesResponseDataModelSuccess.fromJson(Map<String, dynamic> json) =
      _$MatchesResponseDataModelSuccessImpl.fromJson;

  MatchListDataModel get data;
  @override
  ResponseStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$MatchesResponseDataModelSuccessImplCopyWith<
          _$MatchesResponseDataModelSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchesResponseDataModelErrorImplCopyWith<$Res>
    implements $MatchesResponseDataModelCopyWith<$Res> {
  factory _$$MatchesResponseDataModelErrorImplCopyWith(
          _$MatchesResponseDataModelErrorImpl value,
          $Res Function(_$MatchesResponseDataModelErrorImpl) then) =
      __$$MatchesResponseDataModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ErrorResponseModel error, ResponseStatus status});

  $ErrorResponseModelCopyWith<$Res> get error;
}

/// @nodoc
class __$$MatchesResponseDataModelErrorImplCopyWithImpl<$Res>
    extends _$MatchesResponseDataModelCopyWithImpl<$Res,
        _$MatchesResponseDataModelErrorImpl>
    implements _$$MatchesResponseDataModelErrorImplCopyWith<$Res> {
  __$$MatchesResponseDataModelErrorImplCopyWithImpl(
      _$MatchesResponseDataModelErrorImpl _value,
      $Res Function(_$MatchesResponseDataModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? status = null,
  }) {
    return _then(_$MatchesResponseDataModelErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponseModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResponseStatus,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ErrorResponseModelCopyWith<$Res> get error {
    return $ErrorResponseModelCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchesResponseDataModelErrorImpl
    implements _MatchesResponseDataModelError {
  const _$MatchesResponseDataModelErrorImpl(
      {required this.error,
      this.status = ResponseStatus.error,
      final String? $type})
      : $type = $type ?? 'error';

  factory _$MatchesResponseDataModelErrorImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MatchesResponseDataModelErrorImplFromJson(json);

  @override
  final ErrorResponseModel error;
  @override
  @JsonKey()
  final ResponseStatus status;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MatchesResponseDataModel.error(error: $error, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesResponseDataModelErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesResponseDataModelErrorImplCopyWith<
          _$MatchesResponseDataModelErrorImpl>
      get copyWith => __$$MatchesResponseDataModelErrorImplCopyWithImpl<
          _$MatchesResponseDataModelErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MatchListDataModel data, ResponseStatus status)
        success,
    required TResult Function(ErrorResponseModel error, ResponseStatus status)
        error,
  }) {
    return error(this.error, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MatchListDataModel data, ResponseStatus status)? success,
    TResult? Function(ErrorResponseModel error, ResponseStatus status)? error,
  }) {
    return error?.call(this.error, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MatchListDataModel data, ResponseStatus status)? success,
    TResult Function(ErrorResponseModel error, ResponseStatus status)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchesResponseDataModelSuccess value) success,
    required TResult Function(_MatchesResponseDataModelError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MatchesResponseDataModelSuccess value)? success,
    TResult? Function(_MatchesResponseDataModelError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchesResponseDataModelSuccess value)? success,
    TResult Function(_MatchesResponseDataModelError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchesResponseDataModelErrorImplToJson(
      this,
    );
  }
}

abstract class _MatchesResponseDataModelError
    implements MatchesResponseDataModel {
  const factory _MatchesResponseDataModelError(
      {required final ErrorResponseModel error,
      final ResponseStatus status}) = _$MatchesResponseDataModelErrorImpl;

  factory _MatchesResponseDataModelError.fromJson(Map<String, dynamic> json) =
      _$MatchesResponseDataModelErrorImpl.fromJson;

  ErrorResponseModel get error;
  @override
  ResponseStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$MatchesResponseDataModelErrorImplCopyWith<
          _$MatchesResponseDataModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MatchListDataModel _$MatchListDataModelFromJson(Map<String, dynamic> json) {
  return _MatchListDataModel.fromJson(json);
}

/// @nodoc
mixin _$MatchListDataModel {
  List<MatchModel>? get matches => throw _privateConstructorUsedError;
  MatchModel? get match => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchListDataModelCopyWith<MatchListDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchListDataModelCopyWith<$Res> {
  factory $MatchListDataModelCopyWith(
          MatchListDataModel value, $Res Function(MatchListDataModel) then) =
      _$MatchListDataModelCopyWithImpl<$Res, MatchListDataModel>;
  @useResult
  $Res call({List<MatchModel>? matches, MatchModel? match});

  $MatchModelCopyWith<$Res>? get match;
}

/// @nodoc
class _$MatchListDataModelCopyWithImpl<$Res, $Val extends MatchListDataModel>
    implements $MatchListDataModelCopyWith<$Res> {
  _$MatchListDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matches = freezed,
    Object? match = freezed,
  }) {
    return _then(_value.copyWith(
      matches: freezed == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>?,
      match: freezed == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel?,
    ) as $Val);
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
  }
}

/// @nodoc
abstract class _$$MatchListDataModelImplCopyWith<$Res>
    implements $MatchListDataModelCopyWith<$Res> {
  factory _$$MatchListDataModelImplCopyWith(_$MatchListDataModelImpl value,
          $Res Function(_$MatchListDataModelImpl) then) =
      __$$MatchListDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MatchModel>? matches, MatchModel? match});

  @override
  $MatchModelCopyWith<$Res>? get match;
}

/// @nodoc
class __$$MatchListDataModelImplCopyWithImpl<$Res>
    extends _$MatchListDataModelCopyWithImpl<$Res, _$MatchListDataModelImpl>
    implements _$$MatchListDataModelImplCopyWith<$Res> {
  __$$MatchListDataModelImplCopyWithImpl(_$MatchListDataModelImpl _value,
      $Res Function(_$MatchListDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matches = freezed,
    Object? match = freezed,
  }) {
    return _then(_$MatchListDataModelImpl(
      matches: freezed == matches
          ? _value._matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>?,
      match: freezed == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchListDataModelImpl implements _MatchListDataModel {
  const _$MatchListDataModelImpl({final List<MatchModel>? matches, this.match})
      : _matches = matches;

  factory _$MatchListDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchListDataModelImplFromJson(json);

  final List<MatchModel>? _matches;
  @override
  List<MatchModel>? get matches {
    final value = _matches;
    if (value == null) return null;
    if (_matches is EqualUnmodifiableListView) return _matches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MatchModel? match;

  @override
  String toString() {
    return 'MatchListDataModel(matches: $matches, match: $match)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchListDataModelImpl &&
            const DeepCollectionEquality().equals(other._matches, _matches) &&
            (identical(other.match, match) || other.match == match));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_matches), match);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchListDataModelImplCopyWith<_$MatchListDataModelImpl> get copyWith =>
      __$$MatchListDataModelImplCopyWithImpl<_$MatchListDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchListDataModelImplToJson(
      this,
    );
  }
}

abstract class _MatchListDataModel implements MatchListDataModel {
  const factory _MatchListDataModel(
      {final List<MatchModel>? matches,
      final MatchModel? match}) = _$MatchListDataModelImpl;

  factory _MatchListDataModel.fromJson(Map<String, dynamic> json) =
      _$MatchListDataModelImpl.fromJson;

  @override
  List<MatchModel>? get matches;
  @override
  MatchModel? get match;
  @override
  @JsonKey(ignore: true)
  _$$MatchListDataModelImplCopyWith<_$MatchListDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) {
  switch (json['league']) {
    case 'default':
      return EmptyMatch.fromJson(json);
    case 'nba':
      return BasketballMatch.fromJson(json);
    case 'cbb':
      return CollegeBasketballMatch.fromJson(json);
    case 'nfl':
      return NflFootballMatch.fromJson(json);
    case 'cfb':
      return CollegeFootballMatch.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'league', 'MatchModel',
          'Invalid union type "${json['league']}"!');
  }
}

/// @nodoc
mixin _$MatchModel {
  SportLeague? get league => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team_score')
  int? get awayScore => throw _privateConstructorUsedError;
  TeamModel? get awayTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team_score')
  int? get homeScore => throw _privateConstructorUsedError;
  TeamModel? get homeTeam => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  bool get featured => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  int get period => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: MatchStatus.unknown)
  MatchStatus? get status => throw _privateConstructorUsedError;
  ContestData? get contestData => throw _privateConstructorUsedError;
  String? get network => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)
        $default, {
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        nba,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        cbb,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        nfl,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        cfb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmptyMatch value) $default, {
    required TResult Function(BasketballMatch value) nba,
    required TResult Function(CollegeBasketballMatch value) cbb,
    required TResult Function(NflFootballMatch value) nfl,
    required TResult Function(CollegeFootballMatch value) cfb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmptyMatch value)? $default, {
    TResult? Function(BasketballMatch value)? nba,
    TResult? Function(CollegeBasketballMatch value)? cbb,
    TResult? Function(NflFootballMatch value)? nfl,
    TResult? Function(CollegeFootballMatch value)? cfb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmptyMatch value)? $default, {
    TResult Function(BasketballMatch value)? nba,
    TResult Function(CollegeBasketballMatch value)? cbb,
    TResult Function(NflFootballMatch value)? nfl,
    TResult Function(CollegeFootballMatch value)? cfb,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchModelCopyWith<MatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchModelCopyWith<$Res> {
  factory $MatchModelCopyWith(
          MatchModel value, $Res Function(MatchModel) then) =
      _$MatchModelCopyWithImpl<$Res, MatchModel>;
  @useResult
  $Res call(
      {SportLeague? league,
      @JsonKey(name: 'away_team_score') int? awayScore,
      TeamModel? awayTeam,
      @JsonKey(name: 'home_team_score') int? homeScore,
      TeamModel? homeTeam,
      String? id,
      bool featured,
      DateTime? startTime,
      int period,
      @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
      ContestData? contestData,
      String? network});

  $TeamModelCopyWith<$Res>? get awayTeam;
  $TeamModelCopyWith<$Res>? get homeTeam;
  $ContestDataCopyWith<$Res>? get contestData;
}

/// @nodoc
class _$MatchModelCopyWithImpl<$Res, $Val extends MatchModel>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = freezed,
    Object? awayScore = freezed,
    Object? awayTeam = freezed,
    Object? homeScore = freezed,
    Object? homeTeam = freezed,
    Object? id = freezed,
    Object? featured = null,
    Object? startTime = freezed,
    Object? period = null,
    Object? status = freezed,
    Object? contestData = freezed,
    Object? network = freezed,
  }) {
    return _then(_value.copyWith(
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayTeam: freezed == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      homeTeam: freezed == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchStatus?,
      contestData: freezed == contestData
          ? _value.contestData
          : contestData // ignore: cast_nullable_to_non_nullable
              as ContestData?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamModelCopyWith<$Res>? get awayTeam {
    if (_value.awayTeam == null) {
      return null;
    }

    return $TeamModelCopyWith<$Res>(_value.awayTeam!, (value) {
      return _then(_value.copyWith(awayTeam: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamModelCopyWith<$Res>? get homeTeam {
    if (_value.homeTeam == null) {
      return null;
    }

    return $TeamModelCopyWith<$Res>(_value.homeTeam!, (value) {
      return _then(_value.copyWith(homeTeam: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContestDataCopyWith<$Res>? get contestData {
    if (_value.contestData == null) {
      return null;
    }

    return $ContestDataCopyWith<$Res>(_value.contestData!, (value) {
      return _then(_value.copyWith(contestData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmptyMatchImplCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$EmptyMatchImplCopyWith(
          _$EmptyMatchImpl value, $Res Function(_$EmptyMatchImpl) then) =
      __$$EmptyMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SportLeague? league,
      @JsonKey(name: 'away_team_score') int? awayScore,
      TeamModel? awayTeam,
      @JsonKey(name: 'home_team_score') int? homeScore,
      TeamModel? homeTeam,
      String? id,
      bool featured,
      String? prizeSummary,
      DateTime? startTime,
      int period,
      @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
      ContestData? contestData,
      String? network,
      List<String> categories});

  @override
  $TeamModelCopyWith<$Res>? get awayTeam;
  @override
  $TeamModelCopyWith<$Res>? get homeTeam;
  @override
  $ContestDataCopyWith<$Res>? get contestData;
}

/// @nodoc
class __$$EmptyMatchImplCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$EmptyMatchImpl>
    implements _$$EmptyMatchImplCopyWith<$Res> {
  __$$EmptyMatchImplCopyWithImpl(
      _$EmptyMatchImpl _value, $Res Function(_$EmptyMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = freezed,
    Object? awayScore = freezed,
    Object? awayTeam = freezed,
    Object? homeScore = freezed,
    Object? homeTeam = freezed,
    Object? id = freezed,
    Object? featured = null,
    Object? prizeSummary = freezed,
    Object? startTime = freezed,
    Object? period = null,
    Object? status = freezed,
    Object? contestData = freezed,
    Object? network = freezed,
    Object? categories = null,
  }) {
    return _then(_$EmptyMatchImpl(
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayTeam: freezed == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      homeTeam: freezed == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      prizeSummary: freezed == prizeSummary
          ? _value.prizeSummary
          : prizeSummary // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchStatus?,
      contestData: freezed == contestData
          ? _value.contestData
          : contestData // ignore: cast_nullable_to_non_nullable
              as ContestData?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmptyMatchImpl implements EmptyMatch {
  const _$EmptyMatchImpl(
      {this.league = SportLeague.unknown,
      @JsonKey(name: 'away_team_score') this.awayScore,
      this.awayTeam,
      @JsonKey(name: 'home_team_score') this.homeScore,
      this.homeTeam,
      this.id,
      this.featured = false,
      this.prizeSummary,
      this.startTime,
      this.period = 1,
      @JsonKey(unknownEnumValue: MatchStatus.unknown) this.status,
      this.contestData,
      this.network,
      final List<String> categories = const []})
      : _categories = categories;

  factory _$EmptyMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmptyMatchImplFromJson(json);

  @override
  @JsonKey()
  final SportLeague? league;
  @override
  @JsonKey(name: 'away_team_score')
  final int? awayScore;
  @override
  final TeamModel? awayTeam;
  @override
  @JsonKey(name: 'home_team_score')
  final int? homeScore;
  @override
  final TeamModel? homeTeam;
  @override
  final String? id;
  @override
  @JsonKey()
  final bool featured;
  @override
  final String? prizeSummary;
  @override
  final DateTime? startTime;
  @override
  @JsonKey()
  final int period;
  @override
  @JsonKey(unknownEnumValue: MatchStatus.unknown)
  final MatchStatus? status;
  @override
  final ContestData? contestData;
  @override
  final String? network;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'MatchModel(league: $league, awayScore: $awayScore, awayTeam: $awayTeam, homeScore: $homeScore, homeTeam: $homeTeam, id: $id, featured: $featured, prizeSummary: $prizeSummary, startTime: $startTime, period: $period, status: $status, contestData: $contestData, network: $network, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyMatchImpl &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.prizeSummary, prizeSummary) ||
                other.prizeSummary == prizeSummary) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.contestData, contestData) ||
                other.contestData == contestData) &&
            (identical(other.network, network) || other.network == network) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      league,
      awayScore,
      awayTeam,
      homeScore,
      homeTeam,
      id,
      featured,
      prizeSummary,
      startTime,
      period,
      status,
      contestData,
      network,
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyMatchImplCopyWith<_$EmptyMatchImpl> get copyWith =>
      __$$EmptyMatchImplCopyWithImpl<_$EmptyMatchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)
        $default, {
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        nba,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        cbb,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        nfl,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        cfb,
  }) {
    return $default(
        league,
        awayScore,
        awayTeam,
        homeScore,
        homeTeam,
        id,
        featured,
        prizeSummary,
        startTime,
        period,
        status,
        contestData,
        network,
        categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
  }) {
    return $default?.call(
        league,
        awayScore,
        awayTeam,
        homeScore,
        homeTeam,
        id,
        featured,
        prizeSummary,
        startTime,
        period,
        status,
        contestData,
        network,
        categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          league,
          awayScore,
          awayTeam,
          homeScore,
          homeTeam,
          id,
          featured,
          prizeSummary,
          startTime,
          period,
          status,
          contestData,
          network,
          categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmptyMatch value) $default, {
    required TResult Function(BasketballMatch value) nba,
    required TResult Function(CollegeBasketballMatch value) cbb,
    required TResult Function(NflFootballMatch value) nfl,
    required TResult Function(CollegeFootballMatch value) cfb,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmptyMatch value)? $default, {
    TResult? Function(BasketballMatch value)? nba,
    TResult? Function(CollegeBasketballMatch value)? cbb,
    TResult? Function(NflFootballMatch value)? nfl,
    TResult? Function(CollegeFootballMatch value)? cfb,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmptyMatch value)? $default, {
    TResult Function(BasketballMatch value)? nba,
    TResult Function(CollegeBasketballMatch value)? cbb,
    TResult Function(NflFootballMatch value)? nfl,
    TResult Function(CollegeFootballMatch value)? cfb,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyMatchImplToJson(
      this,
    );
  }
}

abstract class EmptyMatch implements MatchModel {
  const factory EmptyMatch(
      {final SportLeague? league,
      @JsonKey(name: 'away_team_score') final int? awayScore,
      final TeamModel? awayTeam,
      @JsonKey(name: 'home_team_score') final int? homeScore,
      final TeamModel? homeTeam,
      final String? id,
      final bool featured,
      final String? prizeSummary,
      final DateTime? startTime,
      final int period,
      @JsonKey(unknownEnumValue: MatchStatus.unknown) final MatchStatus? status,
      final ContestData? contestData,
      final String? network,
      final List<String> categories}) = _$EmptyMatchImpl;

  factory EmptyMatch.fromJson(Map<String, dynamic> json) =
      _$EmptyMatchImpl.fromJson;

  @override
  SportLeague? get league;
  @override
  @JsonKey(name: 'away_team_score')
  int? get awayScore;
  @override
  TeamModel? get awayTeam;
  @override
  @JsonKey(name: 'home_team_score')
  int? get homeScore;
  @override
  TeamModel? get homeTeam;
  @override
  String? get id;
  @override
  bool get featured;
  String? get prizeSummary;
  @override
  DateTime? get startTime;
  @override
  int get period;
  @override
  @JsonKey(unknownEnumValue: MatchStatus.unknown)
  MatchStatus? get status;
  @override
  ContestData? get contestData;
  @override
  String? get network;
  List<String> get categories;
  @override
  @JsonKey(ignore: true)
  _$$EmptyMatchImplCopyWith<_$EmptyMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BasketballMatchImplCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$BasketballMatchImplCopyWith(_$BasketballMatchImpl value,
          $Res Function(_$BasketballMatchImpl) then) =
      __$$BasketballMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TeamModel? awayTeam,
      TeamModel? homeTeam,
      String? id,
      DateTime? startTime,
      NbaBasketballData? sportData,
      SportLeague? league,
      @JsonKey(name: 'away_team_score') int? awayScore,
      @JsonKey(name: 'home_team_score') int? homeScore,
      bool featured,
      String? prizeSummary,
      int period,
      @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
      ContestData? contestData,
      String? network});

  @override
  $TeamModelCopyWith<$Res>? get awayTeam;
  @override
  $TeamModelCopyWith<$Res>? get homeTeam;
  @override
  $ContestDataCopyWith<$Res>? get contestData;
}

/// @nodoc
class __$$BasketballMatchImplCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$BasketballMatchImpl>
    implements _$$BasketballMatchImplCopyWith<$Res> {
  __$$BasketballMatchImplCopyWithImpl(
      _$BasketballMatchImpl _value, $Res Function(_$BasketballMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awayTeam = freezed,
    Object? homeTeam = freezed,
    Object? id = freezed,
    Object? startTime = freezed,
    Object? sportData = freezed,
    Object? league = freezed,
    Object? awayScore = freezed,
    Object? homeScore = freezed,
    Object? featured = null,
    Object? prizeSummary = freezed,
    Object? period = null,
    Object? status = freezed,
    Object? contestData = freezed,
    Object? network = freezed,
  }) {
    return _then(_$BasketballMatchImpl(
      awayTeam: freezed == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      homeTeam: freezed == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sportData: freezed == sportData
          ? _value.sportData
          : sportData // ignore: cast_nullable_to_non_nullable
              as NbaBasketballData?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      prizeSummary: freezed == prizeSummary
          ? _value.prizeSummary
          : prizeSummary // ignore: cast_nullable_to_non_nullable
              as String?,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchStatus?,
      contestData: freezed == contestData
          ? _value.contestData
          : contestData // ignore: cast_nullable_to_non_nullable
              as ContestData?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasketballMatchImpl implements BasketballMatch {
  const _$BasketballMatchImpl(
      {required this.awayTeam,
      required this.homeTeam,
      required this.id,
      required this.startTime,
      required this.sportData,
      this.league = SportLeague.nba,
      @JsonKey(name: 'away_team_score') this.awayScore,
      @JsonKey(name: 'home_team_score') this.homeScore,
      this.featured = false,
      this.prizeSummary,
      this.period = 1,
      @JsonKey(unknownEnumValue: MatchStatus.unknown)
      this.status = MatchStatus.preMatch,
      this.contestData,
      this.network});

  factory _$BasketballMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasketballMatchImplFromJson(json);

  @override
  final TeamModel? awayTeam;
  @override
  final TeamModel? homeTeam;
  @override
  final String? id;
  @override
  final DateTime? startTime;
  @override
  final NbaBasketballData? sportData;
  @override
  @JsonKey()
  final SportLeague? league;
  @override
  @JsonKey(name: 'away_team_score')
  final int? awayScore;
  @override
  @JsonKey(name: 'home_team_score')
  final int? homeScore;
  @override
  @JsonKey()
  final bool featured;
  @override
  final String? prizeSummary;
  @override
  @JsonKey()
  final int period;
  @override
  @JsonKey(unknownEnumValue: MatchStatus.unknown)
  final MatchStatus? status;
  @override
  final ContestData? contestData;
  @override
  final String? network;

  @override
  String toString() {
    return 'MatchModel.nba(awayTeam: $awayTeam, homeTeam: $homeTeam, id: $id, startTime: $startTime, sportData: $sportData, league: $league, awayScore: $awayScore, homeScore: $homeScore, featured: $featured, prizeSummary: $prizeSummary, period: $period, status: $status, contestData: $contestData, network: $network)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketballMatchImpl &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            const DeepCollectionEquality().equals(other.sportData, sportData) &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.prizeSummary, prizeSummary) ||
                other.prizeSummary == prizeSummary) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.contestData, contestData) ||
                other.contestData == contestData) &&
            (identical(other.network, network) || other.network == network));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      awayTeam,
      homeTeam,
      id,
      startTime,
      const DeepCollectionEquality().hash(sportData),
      league,
      awayScore,
      homeScore,
      featured,
      prizeSummary,
      period,
      status,
      contestData,
      network);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketballMatchImplCopyWith<_$BasketballMatchImpl> get copyWith =>
      __$$BasketballMatchImplCopyWithImpl<_$BasketballMatchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)
        $default, {
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        nba,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        cbb,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        nfl,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        cfb,
  }) {
    return nba(
        awayTeam,
        homeTeam,
        id,
        startTime,
        sportData,
        league,
        awayScore,
        homeScore,
        featured,
        prizeSummary,
        period,
        status,
        contestData,
        network);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
  }) {
    return nba?.call(
        awayTeam,
        homeTeam,
        id,
        startTime,
        sportData,
        league,
        awayScore,
        homeScore,
        featured,
        prizeSummary,
        period,
        status,
        contestData,
        network);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
    required TResult orElse(),
  }) {
    if (nba != null) {
      return nba(
          awayTeam,
          homeTeam,
          id,
          startTime,
          sportData,
          league,
          awayScore,
          homeScore,
          featured,
          prizeSummary,
          period,
          status,
          contestData,
          network);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmptyMatch value) $default, {
    required TResult Function(BasketballMatch value) nba,
    required TResult Function(CollegeBasketballMatch value) cbb,
    required TResult Function(NflFootballMatch value) nfl,
    required TResult Function(CollegeFootballMatch value) cfb,
  }) {
    return nba(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmptyMatch value)? $default, {
    TResult? Function(BasketballMatch value)? nba,
    TResult? Function(CollegeBasketballMatch value)? cbb,
    TResult? Function(NflFootballMatch value)? nfl,
    TResult? Function(CollegeFootballMatch value)? cfb,
  }) {
    return nba?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmptyMatch value)? $default, {
    TResult Function(BasketballMatch value)? nba,
    TResult Function(CollegeBasketballMatch value)? cbb,
    TResult Function(NflFootballMatch value)? nfl,
    TResult Function(CollegeFootballMatch value)? cfb,
    required TResult orElse(),
  }) {
    if (nba != null) {
      return nba(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BasketballMatchImplToJson(
      this,
    );
  }
}

abstract class BasketballMatch implements MatchModel, Match<BasketballData> {
  const factory BasketballMatch(
      {required final TeamModel? awayTeam,
      required final TeamModel? homeTeam,
      required final String? id,
      required final DateTime? startTime,
      required final NbaBasketballData? sportData,
      final SportLeague? league,
      @JsonKey(name: 'away_team_score') final int? awayScore,
      @JsonKey(name: 'home_team_score') final int? homeScore,
      final bool featured,
      final String? prizeSummary,
      final int period,
      @JsonKey(unknownEnumValue: MatchStatus.unknown) final MatchStatus? status,
      final ContestData? contestData,
      final String? network}) = _$BasketballMatchImpl;

  factory BasketballMatch.fromJson(Map<String, dynamic> json) =
      _$BasketballMatchImpl.fromJson;

  @override
  TeamModel? get awayTeam;
  @override
  TeamModel? get homeTeam;
  @override
  String? get id;
  @override
  DateTime? get startTime;
  NbaBasketballData? get sportData;
  @override
  SportLeague? get league;
  @override
  @JsonKey(name: 'away_team_score')
  int? get awayScore;
  @override
  @JsonKey(name: 'home_team_score')
  int? get homeScore;
  @override
  bool get featured;
  String? get prizeSummary;
  @override
  int get period;
  @override
  @JsonKey(unknownEnumValue: MatchStatus.unknown)
  MatchStatus? get status;
  @override
  ContestData? get contestData;
  @override
  String? get network;
  @override
  @JsonKey(ignore: true)
  _$$BasketballMatchImplCopyWith<_$BasketballMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollegeBasketballMatchImplCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$CollegeBasketballMatchImplCopyWith(
          _$CollegeBasketballMatchImpl value,
          $Res Function(_$CollegeBasketballMatchImpl) then) =
      __$$CollegeBasketballMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TeamModel? awayTeam,
      TeamModel? homeTeam,
      String? id,
      DateTime? startTime,
      CollegeBasketballData? sportData,
      SportLeague? league,
      @JsonKey(name: 'away_team_score') int? awayScore,
      @JsonKey(name: 'home_team_score') int? homeScore,
      bool featured,
      String? prizeSummary,
      int period,
      @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
      ContestData? contestData,
      String? network});

  @override
  $TeamModelCopyWith<$Res>? get awayTeam;
  @override
  $TeamModelCopyWith<$Res>? get homeTeam;
  @override
  $ContestDataCopyWith<$Res>? get contestData;
}

/// @nodoc
class __$$CollegeBasketballMatchImplCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$CollegeBasketballMatchImpl>
    implements _$$CollegeBasketballMatchImplCopyWith<$Res> {
  __$$CollegeBasketballMatchImplCopyWithImpl(
      _$CollegeBasketballMatchImpl _value,
      $Res Function(_$CollegeBasketballMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awayTeam = freezed,
    Object? homeTeam = freezed,
    Object? id = freezed,
    Object? startTime = freezed,
    Object? sportData = freezed,
    Object? league = freezed,
    Object? awayScore = freezed,
    Object? homeScore = freezed,
    Object? featured = null,
    Object? prizeSummary = freezed,
    Object? period = null,
    Object? status = freezed,
    Object? contestData = freezed,
    Object? network = freezed,
  }) {
    return _then(_$CollegeBasketballMatchImpl(
      awayTeam: freezed == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      homeTeam: freezed == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sportData: freezed == sportData
          ? _value.sportData
          : sportData // ignore: cast_nullable_to_non_nullable
              as CollegeBasketballData?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      prizeSummary: freezed == prizeSummary
          ? _value.prizeSummary
          : prizeSummary // ignore: cast_nullable_to_non_nullable
              as String?,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchStatus?,
      contestData: freezed == contestData
          ? _value.contestData
          : contestData // ignore: cast_nullable_to_non_nullable
              as ContestData?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollegeBasketballMatchImpl implements CollegeBasketballMatch {
  const _$CollegeBasketballMatchImpl(
      {required this.awayTeam,
      required this.homeTeam,
      required this.id,
      required this.startTime,
      required this.sportData,
      this.league = SportLeague.cbb,
      @JsonKey(name: 'away_team_score') this.awayScore,
      @JsonKey(name: 'home_team_score') this.homeScore,
      this.featured = false,
      this.prizeSummary,
      this.period = 1,
      @JsonKey(unknownEnumValue: MatchStatus.unknown)
      this.status = MatchStatus.preMatch,
      this.contestData,
      this.network});

  factory _$CollegeBasketballMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollegeBasketballMatchImplFromJson(json);

  @override
  final TeamModel? awayTeam;
  @override
  final TeamModel? homeTeam;
  @override
  final String? id;
  @override
  final DateTime? startTime;
  @override
  final CollegeBasketballData? sportData;
  @override
  @JsonKey()
  final SportLeague? league;
  @override
  @JsonKey(name: 'away_team_score')
  final int? awayScore;
  @override
  @JsonKey(name: 'home_team_score')
  final int? homeScore;
  @override
  @JsonKey()
  final bool featured;
  @override
  final String? prizeSummary;
  @override
  @JsonKey()
  final int period;
  @override
  @JsonKey(unknownEnumValue: MatchStatus.unknown)
  final MatchStatus? status;
  @override
  final ContestData? contestData;
  @override
  final String? network;

  @override
  String toString() {
    return 'MatchModel.cbb(awayTeam: $awayTeam, homeTeam: $homeTeam, id: $id, startTime: $startTime, sportData: $sportData, league: $league, awayScore: $awayScore, homeScore: $homeScore, featured: $featured, prizeSummary: $prizeSummary, period: $period, status: $status, contestData: $contestData, network: $network)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollegeBasketballMatchImpl &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            const DeepCollectionEquality().equals(other.sportData, sportData) &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.prizeSummary, prizeSummary) ||
                other.prizeSummary == prizeSummary) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.contestData, contestData) ||
                other.contestData == contestData) &&
            (identical(other.network, network) || other.network == network));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      awayTeam,
      homeTeam,
      id,
      startTime,
      const DeepCollectionEquality().hash(sportData),
      league,
      awayScore,
      homeScore,
      featured,
      prizeSummary,
      period,
      status,
      contestData,
      network);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollegeBasketballMatchImplCopyWith<_$CollegeBasketballMatchImpl>
      get copyWith => __$$CollegeBasketballMatchImplCopyWithImpl<
          _$CollegeBasketballMatchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)
        $default, {
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        nba,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        cbb,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        nfl,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        cfb,
  }) {
    return cbb(
        awayTeam,
        homeTeam,
        id,
        startTime,
        sportData,
        league,
        awayScore,
        homeScore,
        featured,
        prizeSummary,
        period,
        status,
        contestData,
        network);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
  }) {
    return cbb?.call(
        awayTeam,
        homeTeam,
        id,
        startTime,
        sportData,
        league,
        awayScore,
        homeScore,
        featured,
        prizeSummary,
        period,
        status,
        contestData,
        network);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
    required TResult orElse(),
  }) {
    if (cbb != null) {
      return cbb(
          awayTeam,
          homeTeam,
          id,
          startTime,
          sportData,
          league,
          awayScore,
          homeScore,
          featured,
          prizeSummary,
          period,
          status,
          contestData,
          network);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmptyMatch value) $default, {
    required TResult Function(BasketballMatch value) nba,
    required TResult Function(CollegeBasketballMatch value) cbb,
    required TResult Function(NflFootballMatch value) nfl,
    required TResult Function(CollegeFootballMatch value) cfb,
  }) {
    return cbb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmptyMatch value)? $default, {
    TResult? Function(BasketballMatch value)? nba,
    TResult? Function(CollegeBasketballMatch value)? cbb,
    TResult? Function(NflFootballMatch value)? nfl,
    TResult? Function(CollegeFootballMatch value)? cfb,
  }) {
    return cbb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmptyMatch value)? $default, {
    TResult Function(BasketballMatch value)? nba,
    TResult Function(CollegeBasketballMatch value)? cbb,
    TResult Function(NflFootballMatch value)? nfl,
    TResult Function(CollegeFootballMatch value)? cfb,
    required TResult orElse(),
  }) {
    if (cbb != null) {
      return cbb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CollegeBasketballMatchImplToJson(
      this,
    );
  }
}

abstract class CollegeBasketballMatch
    implements MatchModel, Match<BasketballData> {
  const factory CollegeBasketballMatch(
      {required final TeamModel? awayTeam,
      required final TeamModel? homeTeam,
      required final String? id,
      required final DateTime? startTime,
      required final CollegeBasketballData? sportData,
      final SportLeague? league,
      @JsonKey(name: 'away_team_score') final int? awayScore,
      @JsonKey(name: 'home_team_score') final int? homeScore,
      final bool featured,
      final String? prizeSummary,
      final int period,
      @JsonKey(unknownEnumValue: MatchStatus.unknown) final MatchStatus? status,
      final ContestData? contestData,
      final String? network}) = _$CollegeBasketballMatchImpl;

  factory CollegeBasketballMatch.fromJson(Map<String, dynamic> json) =
      _$CollegeBasketballMatchImpl.fromJson;

  @override
  TeamModel? get awayTeam;
  @override
  TeamModel? get homeTeam;
  @override
  String? get id;
  @override
  DateTime? get startTime;
  CollegeBasketballData? get sportData;
  @override
  SportLeague? get league;
  @override
  @JsonKey(name: 'away_team_score')
  int? get awayScore;
  @override
  @JsonKey(name: 'home_team_score')
  int? get homeScore;
  @override
  bool get featured;
  String? get prizeSummary;
  @override
  int get period;
  @override
  @JsonKey(unknownEnumValue: MatchStatus.unknown)
  MatchStatus? get status;
  @override
  ContestData? get contestData;
  @override
  String? get network;
  @override
  @JsonKey(ignore: true)
  _$$CollegeBasketballMatchImplCopyWith<_$CollegeBasketballMatchImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NflFootballMatchImplCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$NflFootballMatchImplCopyWith(_$NflFootballMatchImpl value,
          $Res Function(_$NflFootballMatchImpl) then) =
      __$$NflFootballMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TeamModel? awayTeam,
      TeamModel? homeTeam,
      String? id,
      DateTime? startTime,
      NflFootballData? sportData,
      SportLeague? league,
      @JsonKey(name: 'away_team_score') int? awayScore,
      @JsonKey(name: 'home_team_score') int? homeScore,
      bool featured,
      int period,
      MatchStatus? status,
      ContestData? contestData,
      String? network});

  @override
  $TeamModelCopyWith<$Res>? get awayTeam;
  @override
  $TeamModelCopyWith<$Res>? get homeTeam;
  @override
  $ContestDataCopyWith<$Res>? get contestData;
}

/// @nodoc
class __$$NflFootballMatchImplCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$NflFootballMatchImpl>
    implements _$$NflFootballMatchImplCopyWith<$Res> {
  __$$NflFootballMatchImplCopyWithImpl(_$NflFootballMatchImpl _value,
      $Res Function(_$NflFootballMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awayTeam = freezed,
    Object? homeTeam = freezed,
    Object? id = freezed,
    Object? startTime = freezed,
    Object? sportData = freezed,
    Object? league = freezed,
    Object? awayScore = freezed,
    Object? homeScore = freezed,
    Object? featured = null,
    Object? period = null,
    Object? status = freezed,
    Object? contestData = freezed,
    Object? network = freezed,
  }) {
    return _then(_$NflFootballMatchImpl(
      awayTeam: freezed == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      homeTeam: freezed == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sportData: freezed == sportData
          ? _value.sportData
          : sportData // ignore: cast_nullable_to_non_nullable
              as NflFootballData?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchStatus?,
      contestData: freezed == contestData
          ? _value.contestData
          : contestData // ignore: cast_nullable_to_non_nullable
              as ContestData?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NflFootballMatchImpl implements NflFootballMatch {
  const _$NflFootballMatchImpl(
      {required this.awayTeam,
      required this.homeTeam,
      required this.id,
      required this.startTime,
      required this.sportData,
      this.league = SportLeague.nfl,
      @JsonKey(name: 'away_team_score') this.awayScore,
      @JsonKey(name: 'home_team_score') this.homeScore,
      this.featured = false,
      this.period = 1,
      this.status = MatchStatus.preMatch,
      this.contestData,
      this.network});

  factory _$NflFootballMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$NflFootballMatchImplFromJson(json);

  @override
  final TeamModel? awayTeam;
  @override
  final TeamModel? homeTeam;
  @override
  final String? id;
  @override
  final DateTime? startTime;
  @override
  final NflFootballData? sportData;
  @override
  @JsonKey()
  final SportLeague? league;
  @override
  @JsonKey(name: 'away_team_score')
  final int? awayScore;
  @override
  @JsonKey(name: 'home_team_score')
  final int? homeScore;
  @override
  @JsonKey()
  final bool featured;
  @override
  @JsonKey()
  final int period;
  @override
  @JsonKey()
  final MatchStatus? status;
  @override
  final ContestData? contestData;
  @override
  final String? network;

  @override
  String toString() {
    return 'MatchModel.nfl(awayTeam: $awayTeam, homeTeam: $homeTeam, id: $id, startTime: $startTime, sportData: $sportData, league: $league, awayScore: $awayScore, homeScore: $homeScore, featured: $featured, period: $period, status: $status, contestData: $contestData, network: $network)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NflFootballMatchImpl &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            const DeepCollectionEquality().equals(other.sportData, sportData) &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.contestData, contestData) ||
                other.contestData == contestData) &&
            (identical(other.network, network) || other.network == network));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      awayTeam,
      homeTeam,
      id,
      startTime,
      const DeepCollectionEquality().hash(sportData),
      league,
      awayScore,
      homeScore,
      featured,
      period,
      status,
      contestData,
      network);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NflFootballMatchImplCopyWith<_$NflFootballMatchImpl> get copyWith =>
      __$$NflFootballMatchImplCopyWithImpl<_$NflFootballMatchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)
        $default, {
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        nba,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        cbb,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        nfl,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        cfb,
  }) {
    return nfl(awayTeam, homeTeam, id, startTime, sportData, league, awayScore,
        homeScore, featured, period, status, contestData, network);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
  }) {
    return nfl?.call(awayTeam, homeTeam, id, startTime, sportData, league,
        awayScore, homeScore, featured, period, status, contestData, network);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
    required TResult orElse(),
  }) {
    if (nfl != null) {
      return nfl(awayTeam, homeTeam, id, startTime, sportData, league,
          awayScore, homeScore, featured, period, status, contestData, network);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmptyMatch value) $default, {
    required TResult Function(BasketballMatch value) nba,
    required TResult Function(CollegeBasketballMatch value) cbb,
    required TResult Function(NflFootballMatch value) nfl,
    required TResult Function(CollegeFootballMatch value) cfb,
  }) {
    return nfl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmptyMatch value)? $default, {
    TResult? Function(BasketballMatch value)? nba,
    TResult? Function(CollegeBasketballMatch value)? cbb,
    TResult? Function(NflFootballMatch value)? nfl,
    TResult? Function(CollegeFootballMatch value)? cfb,
  }) {
    return nfl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmptyMatch value)? $default, {
    TResult Function(BasketballMatch value)? nba,
    TResult Function(CollegeBasketballMatch value)? cbb,
    TResult Function(NflFootballMatch value)? nfl,
    TResult Function(CollegeFootballMatch value)? cfb,
    required TResult orElse(),
  }) {
    if (nfl != null) {
      return nfl(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NflFootballMatchImplToJson(
      this,
    );
  }
}

abstract class NflFootballMatch implements MatchModel, Match<FootballData> {
  const factory NflFootballMatch(
      {required final TeamModel? awayTeam,
      required final TeamModel? homeTeam,
      required final String? id,
      required final DateTime? startTime,
      required final NflFootballData? sportData,
      final SportLeague? league,
      @JsonKey(name: 'away_team_score') final int? awayScore,
      @JsonKey(name: 'home_team_score') final int? homeScore,
      final bool featured,
      final int period,
      final MatchStatus? status,
      final ContestData? contestData,
      final String? network}) = _$NflFootballMatchImpl;

  factory NflFootballMatch.fromJson(Map<String, dynamic> json) =
      _$NflFootballMatchImpl.fromJson;

  @override
  TeamModel? get awayTeam;
  @override
  TeamModel? get homeTeam;
  @override
  String? get id;
  @override
  DateTime? get startTime;
  NflFootballData? get sportData;
  @override
  SportLeague? get league;
  @override
  @JsonKey(name: 'away_team_score')
  int? get awayScore;
  @override
  @JsonKey(name: 'home_team_score')
  int? get homeScore;
  @override
  bool get featured;
  @override
  int get period;
  @override
  MatchStatus? get status;
  @override
  ContestData? get contestData;
  @override
  String? get network;
  @override
  @JsonKey(ignore: true)
  _$$NflFootballMatchImplCopyWith<_$NflFootballMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollegeFootballMatchImplCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$CollegeFootballMatchImplCopyWith(_$CollegeFootballMatchImpl value,
          $Res Function(_$CollegeFootballMatchImpl) then) =
      __$$CollegeFootballMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TeamModel? awayTeam,
      TeamModel? homeTeam,
      String? id,
      DateTime? startTime,
      CollegeFootballData? sportData,
      SportLeague? league,
      @JsonKey(name: 'away_team_score') int? awayScore,
      @JsonKey(name: 'home_team_score') int? homeScore,
      bool featured,
      int period,
      MatchStatus? status,
      ContestData? contestData,
      String? network});

  @override
  $TeamModelCopyWith<$Res>? get awayTeam;
  @override
  $TeamModelCopyWith<$Res>? get homeTeam;
  @override
  $ContestDataCopyWith<$Res>? get contestData;
}

/// @nodoc
class __$$CollegeFootballMatchImplCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$CollegeFootballMatchImpl>
    implements _$$CollegeFootballMatchImplCopyWith<$Res> {
  __$$CollegeFootballMatchImplCopyWithImpl(_$CollegeFootballMatchImpl _value,
      $Res Function(_$CollegeFootballMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awayTeam = freezed,
    Object? homeTeam = freezed,
    Object? id = freezed,
    Object? startTime = freezed,
    Object? sportData = freezed,
    Object? league = freezed,
    Object? awayScore = freezed,
    Object? homeScore = freezed,
    Object? featured = null,
    Object? period = null,
    Object? status = freezed,
    Object? contestData = freezed,
    Object? network = freezed,
  }) {
    return _then(_$CollegeFootballMatchImpl(
      awayTeam: freezed == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      homeTeam: freezed == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sportData: freezed == sportData
          ? _value.sportData
          : sportData // ignore: cast_nullable_to_non_nullable
              as CollegeFootballData?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchStatus?,
      contestData: freezed == contestData
          ? _value.contestData
          : contestData // ignore: cast_nullable_to_non_nullable
              as ContestData?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollegeFootballMatchImpl implements CollegeFootballMatch {
  const _$CollegeFootballMatchImpl(
      {required this.awayTeam,
      required this.homeTeam,
      required this.id,
      required this.startTime,
      required this.sportData,
      this.league = SportLeague.cfb,
      @JsonKey(name: 'away_team_score') this.awayScore,
      @JsonKey(name: 'home_team_score') this.homeScore,
      this.featured = false,
      this.period = 1,
      this.status = MatchStatus.preMatch,
      this.contestData,
      this.network});

  factory _$CollegeFootballMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollegeFootballMatchImplFromJson(json);

  @override
  final TeamModel? awayTeam;
  @override
  final TeamModel? homeTeam;
  @override
  final String? id;
  @override
  final DateTime? startTime;
  @override
  final CollegeFootballData? sportData;
  @override
  @JsonKey()
  final SportLeague? league;
  @override
  @JsonKey(name: 'away_team_score')
  final int? awayScore;
  @override
  @JsonKey(name: 'home_team_score')
  final int? homeScore;
  @override
  @JsonKey()
  final bool featured;
  @override
  @JsonKey()
  final int period;
  @override
  @JsonKey()
  final MatchStatus? status;
  @override
  final ContestData? contestData;
  @override
  final String? network;

  @override
  String toString() {
    return 'MatchModel.cfb(awayTeam: $awayTeam, homeTeam: $homeTeam, id: $id, startTime: $startTime, sportData: $sportData, league: $league, awayScore: $awayScore, homeScore: $homeScore, featured: $featured, period: $period, status: $status, contestData: $contestData, network: $network)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollegeFootballMatchImpl &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            const DeepCollectionEquality().equals(other.sportData, sportData) &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.contestData, contestData) ||
                other.contestData == contestData) &&
            (identical(other.network, network) || other.network == network));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      awayTeam,
      homeTeam,
      id,
      startTime,
      const DeepCollectionEquality().hash(sportData),
      league,
      awayScore,
      homeScore,
      featured,
      period,
      status,
      contestData,
      network);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollegeFootballMatchImplCopyWith<_$CollegeFootballMatchImpl>
      get copyWith =>
          __$$CollegeFootballMatchImplCopyWithImpl<_$CollegeFootballMatchImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)
        $default, {
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        nba,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)
        cbb,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        nfl,
    required TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)
        cfb,
  }) {
    return cfb(awayTeam, homeTeam, id, startTime, sportData, league, awayScore,
        homeScore, featured, period, status, contestData, network);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult? Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
  }) {
    return cfb?.call(awayTeam, homeTeam, id, startTime, sportData, league,
        awayScore, homeScore, featured, period, status, contestData, network);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            TeamModel? awayTeam,
            @JsonKey(name: 'home_team_score') int? homeScore,
            TeamModel? homeTeam,
            String? id,
            bool featured,
            String? prizeSummary,
            DateTime? startTime,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network,
            List<String> categories)?
        $default, {
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NbaBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nba,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeBasketballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            String? prizeSummary,
            int period,
            @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cbb,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            NflFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        nfl,
    TResult Function(
            TeamModel? awayTeam,
            TeamModel? homeTeam,
            String? id,
            DateTime? startTime,
            CollegeFootballData? sportData,
            SportLeague? league,
            @JsonKey(name: 'away_team_score') int? awayScore,
            @JsonKey(name: 'home_team_score') int? homeScore,
            bool featured,
            int period,
            MatchStatus? status,
            ContestData? contestData,
            String? network)?
        cfb,
    required TResult orElse(),
  }) {
    if (cfb != null) {
      return cfb(awayTeam, homeTeam, id, startTime, sportData, league,
          awayScore, homeScore, featured, period, status, contestData, network);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmptyMatch value) $default, {
    required TResult Function(BasketballMatch value) nba,
    required TResult Function(CollegeBasketballMatch value) cbb,
    required TResult Function(NflFootballMatch value) nfl,
    required TResult Function(CollegeFootballMatch value) cfb,
  }) {
    return cfb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmptyMatch value)? $default, {
    TResult? Function(BasketballMatch value)? nba,
    TResult? Function(CollegeBasketballMatch value)? cbb,
    TResult? Function(NflFootballMatch value)? nfl,
    TResult? Function(CollegeFootballMatch value)? cfb,
  }) {
    return cfb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmptyMatch value)? $default, {
    TResult Function(BasketballMatch value)? nba,
    TResult Function(CollegeBasketballMatch value)? cbb,
    TResult Function(NflFootballMatch value)? nfl,
    TResult Function(CollegeFootballMatch value)? cfb,
    required TResult orElse(),
  }) {
    if (cfb != null) {
      return cfb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CollegeFootballMatchImplToJson(
      this,
    );
  }
}

abstract class CollegeFootballMatch implements MatchModel, Match<FootballData> {
  const factory CollegeFootballMatch(
      {required final TeamModel? awayTeam,
      required final TeamModel? homeTeam,
      required final String? id,
      required final DateTime? startTime,
      required final CollegeFootballData? sportData,
      final SportLeague? league,
      @JsonKey(name: 'away_team_score') final int? awayScore,
      @JsonKey(name: 'home_team_score') final int? homeScore,
      final bool featured,
      final int period,
      final MatchStatus? status,
      final ContestData? contestData,
      final String? network}) = _$CollegeFootballMatchImpl;

  factory CollegeFootballMatch.fromJson(Map<String, dynamic> json) =
      _$CollegeFootballMatchImpl.fromJson;

  @override
  TeamModel? get awayTeam;
  @override
  TeamModel? get homeTeam;
  @override
  String? get id;
  @override
  DateTime? get startTime;
  CollegeFootballData? get sportData;
  @override
  SportLeague? get league;
  @override
  @JsonKey(name: 'away_team_score')
  int? get awayScore;
  @override
  @JsonKey(name: 'home_team_score')
  int? get homeScore;
  @override
  bool get featured;
  @override
  int get period;
  @override
  MatchStatus? get status;
  @override
  ContestData? get contestData;
  @override
  String? get network;
  @override
  @JsonKey(ignore: true)
  _$$CollegeFootballMatchImplCopyWith<_$CollegeFootballMatchImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SportData _$SportDataFromJson(Map<String, dynamic> json) {
  switch (json['league']) {
    case 'nfl':
      return NflFootballData.fromJson(json);
    case 'cfb':
      return CollegeFootballData.fromJson(json);
    case 'nba':
      return NbaBasketballData.fromJson(json);
    case 'cbb':
      return CollegeBasketballData.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'league', 'SportData',
          'Invalid union type "${json['league']}"!');
  }
}

/// @nodoc
mixin _$SportData {
  SportLeague get league => throw _privateConstructorUsedError;
  HomeOrAway? get possession => throw _privateConstructorUsedError;
  int? get gameClock => throw _privateConstructorUsedError;
  int? get awayScore => throw _privateConstructorUsedError;
  bool? get clockRunning => throw _privateConstructorUsedError;
  int? get homeScore => throw _privateConstructorUsedError;
  int? get period => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)
        nfl,
    required TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)
        cfb,
    required TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)
        nba,
    required TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)
        cbb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        nfl,
    TResult? Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        cfb,
    TResult? Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        nba,
    TResult? Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        cbb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        nfl,
    TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        cfb,
    TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        nba,
    TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        cbb,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NflFootballData value) nfl,
    required TResult Function(CollegeFootballData value) cfb,
    required TResult Function(NbaBasketballData value) nba,
    required TResult Function(CollegeBasketballData value) cbb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NflFootballData value)? nfl,
    TResult? Function(CollegeFootballData value)? cfb,
    TResult? Function(NbaBasketballData value)? nba,
    TResult? Function(CollegeBasketballData value)? cbb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NflFootballData value)? nfl,
    TResult Function(CollegeFootballData value)? cfb,
    TResult Function(NbaBasketballData value)? nba,
    TResult Function(CollegeBasketballData value)? cbb,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SportDataCopyWith<SportData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SportDataCopyWith<$Res> {
  factory $SportDataCopyWith(SportData value, $Res Function(SportData) then) =
      _$SportDataCopyWithImpl<$Res, SportData>;
  @useResult
  $Res call(
      {SportLeague league,
      HomeOrAway? possession,
      int? gameClock,
      int? awayScore,
      bool? clockRunning,
      int? homeScore,
      int? period});
}

/// @nodoc
class _$SportDataCopyWithImpl<$Res, $Val extends SportData>
    implements $SportDataCopyWith<$Res> {
  _$SportDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? possession = freezed,
    Object? gameClock = freezed,
    Object? awayScore = freezed,
    Object? clockRunning = freezed,
    Object? homeScore = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      possession: freezed == possession
          ? _value.possession
          : possession // ignore: cast_nullable_to_non_nullable
              as HomeOrAway?,
      gameClock: freezed == gameClock
          ? _value.gameClock
          : gameClock // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      clockRunning: freezed == clockRunning
          ? _value.clockRunning
          : clockRunning // ignore: cast_nullable_to_non_nullable
              as bool?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NflFootballDataImplCopyWith<$Res>
    implements $SportDataCopyWith<$Res> {
  factory _$$NflFootballDataImplCopyWith(_$NflFootballDataImpl value,
          $Res Function(_$NflFootballDataImpl) then) =
      __$$NflFootballDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SportLeague league,
      HomeOrAway? fieldSide,
      HomeOrAway? possession,
      int? distance,
      int? yardline,
      int? down,
      int? gameClock,
      int? awayScore,
      int? awayTeamTimeoutsLeft,
      bool? goalToGo,
      bool? clockRunning,
      int? homeScore,
      int? homeTeamTimeoutsLeft,
      int? period});
}

/// @nodoc
class __$$NflFootballDataImplCopyWithImpl<$Res>
    extends _$SportDataCopyWithImpl<$Res, _$NflFootballDataImpl>
    implements _$$NflFootballDataImplCopyWith<$Res> {
  __$$NflFootballDataImplCopyWithImpl(
      _$NflFootballDataImpl _value, $Res Function(_$NflFootballDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? fieldSide = freezed,
    Object? possession = freezed,
    Object? distance = freezed,
    Object? yardline = freezed,
    Object? down = freezed,
    Object? gameClock = freezed,
    Object? awayScore = freezed,
    Object? awayTeamTimeoutsLeft = freezed,
    Object? goalToGo = freezed,
    Object? clockRunning = freezed,
    Object? homeScore = freezed,
    Object? homeTeamTimeoutsLeft = freezed,
    Object? period = freezed,
  }) {
    return _then(_$NflFootballDataImpl(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      fieldSide: freezed == fieldSide
          ? _value.fieldSide
          : fieldSide // ignore: cast_nullable_to_non_nullable
              as HomeOrAway?,
      possession: freezed == possession
          ? _value.possession
          : possession // ignore: cast_nullable_to_non_nullable
              as HomeOrAway?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int?,
      yardline: freezed == yardline
          ? _value.yardline
          : yardline // ignore: cast_nullable_to_non_nullable
              as int?,
      down: freezed == down
          ? _value.down
          : down // ignore: cast_nullable_to_non_nullable
              as int?,
      gameClock: freezed == gameClock
          ? _value.gameClock
          : gameClock // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayTeamTimeoutsLeft: freezed == awayTeamTimeoutsLeft
          ? _value.awayTeamTimeoutsLeft
          : awayTeamTimeoutsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      goalToGo: freezed == goalToGo
          ? _value.goalToGo
          : goalToGo // ignore: cast_nullable_to_non_nullable
              as bool?,
      clockRunning: freezed == clockRunning
          ? _value.clockRunning
          : clockRunning // ignore: cast_nullable_to_non_nullable
              as bool?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      homeTeamTimeoutsLeft: freezed == homeTeamTimeoutsLeft
          ? _value.homeTeamTimeoutsLeft
          : homeTeamTimeoutsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NflFootballDataImpl implements NflFootballData {
  const _$NflFootballDataImpl(
      {this.league = SportLeague.nfl,
      this.fieldSide,
      this.possession,
      this.distance,
      this.yardline,
      this.down,
      this.gameClock,
      this.awayScore,
      this.awayTeamTimeoutsLeft,
      this.goalToGo,
      this.clockRunning,
      this.homeScore,
      this.homeTeamTimeoutsLeft,
      this.period});

  factory _$NflFootballDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NflFootballDataImplFromJson(json);

  @override
  @JsonKey()
  final SportLeague league;
  @override
  final HomeOrAway? fieldSide;
  @override
  final HomeOrAway? possession;
  @override
  final int? distance;
  @override
  final int? yardline;
  @override
  final int? down;
  @override
  final int? gameClock;
  @override
  final int? awayScore;
  @override
  final int? awayTeamTimeoutsLeft;
  @override
  final bool? goalToGo;
  @override
  final bool? clockRunning;
  @override
  final int? homeScore;
  @override
  final int? homeTeamTimeoutsLeft;
  @override
  final int? period;

  @override
  String toString() {
    return 'SportData.nfl(league: $league, fieldSide: $fieldSide, possession: $possession, distance: $distance, yardline: $yardline, down: $down, gameClock: $gameClock, awayScore: $awayScore, awayTeamTimeoutsLeft: $awayTeamTimeoutsLeft, goalToGo: $goalToGo, clockRunning: $clockRunning, homeScore: $homeScore, homeTeamTimeoutsLeft: $homeTeamTimeoutsLeft, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NflFootballDataImpl &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.fieldSide, fieldSide) ||
                other.fieldSide == fieldSide) &&
            (identical(other.possession, possession) ||
                other.possession == possession) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.yardline, yardline) ||
                other.yardline == yardline) &&
            (identical(other.down, down) || other.down == down) &&
            (identical(other.gameClock, gameClock) ||
                other.gameClock == gameClock) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.awayTeamTimeoutsLeft, awayTeamTimeoutsLeft) ||
                other.awayTeamTimeoutsLeft == awayTeamTimeoutsLeft) &&
            (identical(other.goalToGo, goalToGo) ||
                other.goalToGo == goalToGo) &&
            (identical(other.clockRunning, clockRunning) ||
                other.clockRunning == clockRunning) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.homeTeamTimeoutsLeft, homeTeamTimeoutsLeft) ||
                other.homeTeamTimeoutsLeft == homeTeamTimeoutsLeft) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      league,
      fieldSide,
      possession,
      distance,
      yardline,
      down,
      gameClock,
      awayScore,
      awayTeamTimeoutsLeft,
      goalToGo,
      clockRunning,
      homeScore,
      homeTeamTimeoutsLeft,
      period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NflFootballDataImplCopyWith<_$NflFootballDataImpl> get copyWith =>
      __$$NflFootballDataImplCopyWithImpl<_$NflFootballDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)
        nfl,
    required TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)
        cfb,
    required TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)
        nba,
    required TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)
        cbb,
  }) {
    return nfl(
        league,
        fieldSide,
        possession,
        distance,
        yardline,
        down,
        gameClock,
        awayScore,
        awayTeamTimeoutsLeft,
        goalToGo,
        clockRunning,
        homeScore,
        homeTeamTimeoutsLeft,
        period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        nfl,
    TResult? Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        cfb,
    TResult? Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        nba,
    TResult? Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        cbb,
  }) {
    return nfl?.call(
        league,
        fieldSide,
        possession,
        distance,
        yardline,
        down,
        gameClock,
        awayScore,
        awayTeamTimeoutsLeft,
        goalToGo,
        clockRunning,
        homeScore,
        homeTeamTimeoutsLeft,
        period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        nfl,
    TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        cfb,
    TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        nba,
    TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        cbb,
    required TResult orElse(),
  }) {
    if (nfl != null) {
      return nfl(
          league,
          fieldSide,
          possession,
          distance,
          yardline,
          down,
          gameClock,
          awayScore,
          awayTeamTimeoutsLeft,
          goalToGo,
          clockRunning,
          homeScore,
          homeTeamTimeoutsLeft,
          period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NflFootballData value) nfl,
    required TResult Function(CollegeFootballData value) cfb,
    required TResult Function(NbaBasketballData value) nba,
    required TResult Function(CollegeBasketballData value) cbb,
  }) {
    return nfl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NflFootballData value)? nfl,
    TResult? Function(CollegeFootballData value)? cfb,
    TResult? Function(NbaBasketballData value)? nba,
    TResult? Function(CollegeBasketballData value)? cbb,
  }) {
    return nfl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NflFootballData value)? nfl,
    TResult Function(CollegeFootballData value)? cfb,
    TResult Function(NbaBasketballData value)? nba,
    TResult Function(CollegeBasketballData value)? cbb,
    required TResult orElse(),
  }) {
    if (nfl != null) {
      return nfl(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NflFootballDataImplToJson(
      this,
    );
  }
}

abstract class NflFootballData implements SportData, FootballData {
  const factory NflFootballData(
      {final SportLeague league,
      final HomeOrAway? fieldSide,
      final HomeOrAway? possession,
      final int? distance,
      final int? yardline,
      final int? down,
      final int? gameClock,
      final int? awayScore,
      final int? awayTeamTimeoutsLeft,
      final bool? goalToGo,
      final bool? clockRunning,
      final int? homeScore,
      final int? homeTeamTimeoutsLeft,
      final int? period}) = _$NflFootballDataImpl;

  factory NflFootballData.fromJson(Map<String, dynamic> json) =
      _$NflFootballDataImpl.fromJson;

  @override
  SportLeague get league;
  HomeOrAway? get fieldSide;
  @override
  HomeOrAway? get possession;
  int? get distance;
  int? get yardline;
  int? get down;
  @override
  int? get gameClock;
  @override
  int? get awayScore;
  int? get awayTeamTimeoutsLeft;
  bool? get goalToGo;
  @override
  bool? get clockRunning;
  @override
  int? get homeScore;
  int? get homeTeamTimeoutsLeft;
  @override
  int? get period;
  @override
  @JsonKey(ignore: true)
  _$$NflFootballDataImplCopyWith<_$NflFootballDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollegeFootballDataImplCopyWith<$Res>
    implements $SportDataCopyWith<$Res> {
  factory _$$CollegeFootballDataImplCopyWith(_$CollegeFootballDataImpl value,
          $Res Function(_$CollegeFootballDataImpl) then) =
      __$$CollegeFootballDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SportLeague league,
      HomeOrAway? fieldSide,
      HomeOrAway? possession,
      int? distance,
      int? yardline,
      int? down,
      int? gameClock,
      int? awayScore,
      int? awayTeamTimeoutsLeft,
      bool? clockRunning,
      bool? goalToGo,
      int? homeScore,
      int? homeTeamTimeoutsLeft,
      int? period});
}

/// @nodoc
class __$$CollegeFootballDataImplCopyWithImpl<$Res>
    extends _$SportDataCopyWithImpl<$Res, _$CollegeFootballDataImpl>
    implements _$$CollegeFootballDataImplCopyWith<$Res> {
  __$$CollegeFootballDataImplCopyWithImpl(_$CollegeFootballDataImpl _value,
      $Res Function(_$CollegeFootballDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? fieldSide = freezed,
    Object? possession = freezed,
    Object? distance = freezed,
    Object? yardline = freezed,
    Object? down = freezed,
    Object? gameClock = freezed,
    Object? awayScore = freezed,
    Object? awayTeamTimeoutsLeft = freezed,
    Object? clockRunning = freezed,
    Object? goalToGo = freezed,
    Object? homeScore = freezed,
    Object? homeTeamTimeoutsLeft = freezed,
    Object? period = freezed,
  }) {
    return _then(_$CollegeFootballDataImpl(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      fieldSide: freezed == fieldSide
          ? _value.fieldSide
          : fieldSide // ignore: cast_nullable_to_non_nullable
              as HomeOrAway?,
      possession: freezed == possession
          ? _value.possession
          : possession // ignore: cast_nullable_to_non_nullable
              as HomeOrAway?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int?,
      yardline: freezed == yardline
          ? _value.yardline
          : yardline // ignore: cast_nullable_to_non_nullable
              as int?,
      down: freezed == down
          ? _value.down
          : down // ignore: cast_nullable_to_non_nullable
              as int?,
      gameClock: freezed == gameClock
          ? _value.gameClock
          : gameClock // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayTeamTimeoutsLeft: freezed == awayTeamTimeoutsLeft
          ? _value.awayTeamTimeoutsLeft
          : awayTeamTimeoutsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      clockRunning: freezed == clockRunning
          ? _value.clockRunning
          : clockRunning // ignore: cast_nullable_to_non_nullable
              as bool?,
      goalToGo: freezed == goalToGo
          ? _value.goalToGo
          : goalToGo // ignore: cast_nullable_to_non_nullable
              as bool?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      homeTeamTimeoutsLeft: freezed == homeTeamTimeoutsLeft
          ? _value.homeTeamTimeoutsLeft
          : homeTeamTimeoutsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollegeFootballDataImpl implements CollegeFootballData {
  const _$CollegeFootballDataImpl(
      {this.league = SportLeague.cfb,
      this.fieldSide,
      this.possession,
      this.distance,
      this.yardline,
      this.down,
      this.gameClock,
      this.awayScore,
      this.awayTeamTimeoutsLeft,
      this.clockRunning,
      this.goalToGo,
      this.homeScore,
      this.homeTeamTimeoutsLeft,
      this.period});

  factory _$CollegeFootballDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollegeFootballDataImplFromJson(json);

  @override
  @JsonKey()
  final SportLeague league;
  @override
  final HomeOrAway? fieldSide;
  @override
  final HomeOrAway? possession;
  @override
  final int? distance;
  @override
  final int? yardline;
  @override
  final int? down;
  @override
  final int? gameClock;
  @override
  final int? awayScore;
  @override
  final int? awayTeamTimeoutsLeft;
  @override
  final bool? clockRunning;
  @override
  final bool? goalToGo;
  @override
  final int? homeScore;
  @override
  final int? homeTeamTimeoutsLeft;
  @override
  final int? period;

  @override
  String toString() {
    return 'SportData.cfb(league: $league, fieldSide: $fieldSide, possession: $possession, distance: $distance, yardline: $yardline, down: $down, gameClock: $gameClock, awayScore: $awayScore, awayTeamTimeoutsLeft: $awayTeamTimeoutsLeft, clockRunning: $clockRunning, goalToGo: $goalToGo, homeScore: $homeScore, homeTeamTimeoutsLeft: $homeTeamTimeoutsLeft, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollegeFootballDataImpl &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.fieldSide, fieldSide) ||
                other.fieldSide == fieldSide) &&
            (identical(other.possession, possession) ||
                other.possession == possession) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.yardline, yardline) ||
                other.yardline == yardline) &&
            (identical(other.down, down) || other.down == down) &&
            (identical(other.gameClock, gameClock) ||
                other.gameClock == gameClock) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.awayTeamTimeoutsLeft, awayTeamTimeoutsLeft) ||
                other.awayTeamTimeoutsLeft == awayTeamTimeoutsLeft) &&
            (identical(other.clockRunning, clockRunning) ||
                other.clockRunning == clockRunning) &&
            (identical(other.goalToGo, goalToGo) ||
                other.goalToGo == goalToGo) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.homeTeamTimeoutsLeft, homeTeamTimeoutsLeft) ||
                other.homeTeamTimeoutsLeft == homeTeamTimeoutsLeft) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      league,
      fieldSide,
      possession,
      distance,
      yardline,
      down,
      gameClock,
      awayScore,
      awayTeamTimeoutsLeft,
      clockRunning,
      goalToGo,
      homeScore,
      homeTeamTimeoutsLeft,
      period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollegeFootballDataImplCopyWith<_$CollegeFootballDataImpl> get copyWith =>
      __$$CollegeFootballDataImplCopyWithImpl<_$CollegeFootballDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)
        nfl,
    required TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)
        cfb,
    required TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)
        nba,
    required TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)
        cbb,
  }) {
    return cfb(
        league,
        fieldSide,
        possession,
        distance,
        yardline,
        down,
        gameClock,
        awayScore,
        awayTeamTimeoutsLeft,
        clockRunning,
        goalToGo,
        homeScore,
        homeTeamTimeoutsLeft,
        period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        nfl,
    TResult? Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        cfb,
    TResult? Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        nba,
    TResult? Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        cbb,
  }) {
    return cfb?.call(
        league,
        fieldSide,
        possession,
        distance,
        yardline,
        down,
        gameClock,
        awayScore,
        awayTeamTimeoutsLeft,
        clockRunning,
        goalToGo,
        homeScore,
        homeTeamTimeoutsLeft,
        period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        nfl,
    TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        cfb,
    TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        nba,
    TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        cbb,
    required TResult orElse(),
  }) {
    if (cfb != null) {
      return cfb(
          league,
          fieldSide,
          possession,
          distance,
          yardline,
          down,
          gameClock,
          awayScore,
          awayTeamTimeoutsLeft,
          clockRunning,
          goalToGo,
          homeScore,
          homeTeamTimeoutsLeft,
          period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NflFootballData value) nfl,
    required TResult Function(CollegeFootballData value) cfb,
    required TResult Function(NbaBasketballData value) nba,
    required TResult Function(CollegeBasketballData value) cbb,
  }) {
    return cfb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NflFootballData value)? nfl,
    TResult? Function(CollegeFootballData value)? cfb,
    TResult? Function(NbaBasketballData value)? nba,
    TResult? Function(CollegeBasketballData value)? cbb,
  }) {
    return cfb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NflFootballData value)? nfl,
    TResult Function(CollegeFootballData value)? cfb,
    TResult Function(NbaBasketballData value)? nba,
    TResult Function(CollegeBasketballData value)? cbb,
    required TResult orElse(),
  }) {
    if (cfb != null) {
      return cfb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CollegeFootballDataImplToJson(
      this,
    );
  }
}

abstract class CollegeFootballData implements SportData, FootballData {
  const factory CollegeFootballData(
      {final SportLeague league,
      final HomeOrAway? fieldSide,
      final HomeOrAway? possession,
      final int? distance,
      final int? yardline,
      final int? down,
      final int? gameClock,
      final int? awayScore,
      final int? awayTeamTimeoutsLeft,
      final bool? clockRunning,
      final bool? goalToGo,
      final int? homeScore,
      final int? homeTeamTimeoutsLeft,
      final int? period}) = _$CollegeFootballDataImpl;

  factory CollegeFootballData.fromJson(Map<String, dynamic> json) =
      _$CollegeFootballDataImpl.fromJson;

  @override
  SportLeague get league;
  HomeOrAway? get fieldSide;
  @override
  HomeOrAway? get possession;
  int? get distance;
  int? get yardline;
  int? get down;
  @override
  int? get gameClock;
  @override
  int? get awayScore;
  int? get awayTeamTimeoutsLeft;
  @override
  bool? get clockRunning;
  bool? get goalToGo;
  @override
  int? get homeScore;
  int? get homeTeamTimeoutsLeft;
  @override
  int? get period;
  @override
  @JsonKey(ignore: true)
  _$$CollegeFootballDataImplCopyWith<_$CollegeFootballDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NbaBasketballDataImplCopyWith<$Res>
    implements $SportDataCopyWith<$Res> {
  factory _$$NbaBasketballDataImplCopyWith(_$NbaBasketballDataImpl value,
          $Res Function(_$NbaBasketballDataImpl) then) =
      __$$NbaBasketballDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SportLeague league,
      int? gameClock,
      HomeOrAway? possession,
      HomeOrAway? possessionArrow,
      FoulDetails? teamFouls,
      Map<String, BasketballPlayerStats>? playerStats,
      int? homeTeamFouls,
      int? awayTeamFouls,
      bool? homeTeamBonus,
      bool? awayTeamBonus,
      int? homeScore,
      int? awayScore,
      bool? clockRunning,
      int? period});

  $FoulDetailsCopyWith<$Res>? get teamFouls;
}

/// @nodoc
class __$$NbaBasketballDataImplCopyWithImpl<$Res>
    extends _$SportDataCopyWithImpl<$Res, _$NbaBasketballDataImpl>
    implements _$$NbaBasketballDataImplCopyWith<$Res> {
  __$$NbaBasketballDataImplCopyWithImpl(_$NbaBasketballDataImpl _value,
      $Res Function(_$NbaBasketballDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? gameClock = freezed,
    Object? possession = freezed,
    Object? possessionArrow = freezed,
    Object? teamFouls = freezed,
    Object? playerStats = freezed,
    Object? homeTeamFouls = freezed,
    Object? awayTeamFouls = freezed,
    Object? homeTeamBonus = freezed,
    Object? awayTeamBonus = freezed,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? clockRunning = freezed,
    Object? period = freezed,
  }) {
    return _then(_$NbaBasketballDataImpl(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      gameClock: freezed == gameClock
          ? _value.gameClock
          : gameClock // ignore: cast_nullable_to_non_nullable
              as int?,
      possession: freezed == possession
          ? _value.possession
          : possession // ignore: cast_nullable_to_non_nullable
              as HomeOrAway?,
      possessionArrow: freezed == possessionArrow
          ? _value.possessionArrow
          : possessionArrow // ignore: cast_nullable_to_non_nullable
              as HomeOrAway?,
      teamFouls: freezed == teamFouls
          ? _value.teamFouls
          : teamFouls // ignore: cast_nullable_to_non_nullable
              as FoulDetails?,
      playerStats: freezed == playerStats
          ? _value._playerStats
          : playerStats // ignore: cast_nullable_to_non_nullable
              as Map<String, BasketballPlayerStats>?,
      homeTeamFouls: freezed == homeTeamFouls
          ? _value.homeTeamFouls
          : homeTeamFouls // ignore: cast_nullable_to_non_nullable
              as int?,
      awayTeamFouls: freezed == awayTeamFouls
          ? _value.awayTeamFouls
          : awayTeamFouls // ignore: cast_nullable_to_non_nullable
              as int?,
      homeTeamBonus: freezed == homeTeamBonus
          ? _value.homeTeamBonus
          : homeTeamBonus // ignore: cast_nullable_to_non_nullable
              as bool?,
      awayTeamBonus: freezed == awayTeamBonus
          ? _value.awayTeamBonus
          : awayTeamBonus // ignore: cast_nullable_to_non_nullable
              as bool?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      clockRunning: freezed == clockRunning
          ? _value.clockRunning
          : clockRunning // ignore: cast_nullable_to_non_nullable
              as bool?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FoulDetailsCopyWith<$Res>? get teamFouls {
    if (_value.teamFouls == null) {
      return null;
    }

    return $FoulDetailsCopyWith<$Res>(_value.teamFouls!, (value) {
      return _then(_value.copyWith(teamFouls: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$NbaBasketballDataImpl implements NbaBasketballData {
  const _$NbaBasketballDataImpl(
      {this.league = SportLeague.nba,
      this.gameClock,
      this.possession,
      this.possessionArrow,
      this.teamFouls,
      final Map<String, BasketballPlayerStats>? playerStats,
      this.homeTeamFouls,
      this.awayTeamFouls,
      this.homeTeamBonus,
      this.awayTeamBonus,
      this.homeScore,
      this.awayScore,
      this.clockRunning,
      this.period})
      : _playerStats = playerStats;

  factory _$NbaBasketballDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NbaBasketballDataImplFromJson(json);

  @override
  @JsonKey()
  final SportLeague league;
  @override
  final int? gameClock;
  @override
  final HomeOrAway? possession;
  @override
  final HomeOrAway? possessionArrow;
  @override
  final FoulDetails? teamFouls;
  final Map<String, BasketballPlayerStats>? _playerStats;
  @override
  Map<String, BasketballPlayerStats>? get playerStats {
    final value = _playerStats;
    if (value == null) return null;
    if (_playerStats is EqualUnmodifiableMapView) return _playerStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? homeTeamFouls;
  @override
  final int? awayTeamFouls;
  @override
  final bool? homeTeamBonus;
  @override
  final bool? awayTeamBonus;
  @override
  final int? homeScore;
  @override
  final int? awayScore;
  @override
  final bool? clockRunning;
  @override
  final int? period;

  @override
  String toString() {
    return 'SportData.nba(league: $league, gameClock: $gameClock, possession: $possession, possessionArrow: $possessionArrow, teamFouls: $teamFouls, playerStats: $playerStats, homeTeamFouls: $homeTeamFouls, awayTeamFouls: $awayTeamFouls, homeTeamBonus: $homeTeamBonus, awayTeamBonus: $awayTeamBonus, homeScore: $homeScore, awayScore: $awayScore, clockRunning: $clockRunning, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NbaBasketballDataImpl &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.gameClock, gameClock) ||
                other.gameClock == gameClock) &&
            (identical(other.possession, possession) ||
                other.possession == possession) &&
            (identical(other.possessionArrow, possessionArrow) ||
                other.possessionArrow == possessionArrow) &&
            (identical(other.teamFouls, teamFouls) ||
                other.teamFouls == teamFouls) &&
            const DeepCollectionEquality()
                .equals(other._playerStats, _playerStats) &&
            (identical(other.homeTeamFouls, homeTeamFouls) ||
                other.homeTeamFouls == homeTeamFouls) &&
            (identical(other.awayTeamFouls, awayTeamFouls) ||
                other.awayTeamFouls == awayTeamFouls) &&
            (identical(other.homeTeamBonus, homeTeamBonus) ||
                other.homeTeamBonus == homeTeamBonus) &&
            (identical(other.awayTeamBonus, awayTeamBonus) ||
                other.awayTeamBonus == awayTeamBonus) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.clockRunning, clockRunning) ||
                other.clockRunning == clockRunning) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      league,
      gameClock,
      possession,
      possessionArrow,
      teamFouls,
      const DeepCollectionEquality().hash(_playerStats),
      homeTeamFouls,
      awayTeamFouls,
      homeTeamBonus,
      awayTeamBonus,
      homeScore,
      awayScore,
      clockRunning,
      period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NbaBasketballDataImplCopyWith<_$NbaBasketballDataImpl> get copyWith =>
      __$$NbaBasketballDataImplCopyWithImpl<_$NbaBasketballDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)
        nfl,
    required TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)
        cfb,
    required TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)
        nba,
    required TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)
        cbb,
  }) {
    return nba(
        league,
        gameClock,
        possession,
        possessionArrow,
        teamFouls,
        playerStats,
        homeTeamFouls,
        awayTeamFouls,
        homeTeamBonus,
        awayTeamBonus,
        homeScore,
        awayScore,
        clockRunning,
        period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        nfl,
    TResult? Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        cfb,
    TResult? Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        nba,
    TResult? Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        cbb,
  }) {
    return nba?.call(
        league,
        gameClock,
        possession,
        possessionArrow,
        teamFouls,
        playerStats,
        homeTeamFouls,
        awayTeamFouls,
        homeTeamBonus,
        awayTeamBonus,
        homeScore,
        awayScore,
        clockRunning,
        period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        nfl,
    TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        cfb,
    TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        nba,
    TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        cbb,
    required TResult orElse(),
  }) {
    if (nba != null) {
      return nba(
          league,
          gameClock,
          possession,
          possessionArrow,
          teamFouls,
          playerStats,
          homeTeamFouls,
          awayTeamFouls,
          homeTeamBonus,
          awayTeamBonus,
          homeScore,
          awayScore,
          clockRunning,
          period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NflFootballData value) nfl,
    required TResult Function(CollegeFootballData value) cfb,
    required TResult Function(NbaBasketballData value) nba,
    required TResult Function(CollegeBasketballData value) cbb,
  }) {
    return nba(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NflFootballData value)? nfl,
    TResult? Function(CollegeFootballData value)? cfb,
    TResult? Function(NbaBasketballData value)? nba,
    TResult? Function(CollegeBasketballData value)? cbb,
  }) {
    return nba?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NflFootballData value)? nfl,
    TResult Function(CollegeFootballData value)? cfb,
    TResult Function(NbaBasketballData value)? nba,
    TResult Function(CollegeBasketballData value)? cbb,
    required TResult orElse(),
  }) {
    if (nba != null) {
      return nba(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NbaBasketballDataImplToJson(
      this,
    );
  }
}

abstract class NbaBasketballData implements SportData, BasketballData {
  const factory NbaBasketballData(
      {final SportLeague league,
      final int? gameClock,
      final HomeOrAway? possession,
      final HomeOrAway? possessionArrow,
      final FoulDetails? teamFouls,
      final Map<String, BasketballPlayerStats>? playerStats,
      final int? homeTeamFouls,
      final int? awayTeamFouls,
      final bool? homeTeamBonus,
      final bool? awayTeamBonus,
      final int? homeScore,
      final int? awayScore,
      final bool? clockRunning,
      final int? period}) = _$NbaBasketballDataImpl;

  factory NbaBasketballData.fromJson(Map<String, dynamic> json) =
      _$NbaBasketballDataImpl.fromJson;

  @override
  SportLeague get league;
  @override
  int? get gameClock;
  @override
  HomeOrAway? get possession;
  HomeOrAway? get possessionArrow;
  FoulDetails? get teamFouls;
  Map<String, BasketballPlayerStats>? get playerStats;
  int? get homeTeamFouls;
  int? get awayTeamFouls;
  bool? get homeTeamBonus;
  bool? get awayTeamBonus;
  @override
  int? get homeScore;
  @override
  int? get awayScore;
  @override
  bool? get clockRunning;
  @override
  int? get period;
  @override
  @JsonKey(ignore: true)
  _$$NbaBasketballDataImplCopyWith<_$NbaBasketballDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollegeBasketballDataImplCopyWith<$Res>
    implements $SportDataCopyWith<$Res> {
  factory _$$CollegeBasketballDataImplCopyWith(
          _$CollegeBasketballDataImpl value,
          $Res Function(_$CollegeBasketballDataImpl) then) =
      __$$CollegeBasketballDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SportLeague league,
      int? gameClock,
      HomeOrAway? possession,
      HomeOrAway? possessionArrow,
      FoulDetails? teamFouls,
      Map<String, BasketballPlayerStats>? playerStats,
      int? homeTeamFouls,
      int? awayTeamFouls,
      bool? homeTeamBonus,
      bool? awayTeamBonus,
      bool? homeTeamDoubleBonus,
      bool? awayTeamDoubleBonus,
      int? homeScore,
      int? awayScore,
      bool? clockRunning,
      int? period});

  $FoulDetailsCopyWith<$Res>? get teamFouls;
}

/// @nodoc
class __$$CollegeBasketballDataImplCopyWithImpl<$Res>
    extends _$SportDataCopyWithImpl<$Res, _$CollegeBasketballDataImpl>
    implements _$$CollegeBasketballDataImplCopyWith<$Res> {
  __$$CollegeBasketballDataImplCopyWithImpl(_$CollegeBasketballDataImpl _value,
      $Res Function(_$CollegeBasketballDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? gameClock = freezed,
    Object? possession = freezed,
    Object? possessionArrow = freezed,
    Object? teamFouls = freezed,
    Object? playerStats = freezed,
    Object? homeTeamFouls = freezed,
    Object? awayTeamFouls = freezed,
    Object? homeTeamBonus = freezed,
    Object? awayTeamBonus = freezed,
    Object? homeTeamDoubleBonus = freezed,
    Object? awayTeamDoubleBonus = freezed,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? clockRunning = freezed,
    Object? period = freezed,
  }) {
    return _then(_$CollegeBasketballDataImpl(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      gameClock: freezed == gameClock
          ? _value.gameClock
          : gameClock // ignore: cast_nullable_to_non_nullable
              as int?,
      possession: freezed == possession
          ? _value.possession
          : possession // ignore: cast_nullable_to_non_nullable
              as HomeOrAway?,
      possessionArrow: freezed == possessionArrow
          ? _value.possessionArrow
          : possessionArrow // ignore: cast_nullable_to_non_nullable
              as HomeOrAway?,
      teamFouls: freezed == teamFouls
          ? _value.teamFouls
          : teamFouls // ignore: cast_nullable_to_non_nullable
              as FoulDetails?,
      playerStats: freezed == playerStats
          ? _value._playerStats
          : playerStats // ignore: cast_nullable_to_non_nullable
              as Map<String, BasketballPlayerStats>?,
      homeTeamFouls: freezed == homeTeamFouls
          ? _value.homeTeamFouls
          : homeTeamFouls // ignore: cast_nullable_to_non_nullable
              as int?,
      awayTeamFouls: freezed == awayTeamFouls
          ? _value.awayTeamFouls
          : awayTeamFouls // ignore: cast_nullable_to_non_nullable
              as int?,
      homeTeamBonus: freezed == homeTeamBonus
          ? _value.homeTeamBonus
          : homeTeamBonus // ignore: cast_nullable_to_non_nullable
              as bool?,
      awayTeamBonus: freezed == awayTeamBonus
          ? _value.awayTeamBonus
          : awayTeamBonus // ignore: cast_nullable_to_non_nullable
              as bool?,
      homeTeamDoubleBonus: freezed == homeTeamDoubleBonus
          ? _value.homeTeamDoubleBonus
          : homeTeamDoubleBonus // ignore: cast_nullable_to_non_nullable
              as bool?,
      awayTeamDoubleBonus: freezed == awayTeamDoubleBonus
          ? _value.awayTeamDoubleBonus
          : awayTeamDoubleBonus // ignore: cast_nullable_to_non_nullable
              as bool?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      clockRunning: freezed == clockRunning
          ? _value.clockRunning
          : clockRunning // ignore: cast_nullable_to_non_nullable
              as bool?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FoulDetailsCopyWith<$Res>? get teamFouls {
    if (_value.teamFouls == null) {
      return null;
    }

    return $FoulDetailsCopyWith<$Res>(_value.teamFouls!, (value) {
      return _then(_value.copyWith(teamFouls: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CollegeBasketballDataImpl implements CollegeBasketballData {
  const _$CollegeBasketballDataImpl(
      {this.league = SportLeague.cbb,
      this.gameClock,
      this.possession,
      this.possessionArrow,
      this.teamFouls,
      final Map<String, BasketballPlayerStats>? playerStats,
      this.homeTeamFouls,
      this.awayTeamFouls,
      this.homeTeamBonus,
      this.awayTeamBonus,
      this.homeTeamDoubleBonus,
      this.awayTeamDoubleBonus,
      this.homeScore,
      this.awayScore,
      this.clockRunning,
      this.period})
      : _playerStats = playerStats;

  factory _$CollegeBasketballDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollegeBasketballDataImplFromJson(json);

  @override
  @JsonKey()
  final SportLeague league;
  @override
  final int? gameClock;
  @override
  final HomeOrAway? possession;
  @override
  final HomeOrAway? possessionArrow;
  @override
  final FoulDetails? teamFouls;
  final Map<String, BasketballPlayerStats>? _playerStats;
  @override
  Map<String, BasketballPlayerStats>? get playerStats {
    final value = _playerStats;
    if (value == null) return null;
    if (_playerStats is EqualUnmodifiableMapView) return _playerStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? homeTeamFouls;
  @override
  final int? awayTeamFouls;
  @override
  final bool? homeTeamBonus;
  @override
  final bool? awayTeamBonus;
  @override
  final bool? homeTeamDoubleBonus;
  @override
  final bool? awayTeamDoubleBonus;
  @override
  final int? homeScore;
  @override
  final int? awayScore;
  @override
  final bool? clockRunning;
  @override
  final int? period;

  @override
  String toString() {
    return 'SportData.cbb(league: $league, gameClock: $gameClock, possession: $possession, possessionArrow: $possessionArrow, teamFouls: $teamFouls, playerStats: $playerStats, homeTeamFouls: $homeTeamFouls, awayTeamFouls: $awayTeamFouls, homeTeamBonus: $homeTeamBonus, awayTeamBonus: $awayTeamBonus, homeTeamDoubleBonus: $homeTeamDoubleBonus, awayTeamDoubleBonus: $awayTeamDoubleBonus, homeScore: $homeScore, awayScore: $awayScore, clockRunning: $clockRunning, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollegeBasketballDataImpl &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.gameClock, gameClock) ||
                other.gameClock == gameClock) &&
            (identical(other.possession, possession) ||
                other.possession == possession) &&
            (identical(other.possessionArrow, possessionArrow) ||
                other.possessionArrow == possessionArrow) &&
            (identical(other.teamFouls, teamFouls) ||
                other.teamFouls == teamFouls) &&
            const DeepCollectionEquality()
                .equals(other._playerStats, _playerStats) &&
            (identical(other.homeTeamFouls, homeTeamFouls) ||
                other.homeTeamFouls == homeTeamFouls) &&
            (identical(other.awayTeamFouls, awayTeamFouls) ||
                other.awayTeamFouls == awayTeamFouls) &&
            (identical(other.homeTeamBonus, homeTeamBonus) ||
                other.homeTeamBonus == homeTeamBonus) &&
            (identical(other.awayTeamBonus, awayTeamBonus) ||
                other.awayTeamBonus == awayTeamBonus) &&
            (identical(other.homeTeamDoubleBonus, homeTeamDoubleBonus) ||
                other.homeTeamDoubleBonus == homeTeamDoubleBonus) &&
            (identical(other.awayTeamDoubleBonus, awayTeamDoubleBonus) ||
                other.awayTeamDoubleBonus == awayTeamDoubleBonus) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.clockRunning, clockRunning) ||
                other.clockRunning == clockRunning) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      league,
      gameClock,
      possession,
      possessionArrow,
      teamFouls,
      const DeepCollectionEquality().hash(_playerStats),
      homeTeamFouls,
      awayTeamFouls,
      homeTeamBonus,
      awayTeamBonus,
      homeTeamDoubleBonus,
      awayTeamDoubleBonus,
      homeScore,
      awayScore,
      clockRunning,
      period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollegeBasketballDataImplCopyWith<_$CollegeBasketballDataImpl>
      get copyWith => __$$CollegeBasketballDataImplCopyWithImpl<
          _$CollegeBasketballDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)
        nfl,
    required TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)
        cfb,
    required TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)
        nba,
    required TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)
        cbb,
  }) {
    return cbb(
        league,
        gameClock,
        possession,
        possessionArrow,
        teamFouls,
        playerStats,
        homeTeamFouls,
        awayTeamFouls,
        homeTeamBonus,
        awayTeamBonus,
        homeTeamDoubleBonus,
        awayTeamDoubleBonus,
        homeScore,
        awayScore,
        clockRunning,
        period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        nfl,
    TResult? Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        cfb,
    TResult? Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        nba,
    TResult? Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        cbb,
  }) {
    return cbb?.call(
        league,
        gameClock,
        possession,
        possessionArrow,
        teamFouls,
        playerStats,
        homeTeamFouls,
        awayTeamFouls,
        homeTeamBonus,
        awayTeamBonus,
        homeTeamDoubleBonus,
        awayTeamDoubleBonus,
        homeScore,
        awayScore,
        clockRunning,
        period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? goalToGo,
            bool? clockRunning,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        nfl,
    TResult Function(
            SportLeague league,
            HomeOrAway? fieldSide,
            HomeOrAway? possession,
            int? distance,
            int? yardline,
            int? down,
            int? gameClock,
            int? awayScore,
            int? awayTeamTimeoutsLeft,
            bool? clockRunning,
            bool? goalToGo,
            int? homeScore,
            int? homeTeamTimeoutsLeft,
            int? period)?
        cfb,
    TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        nba,
    TResult Function(
            SportLeague league,
            int? gameClock,
            HomeOrAway? possession,
            HomeOrAway? possessionArrow,
            FoulDetails? teamFouls,
            Map<String, BasketballPlayerStats>? playerStats,
            int? homeTeamFouls,
            int? awayTeamFouls,
            bool? homeTeamBonus,
            bool? awayTeamBonus,
            bool? homeTeamDoubleBonus,
            bool? awayTeamDoubleBonus,
            int? homeScore,
            int? awayScore,
            bool? clockRunning,
            int? period)?
        cbb,
    required TResult orElse(),
  }) {
    if (cbb != null) {
      return cbb(
          league,
          gameClock,
          possession,
          possessionArrow,
          teamFouls,
          playerStats,
          homeTeamFouls,
          awayTeamFouls,
          homeTeamBonus,
          awayTeamBonus,
          homeTeamDoubleBonus,
          awayTeamDoubleBonus,
          homeScore,
          awayScore,
          clockRunning,
          period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NflFootballData value) nfl,
    required TResult Function(CollegeFootballData value) cfb,
    required TResult Function(NbaBasketballData value) nba,
    required TResult Function(CollegeBasketballData value) cbb,
  }) {
    return cbb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NflFootballData value)? nfl,
    TResult? Function(CollegeFootballData value)? cfb,
    TResult? Function(NbaBasketballData value)? nba,
    TResult? Function(CollegeBasketballData value)? cbb,
  }) {
    return cbb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NflFootballData value)? nfl,
    TResult Function(CollegeFootballData value)? cfb,
    TResult Function(NbaBasketballData value)? nba,
    TResult Function(CollegeBasketballData value)? cbb,
    required TResult orElse(),
  }) {
    if (cbb != null) {
      return cbb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CollegeBasketballDataImplToJson(
      this,
    );
  }
}

abstract class CollegeBasketballData implements SportData, BasketballData {
  const factory CollegeBasketballData(
      {final SportLeague league,
      final int? gameClock,
      final HomeOrAway? possession,
      final HomeOrAway? possessionArrow,
      final FoulDetails? teamFouls,
      final Map<String, BasketballPlayerStats>? playerStats,
      final int? homeTeamFouls,
      final int? awayTeamFouls,
      final bool? homeTeamBonus,
      final bool? awayTeamBonus,
      final bool? homeTeamDoubleBonus,
      final bool? awayTeamDoubleBonus,
      final int? homeScore,
      final int? awayScore,
      final bool? clockRunning,
      final int? period}) = _$CollegeBasketballDataImpl;

  factory CollegeBasketballData.fromJson(Map<String, dynamic> json) =
      _$CollegeBasketballDataImpl.fromJson;

  @override
  SportLeague get league;
  @override
  int? get gameClock;
  @override
  HomeOrAway? get possession;
  HomeOrAway? get possessionArrow;
  FoulDetails? get teamFouls;
  Map<String, BasketballPlayerStats>? get playerStats;
  int? get homeTeamFouls;
  int? get awayTeamFouls;
  bool? get homeTeamBonus;
  bool? get awayTeamBonus;
  bool? get homeTeamDoubleBonus;
  bool? get awayTeamDoubleBonus;
  @override
  int? get homeScore;
  @override
  int? get awayScore;
  @override
  bool? get clockRunning;
  @override
  int? get period;
  @override
  @JsonKey(ignore: true)
  _$$CollegeBasketballDataImplCopyWith<_$CollegeBasketballDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ContestData _$ContestDataFromJson(Map<String, dynamic> json) {
  return _ContestData.fromJson(json);
}

/// @nodoc
mixin _$ContestData {
  List<String> get contestIds => throw _privateConstructorUsedError;
  int get numberOfWageringUsers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContestDataCopyWith<ContestData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContestDataCopyWith<$Res> {
  factory $ContestDataCopyWith(
          ContestData value, $Res Function(ContestData) then) =
      _$ContestDataCopyWithImpl<$Res, ContestData>;
  @useResult
  $Res call({List<String> contestIds, int numberOfWageringUsers});
}

/// @nodoc
class _$ContestDataCopyWithImpl<$Res, $Val extends ContestData>
    implements $ContestDataCopyWith<$Res> {
  _$ContestDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contestIds = null,
    Object? numberOfWageringUsers = null,
  }) {
    return _then(_value.copyWith(
      contestIds: null == contestIds
          ? _value.contestIds
          : contestIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfWageringUsers: null == numberOfWageringUsers
          ? _value.numberOfWageringUsers
          : numberOfWageringUsers // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContestDataImplCopyWith<$Res>
    implements $ContestDataCopyWith<$Res> {
  factory _$$ContestDataImplCopyWith(
          _$ContestDataImpl value, $Res Function(_$ContestDataImpl) then) =
      __$$ContestDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> contestIds, int numberOfWageringUsers});
}

/// @nodoc
class __$$ContestDataImplCopyWithImpl<$Res>
    extends _$ContestDataCopyWithImpl<$Res, _$ContestDataImpl>
    implements _$$ContestDataImplCopyWith<$Res> {
  __$$ContestDataImplCopyWithImpl(
      _$ContestDataImpl _value, $Res Function(_$ContestDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contestIds = null,
    Object? numberOfWageringUsers = null,
  }) {
    return _then(_$ContestDataImpl(
      contestIds: null == contestIds
          ? _value._contestIds
          : contestIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfWageringUsers: null == numberOfWageringUsers
          ? _value.numberOfWageringUsers
          : numberOfWageringUsers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContestDataImpl implements _ContestData {
  const _$ContestDataImpl(
      {final List<String> contestIds = const [],
      this.numberOfWageringUsers = 0})
      : _contestIds = contestIds;

  factory _$ContestDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContestDataImplFromJson(json);

  final List<String> _contestIds;
  @override
  @JsonKey()
  List<String> get contestIds {
    if (_contestIds is EqualUnmodifiableListView) return _contestIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contestIds);
  }

  @override
  @JsonKey()
  final int numberOfWageringUsers;

  @override
  String toString() {
    return 'ContestData(contestIds: $contestIds, numberOfWageringUsers: $numberOfWageringUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContestDataImpl &&
            const DeepCollectionEquality()
                .equals(other._contestIds, _contestIds) &&
            (identical(other.numberOfWageringUsers, numberOfWageringUsers) ||
                other.numberOfWageringUsers == numberOfWageringUsers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_contestIds), numberOfWageringUsers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContestDataImplCopyWith<_$ContestDataImpl> get copyWith =>
      __$$ContestDataImplCopyWithImpl<_$ContestDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContestDataImplToJson(
      this,
    );
  }
}

abstract class _ContestData implements ContestData {
  const factory _ContestData(
      {final List<String> contestIds,
      final int numberOfWageringUsers}) = _$ContestDataImpl;

  factory _ContestData.fromJson(Map<String, dynamic> json) =
      _$ContestDataImpl.fromJson;

  @override
  List<String> get contestIds;
  @override
  int get numberOfWageringUsers;
  @override
  @JsonKey(ignore: true)
  _$$ContestDataImplCopyWith<_$ContestDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlayerStats _$PlayerStatsFromJson(Map<String, dynamic> json) {
  return BasketballPlayerStats.fromJson(json);
}

/// @nodoc
mixin _$PlayerStats {
  int get quarterPoints => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int quarterPoints) nba,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int quarterPoints)? nba,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int quarterPoints)? nba,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasketballPlayerStats value) nba,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BasketballPlayerStats value)? nba,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasketballPlayerStats value)? nba,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerStatsCopyWith<PlayerStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStatsCopyWith<$Res> {
  factory $PlayerStatsCopyWith(
          PlayerStats value, $Res Function(PlayerStats) then) =
      _$PlayerStatsCopyWithImpl<$Res, PlayerStats>;
  @useResult
  $Res call({int quarterPoints});
}

/// @nodoc
class _$PlayerStatsCopyWithImpl<$Res, $Val extends PlayerStats>
    implements $PlayerStatsCopyWith<$Res> {
  _$PlayerStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quarterPoints = null,
  }) {
    return _then(_value.copyWith(
      quarterPoints: null == quarterPoints
          ? _value.quarterPoints
          : quarterPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasketballPlayerStatsImplCopyWith<$Res>
    implements $PlayerStatsCopyWith<$Res> {
  factory _$$BasketballPlayerStatsImplCopyWith(
          _$BasketballPlayerStatsImpl value,
          $Res Function(_$BasketballPlayerStatsImpl) then) =
      __$$BasketballPlayerStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quarterPoints});
}

/// @nodoc
class __$$BasketballPlayerStatsImplCopyWithImpl<$Res>
    extends _$PlayerStatsCopyWithImpl<$Res, _$BasketballPlayerStatsImpl>
    implements _$$BasketballPlayerStatsImplCopyWith<$Res> {
  __$$BasketballPlayerStatsImplCopyWithImpl(_$BasketballPlayerStatsImpl _value,
      $Res Function(_$BasketballPlayerStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quarterPoints = null,
  }) {
    return _then(_$BasketballPlayerStatsImpl(
      quarterPoints: null == quarterPoints
          ? _value.quarterPoints
          : quarterPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasketballPlayerStatsImpl implements BasketballPlayerStats {
  const _$BasketballPlayerStatsImpl({this.quarterPoints = 0});

  factory _$BasketballPlayerStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasketballPlayerStatsImplFromJson(json);

  @override
  @JsonKey()
  final int quarterPoints;

  @override
  String toString() {
    return 'PlayerStats.nba(quarterPoints: $quarterPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketballPlayerStatsImpl &&
            (identical(other.quarterPoints, quarterPoints) ||
                other.quarterPoints == quarterPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quarterPoints);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketballPlayerStatsImplCopyWith<_$BasketballPlayerStatsImpl>
      get copyWith => __$$BasketballPlayerStatsImplCopyWithImpl<
          _$BasketballPlayerStatsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int quarterPoints) nba,
  }) {
    return nba(quarterPoints);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int quarterPoints)? nba,
  }) {
    return nba?.call(quarterPoints);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int quarterPoints)? nba,
    required TResult orElse(),
  }) {
    if (nba != null) {
      return nba(quarterPoints);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasketballPlayerStats value) nba,
  }) {
    return nba(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BasketballPlayerStats value)? nba,
  }) {
    return nba?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasketballPlayerStats value)? nba,
    required TResult orElse(),
  }) {
    if (nba != null) {
      return nba(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BasketballPlayerStatsImplToJson(
      this,
    );
  }
}

abstract class BasketballPlayerStats implements PlayerStats {
  const factory BasketballPlayerStats({final int quarterPoints}) =
      _$BasketballPlayerStatsImpl;

  factory BasketballPlayerStats.fromJson(Map<String, dynamic> json) =
      _$BasketballPlayerStatsImpl.fromJson;

  @override
  int get quarterPoints;
  @override
  @JsonKey(ignore: true)
  _$$BasketballPlayerStatsImplCopyWith<_$BasketballPlayerStatsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
