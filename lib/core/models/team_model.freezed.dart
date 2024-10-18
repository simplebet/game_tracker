// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeamsResponseDataModel _$TeamsResponseDataModelFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return _TeamsResponseDataModelSuccess.fromJson(json);
    case 'error':
      return _TeamsResponseDataModelError.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'TeamsResponseDataModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TeamsResponseDataModel {
  ResponseStatus get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TeamListDataModel data, ResponseStatus status)
        success,
    required TResult Function(ErrorResponseModel error, ResponseStatus status)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TeamListDataModel data, ResponseStatus status)? success,
    TResult? Function(ErrorResponseModel error, ResponseStatus status)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TeamListDataModel data, ResponseStatus status)? success,
    TResult Function(ErrorResponseModel error, ResponseStatus status)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TeamsResponseDataModelSuccess value) success,
    required TResult Function(_TeamsResponseDataModelError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TeamsResponseDataModelSuccess value)? success,
    TResult? Function(_TeamsResponseDataModelError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TeamsResponseDataModelSuccess value)? success,
    TResult Function(_TeamsResponseDataModelError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamsResponseDataModelCopyWith<TeamsResponseDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamsResponseDataModelCopyWith<$Res> {
  factory $TeamsResponseDataModelCopyWith(TeamsResponseDataModel value,
          $Res Function(TeamsResponseDataModel) then) =
      _$TeamsResponseDataModelCopyWithImpl<$Res, TeamsResponseDataModel>;
  @useResult
  $Res call({ResponseStatus status});
}

/// @nodoc
class _$TeamsResponseDataModelCopyWithImpl<$Res,
        $Val extends TeamsResponseDataModel>
    implements $TeamsResponseDataModelCopyWith<$Res> {
  _$TeamsResponseDataModelCopyWithImpl(this._value, this._then);

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
abstract class _$$TeamsResponseDataModelSuccessImplCopyWith<$Res>
    implements $TeamsResponseDataModelCopyWith<$Res> {
  factory _$$TeamsResponseDataModelSuccessImplCopyWith(
          _$TeamsResponseDataModelSuccessImpl value,
          $Res Function(_$TeamsResponseDataModelSuccessImpl) then) =
      __$$TeamsResponseDataModelSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TeamListDataModel data, ResponseStatus status});

  $TeamListDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$TeamsResponseDataModelSuccessImplCopyWithImpl<$Res>
    extends _$TeamsResponseDataModelCopyWithImpl<$Res,
        _$TeamsResponseDataModelSuccessImpl>
    implements _$$TeamsResponseDataModelSuccessImplCopyWith<$Res> {
  __$$TeamsResponseDataModelSuccessImplCopyWithImpl(
      _$TeamsResponseDataModelSuccessImpl _value,
      $Res Function(_$TeamsResponseDataModelSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_$TeamsResponseDataModelSuccessImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TeamListDataModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResponseStatus,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamListDataModelCopyWith<$Res> get data {
    return $TeamListDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamsResponseDataModelSuccessImpl
    implements _TeamsResponseDataModelSuccess {
  const _$TeamsResponseDataModelSuccessImpl(
      {required this.data,
      this.status = ResponseStatus.success,
      final String? $type})
      : $type = $type ?? 'success';

  factory _$TeamsResponseDataModelSuccessImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TeamsResponseDataModelSuccessImplFromJson(json);

  @override
  final TeamListDataModel data;
  @override
  @JsonKey()
  final ResponseStatus status;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TeamsResponseDataModel.success(data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamsResponseDataModelSuccessImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamsResponseDataModelSuccessImplCopyWith<
          _$TeamsResponseDataModelSuccessImpl>
      get copyWith => __$$TeamsResponseDataModelSuccessImplCopyWithImpl<
          _$TeamsResponseDataModelSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TeamListDataModel data, ResponseStatus status)
        success,
    required TResult Function(ErrorResponseModel error, ResponseStatus status)
        error,
  }) {
    return success(data, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TeamListDataModel data, ResponseStatus status)? success,
    TResult? Function(ErrorResponseModel error, ResponseStatus status)? error,
  }) {
    return success?.call(data, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TeamListDataModel data, ResponseStatus status)? success,
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
    required TResult Function(_TeamsResponseDataModelSuccess value) success,
    required TResult Function(_TeamsResponseDataModelError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TeamsResponseDataModelSuccess value)? success,
    TResult? Function(_TeamsResponseDataModelError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TeamsResponseDataModelSuccess value)? success,
    TResult Function(_TeamsResponseDataModelError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamsResponseDataModelSuccessImplToJson(
      this,
    );
  }
}

abstract class _TeamsResponseDataModelSuccess
    implements TeamsResponseDataModel {
  const factory _TeamsResponseDataModelSuccess(
      {required final TeamListDataModel data,
      final ResponseStatus status}) = _$TeamsResponseDataModelSuccessImpl;

  factory _TeamsResponseDataModelSuccess.fromJson(Map<String, dynamic> json) =
      _$TeamsResponseDataModelSuccessImpl.fromJson;

  TeamListDataModel get data;
  @override
  ResponseStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$TeamsResponseDataModelSuccessImplCopyWith<
          _$TeamsResponseDataModelSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TeamsResponseDataModelErrorImplCopyWith<$Res>
    implements $TeamsResponseDataModelCopyWith<$Res> {
  factory _$$TeamsResponseDataModelErrorImplCopyWith(
          _$TeamsResponseDataModelErrorImpl value,
          $Res Function(_$TeamsResponseDataModelErrorImpl) then) =
      __$$TeamsResponseDataModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ErrorResponseModel error, ResponseStatus status});

  $ErrorResponseModelCopyWith<$Res> get error;
}

/// @nodoc
class __$$TeamsResponseDataModelErrorImplCopyWithImpl<$Res>
    extends _$TeamsResponseDataModelCopyWithImpl<$Res,
        _$TeamsResponseDataModelErrorImpl>
    implements _$$TeamsResponseDataModelErrorImplCopyWith<$Res> {
  __$$TeamsResponseDataModelErrorImplCopyWithImpl(
      _$TeamsResponseDataModelErrorImpl _value,
      $Res Function(_$TeamsResponseDataModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? status = null,
  }) {
    return _then(_$TeamsResponseDataModelErrorImpl(
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
class _$TeamsResponseDataModelErrorImpl
    implements _TeamsResponseDataModelError {
  const _$TeamsResponseDataModelErrorImpl(
      {required this.error,
      this.status = ResponseStatus.error,
      final String? $type})
      : $type = $type ?? 'error';

  factory _$TeamsResponseDataModelErrorImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TeamsResponseDataModelErrorImplFromJson(json);

  @override
  final ErrorResponseModel error;
  @override
  @JsonKey()
  final ResponseStatus status;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TeamsResponseDataModel.error(error: $error, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamsResponseDataModelErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamsResponseDataModelErrorImplCopyWith<_$TeamsResponseDataModelErrorImpl>
      get copyWith => __$$TeamsResponseDataModelErrorImplCopyWithImpl<
          _$TeamsResponseDataModelErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TeamListDataModel data, ResponseStatus status)
        success,
    required TResult Function(ErrorResponseModel error, ResponseStatus status)
        error,
  }) {
    return error(this.error, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TeamListDataModel data, ResponseStatus status)? success,
    TResult? Function(ErrorResponseModel error, ResponseStatus status)? error,
  }) {
    return error?.call(this.error, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TeamListDataModel data, ResponseStatus status)? success,
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
    required TResult Function(_TeamsResponseDataModelSuccess value) success,
    required TResult Function(_TeamsResponseDataModelError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TeamsResponseDataModelSuccess value)? success,
    TResult? Function(_TeamsResponseDataModelError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TeamsResponseDataModelSuccess value)? success,
    TResult Function(_TeamsResponseDataModelError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamsResponseDataModelErrorImplToJson(
      this,
    );
  }
}

abstract class _TeamsResponseDataModelError implements TeamsResponseDataModel {
  const factory _TeamsResponseDataModelError(
      {required final ErrorResponseModel error,
      final ResponseStatus status}) = _$TeamsResponseDataModelErrorImpl;

  factory _TeamsResponseDataModelError.fromJson(Map<String, dynamic> json) =
      _$TeamsResponseDataModelErrorImpl.fromJson;

  ErrorResponseModel get error;
  @override
  ResponseStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$TeamsResponseDataModelErrorImplCopyWith<_$TeamsResponseDataModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TeamListDataModel _$TeamListDataModelFromJson(Map<String, dynamic> json) {
  return _TeamListDataModel.fromJson(json);
}

/// @nodoc
mixin _$TeamListDataModel {
  List<TeamModel>? get teams => throw _privateConstructorUsedError;
  TeamModel? get team => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamListDataModelCopyWith<TeamListDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamListDataModelCopyWith<$Res> {
  factory $TeamListDataModelCopyWith(
          TeamListDataModel value, $Res Function(TeamListDataModel) then) =
      _$TeamListDataModelCopyWithImpl<$Res, TeamListDataModel>;
  @useResult
  $Res call({List<TeamModel>? teams, TeamModel? team});

  $TeamModelCopyWith<$Res>? get team;
}

/// @nodoc
class _$TeamListDataModelCopyWithImpl<$Res, $Val extends TeamListDataModel>
    implements $TeamListDataModelCopyWith<$Res> {
  _$TeamListDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = freezed,
    Object? team = freezed,
  }) {
    return _then(_value.copyWith(
      teams: freezed == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>?,
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamModelCopyWith<$Res>? get team {
    if (_value.team == null) {
      return null;
    }

    return $TeamModelCopyWith<$Res>(_value.team!, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeamListDataModelImplCopyWith<$Res>
    implements $TeamListDataModelCopyWith<$Res> {
  factory _$$TeamListDataModelImplCopyWith(_$TeamListDataModelImpl value,
          $Res Function(_$TeamListDataModelImpl) then) =
      __$$TeamListDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TeamModel>? teams, TeamModel? team});

  @override
  $TeamModelCopyWith<$Res>? get team;
}

/// @nodoc
class __$$TeamListDataModelImplCopyWithImpl<$Res>
    extends _$TeamListDataModelCopyWithImpl<$Res, _$TeamListDataModelImpl>
    implements _$$TeamListDataModelImplCopyWith<$Res> {
  __$$TeamListDataModelImplCopyWithImpl(_$TeamListDataModelImpl _value,
      $Res Function(_$TeamListDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = freezed,
    Object? team = freezed,
  }) {
    return _then(_$TeamListDataModelImpl(
      teams: freezed == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>?,
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamListDataModelImpl implements _TeamListDataModel {
  const _$TeamListDataModelImpl({final List<TeamModel>? teams, this.team})
      : _teams = teams;

  factory _$TeamListDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamListDataModelImplFromJson(json);

  final List<TeamModel>? _teams;
  @override
  List<TeamModel>? get teams {
    final value = _teams;
    if (value == null) return null;
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TeamModel? team;

  @override
  String toString() {
    return 'TeamListDataModel(teams: $teams, team: $team)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamListDataModelImpl &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            (identical(other.team, team) || other.team == team));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_teams), team);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamListDataModelImplCopyWith<_$TeamListDataModelImpl> get copyWith =>
      __$$TeamListDataModelImplCopyWithImpl<_$TeamListDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamListDataModelImplToJson(
      this,
    );
  }
}

abstract class _TeamListDataModel implements TeamListDataModel {
  const factory _TeamListDataModel(
      {final List<TeamModel>? teams,
      final TeamModel? team}) = _$TeamListDataModelImpl;

  factory _TeamListDataModel.fromJson(Map<String, dynamic> json) =
      _$TeamListDataModelImpl.fromJson;

  @override
  List<TeamModel>? get teams;
  @override
  TeamModel? get team;
  @override
  @JsonKey(ignore: true)
  _$$TeamListDataModelImplCopyWith<_$TeamListDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) {
  return _TeamModel.fromJson(json);
}

/// @nodoc
mixin _$TeamModel {
  SportLeague? get league => throw _privateConstructorUsedError;
  String? get abbrv => throw _privateConstructorUsedError;
  String? get colorHexPrimary => throw _privateConstructorUsedError;
  String? get colorHexSecondary => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo')
  String? get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_alt')
  String? get logoAltUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'official_logo')
  String? get officialLogo => throw _privateConstructorUsedError;
  String? get teamNumber => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get shortName => throw _privateConstructorUsedError;
  String? get franchiseName => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  TeamMetadata? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamModelCopyWith<TeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamModelCopyWith<$Res> {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) then) =
      _$TeamModelCopyWithImpl<$Res, TeamModel>;
  @useResult
  $Res call(
      {SportLeague? league,
      String? abbrv,
      String? colorHexPrimary,
      String? colorHexSecondary,
      @JsonKey(name: 'logo') String? logoUrl,
      @JsonKey(name: 'logo_alt') String? logoAltUrl,
      @JsonKey(name: 'official_logo') String? officialLogo,
      String? teamNumber,
      String? uuid,
      String? name,
      String? shortName,
      String? franchiseName,
      String? city,
      TeamMetadata? metadata});

  $TeamMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$TeamModelCopyWithImpl<$Res, $Val extends TeamModel>
    implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = freezed,
    Object? abbrv = freezed,
    Object? colorHexPrimary = freezed,
    Object? colorHexSecondary = freezed,
    Object? logoUrl = freezed,
    Object? logoAltUrl = freezed,
    Object? officialLogo = freezed,
    Object? teamNumber = freezed,
    Object? uuid = freezed,
    Object? name = freezed,
    Object? shortName = freezed,
    Object? franchiseName = freezed,
    Object? city = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague?,
      abbrv: freezed == abbrv
          ? _value.abbrv
          : abbrv // ignore: cast_nullable_to_non_nullable
              as String?,
      colorHexPrimary: freezed == colorHexPrimary
          ? _value.colorHexPrimary
          : colorHexPrimary // ignore: cast_nullable_to_non_nullable
              as String?,
      colorHexSecondary: freezed == colorHexSecondary
          ? _value.colorHexSecondary
          : colorHexSecondary // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      logoAltUrl: freezed == logoAltUrl
          ? _value.logoAltUrl
          : logoAltUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      officialLogo: freezed == officialLogo
          ? _value.officialLogo
          : officialLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      teamNumber: freezed == teamNumber
          ? _value.teamNumber
          : teamNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: freezed == franchiseName
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as TeamMetadata?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $TeamMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeamModelImplCopyWith<$Res>
    implements $TeamModelCopyWith<$Res> {
  factory _$$TeamModelImplCopyWith(
          _$TeamModelImpl value, $Res Function(_$TeamModelImpl) then) =
      __$$TeamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SportLeague? league,
      String? abbrv,
      String? colorHexPrimary,
      String? colorHexSecondary,
      @JsonKey(name: 'logo') String? logoUrl,
      @JsonKey(name: 'logo_alt') String? logoAltUrl,
      @JsonKey(name: 'official_logo') String? officialLogo,
      String? teamNumber,
      String? uuid,
      String? name,
      String? shortName,
      String? franchiseName,
      String? city,
      TeamMetadata? metadata});

  @override
  $TeamMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$TeamModelImplCopyWithImpl<$Res>
    extends _$TeamModelCopyWithImpl<$Res, _$TeamModelImpl>
    implements _$$TeamModelImplCopyWith<$Res> {
  __$$TeamModelImplCopyWithImpl(
      _$TeamModelImpl _value, $Res Function(_$TeamModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = freezed,
    Object? abbrv = freezed,
    Object? colorHexPrimary = freezed,
    Object? colorHexSecondary = freezed,
    Object? logoUrl = freezed,
    Object? logoAltUrl = freezed,
    Object? officialLogo = freezed,
    Object? teamNumber = freezed,
    Object? uuid = freezed,
    Object? name = freezed,
    Object? shortName = freezed,
    Object? franchiseName = freezed,
    Object? city = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$TeamModelImpl(
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague?,
      abbrv: freezed == abbrv
          ? _value.abbrv
          : abbrv // ignore: cast_nullable_to_non_nullable
              as String?,
      colorHexPrimary: freezed == colorHexPrimary
          ? _value.colorHexPrimary
          : colorHexPrimary // ignore: cast_nullable_to_non_nullable
              as String?,
      colorHexSecondary: freezed == colorHexSecondary
          ? _value.colorHexSecondary
          : colorHexSecondary // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      logoAltUrl: freezed == logoAltUrl
          ? _value.logoAltUrl
          : logoAltUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      officialLogo: freezed == officialLogo
          ? _value.officialLogo
          : officialLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      teamNumber: freezed == teamNumber
          ? _value.teamNumber
          : teamNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: freezed == franchiseName
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as TeamMetadata?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamModelImpl implements _TeamModel {
  const _$TeamModelImpl(
      {this.league,
      this.abbrv,
      this.colorHexPrimary,
      this.colorHexSecondary,
      @JsonKey(name: 'logo') this.logoUrl,
      @JsonKey(name: 'logo_alt') this.logoAltUrl,
      @JsonKey(name: 'official_logo') this.officialLogo,
      this.teamNumber,
      this.uuid,
      this.name,
      this.shortName,
      this.franchiseName,
      this.city,
      this.metadata});

  factory _$TeamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamModelImplFromJson(json);

  @override
  final SportLeague? league;
  @override
  final String? abbrv;
  @override
  final String? colorHexPrimary;
  @override
  final String? colorHexSecondary;
  @override
  @JsonKey(name: 'logo')
  final String? logoUrl;
  @override
  @JsonKey(name: 'logo_alt')
  final String? logoAltUrl;
  @override
  @JsonKey(name: 'official_logo')
  final String? officialLogo;
  @override
  final String? teamNumber;
  @override
  final String? uuid;
  @override
  final String? name;
  @override
  final String? shortName;
  @override
  final String? franchiseName;
  @override
  final String? city;
  @override
  final TeamMetadata? metadata;

  @override
  String toString() {
    return 'TeamModel(league: $league, abbrv: $abbrv, colorHexPrimary: $colorHexPrimary, colorHexSecondary: $colorHexSecondary, logoUrl: $logoUrl, logoAltUrl: $logoAltUrl, officialLogo: $officialLogo, teamNumber: $teamNumber, uuid: $uuid, name: $name, shortName: $shortName, franchiseName: $franchiseName, city: $city, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamModelImpl &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.abbrv, abbrv) || other.abbrv == abbrv) &&
            (identical(other.colorHexPrimary, colorHexPrimary) ||
                other.colorHexPrimary == colorHexPrimary) &&
            (identical(other.colorHexSecondary, colorHexSecondary) ||
                other.colorHexSecondary == colorHexSecondary) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.logoAltUrl, logoAltUrl) ||
                other.logoAltUrl == logoAltUrl) &&
            (identical(other.officialLogo, officialLogo) ||
                other.officialLogo == officialLogo) &&
            (identical(other.teamNumber, teamNumber) ||
                other.teamNumber == teamNumber) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.franchiseName, franchiseName) ||
                other.franchiseName == franchiseName) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      league,
      abbrv,
      colorHexPrimary,
      colorHexSecondary,
      logoUrl,
      logoAltUrl,
      officialLogo,
      teamNumber,
      uuid,
      name,
      shortName,
      franchiseName,
      city,
      metadata);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamModelImplCopyWith<_$TeamModelImpl> get copyWith =>
      __$$TeamModelImplCopyWithImpl<_$TeamModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamModelImplToJson(
      this,
    );
  }
}

abstract class _TeamModel implements TeamModel {
  const factory _TeamModel(
      {final SportLeague? league,
      final String? abbrv,
      final String? colorHexPrimary,
      final String? colorHexSecondary,
      @JsonKey(name: 'logo') final String? logoUrl,
      @JsonKey(name: 'logo_alt') final String? logoAltUrl,
      @JsonKey(name: 'official_logo') final String? officialLogo,
      final String? teamNumber,
      final String? uuid,
      final String? name,
      final String? shortName,
      final String? franchiseName,
      final String? city,
      final TeamMetadata? metadata}) = _$TeamModelImpl;

  factory _TeamModel.fromJson(Map<String, dynamic> json) =
      _$TeamModelImpl.fromJson;

  @override
  SportLeague? get league;
  @override
  String? get abbrv;
  @override
  String? get colorHexPrimary;
  @override
  String? get colorHexSecondary;
  @override
  @JsonKey(name: 'logo')
  String? get logoUrl;
  @override
  @JsonKey(name: 'logo_alt')
  String? get logoAltUrl;
  @override
  @JsonKey(name: 'official_logo')
  String? get officialLogo;
  @override
  String? get teamNumber;
  @override
  String? get uuid;
  @override
  String? get name;
  @override
  String? get shortName;
  @override
  String? get franchiseName;
  @override
  String? get city;
  @override
  TeamMetadata? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$TeamModelImplCopyWith<_$TeamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeamMetadata _$TeamMetadataFromJson(Map<String, dynamic> json) {
  switch (json['league']) {
    case 'cfb':
      return _CfbTeamMetadata.fromJson(json);
    case 'nfl':
      return _NflTeamMetadata.fromJson(json);
    case 'nba':
      return _NbaTeamMetadata.fromJson(json);
    case 'cbb':
      return _CbbTeamMetadata.fromJson(json);
    case 'ifl':
      return _IflTeamMetadata.fromJson(json);
    case 'mlb':
      return _MlbTeamMetadata.fromJson(json);
    case 'liv':
      return _GolfTeamMetadata.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'league', 'TeamMetadata',
          'Invalid union type "${json['league']}"!');
  }
}

/// @nodoc
mixin _$TeamMetadata {
  ConferenceDetails? get conference => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConferenceDetails? conference, int? apRanking)
        cfb,
    required TResult Function(ConferenceDetails? conference) nfl,
    required TResult Function(ConferenceDetails? conference) nba,
    required TResult Function(ConferenceDetails? conference) cbb,
    required TResult Function(ConferenceDetails? conference) ifl,
    required TResult Function(ConferenceDetails? conference) mlb,
    required TResult Function(ConferenceDetails? conference) liv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult? Function(ConferenceDetails? conference)? nfl,
    TResult? Function(ConferenceDetails? conference)? nba,
    TResult? Function(ConferenceDetails? conference)? cbb,
    TResult? Function(ConferenceDetails? conference)? ifl,
    TResult? Function(ConferenceDetails? conference)? mlb,
    TResult? Function(ConferenceDetails? conference)? liv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult Function(ConferenceDetails? conference)? nfl,
    TResult Function(ConferenceDetails? conference)? nba,
    TResult Function(ConferenceDetails? conference)? cbb,
    TResult Function(ConferenceDetails? conference)? ifl,
    TResult Function(ConferenceDetails? conference)? mlb,
    TResult Function(ConferenceDetails? conference)? liv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CfbTeamMetadata value) cfb,
    required TResult Function(_NflTeamMetadata value) nfl,
    required TResult Function(_NbaTeamMetadata value) nba,
    required TResult Function(_CbbTeamMetadata value) cbb,
    required TResult Function(_IflTeamMetadata value) ifl,
    required TResult Function(_MlbTeamMetadata value) mlb,
    required TResult Function(_GolfTeamMetadata value) liv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CfbTeamMetadata value)? cfb,
    TResult? Function(_NflTeamMetadata value)? nfl,
    TResult? Function(_NbaTeamMetadata value)? nba,
    TResult? Function(_CbbTeamMetadata value)? cbb,
    TResult? Function(_IflTeamMetadata value)? ifl,
    TResult? Function(_MlbTeamMetadata value)? mlb,
    TResult? Function(_GolfTeamMetadata value)? liv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CfbTeamMetadata value)? cfb,
    TResult Function(_NflTeamMetadata value)? nfl,
    TResult Function(_NbaTeamMetadata value)? nba,
    TResult Function(_CbbTeamMetadata value)? cbb,
    TResult Function(_IflTeamMetadata value)? ifl,
    TResult Function(_MlbTeamMetadata value)? mlb,
    TResult Function(_GolfTeamMetadata value)? liv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamMetadataCopyWith<TeamMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamMetadataCopyWith<$Res> {
  factory $TeamMetadataCopyWith(
          TeamMetadata value, $Res Function(TeamMetadata) then) =
      _$TeamMetadataCopyWithImpl<$Res, TeamMetadata>;
  @useResult
  $Res call({ConferenceDetails? conference});

  $ConferenceDetailsCopyWith<$Res>? get conference;
}

/// @nodoc
class _$TeamMetadataCopyWithImpl<$Res, $Val extends TeamMetadata>
    implements $TeamMetadataCopyWith<$Res> {
  _$TeamMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conference = freezed,
  }) {
    return _then(_value.copyWith(
      conference: freezed == conference
          ? _value.conference
          : conference // ignore: cast_nullable_to_non_nullable
              as ConferenceDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConferenceDetailsCopyWith<$Res>? get conference {
    if (_value.conference == null) {
      return null;
    }

    return $ConferenceDetailsCopyWith<$Res>(_value.conference!, (value) {
      return _then(_value.copyWith(conference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CfbTeamMetadataImplCopyWith<$Res>
    implements $TeamMetadataCopyWith<$Res> {
  factory _$$CfbTeamMetadataImplCopyWith(_$CfbTeamMetadataImpl value,
          $Res Function(_$CfbTeamMetadataImpl) then) =
      __$$CfbTeamMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConferenceDetails? conference, int? apRanking});

  @override
  $ConferenceDetailsCopyWith<$Res>? get conference;
}

/// @nodoc
class __$$CfbTeamMetadataImplCopyWithImpl<$Res>
    extends _$TeamMetadataCopyWithImpl<$Res, _$CfbTeamMetadataImpl>
    implements _$$CfbTeamMetadataImplCopyWith<$Res> {
  __$$CfbTeamMetadataImplCopyWithImpl(
      _$CfbTeamMetadataImpl _value, $Res Function(_$CfbTeamMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conference = freezed,
    Object? apRanking = freezed,
  }) {
    return _then(_$CfbTeamMetadataImpl(
      conference: freezed == conference
          ? _value.conference
          : conference // ignore: cast_nullable_to_non_nullable
              as ConferenceDetails?,
      apRanking: freezed == apRanking
          ? _value.apRanking
          : apRanking // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CfbTeamMetadataImpl implements _CfbTeamMetadata {
  const _$CfbTeamMetadataImpl(
      {this.conference, this.apRanking = null, final String? $type})
      : $type = $type ?? 'cfb';

  factory _$CfbTeamMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CfbTeamMetadataImplFromJson(json);

  @override
  final ConferenceDetails? conference;
  @override
  @JsonKey()
  final int? apRanking;

  @JsonKey(name: 'league')
  final String $type;

  @override
  String toString() {
    return 'TeamMetadata.cfb(conference: $conference, apRanking: $apRanking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CfbTeamMetadataImpl &&
            (identical(other.conference, conference) ||
                other.conference == conference) &&
            (identical(other.apRanking, apRanking) ||
                other.apRanking == apRanking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conference, apRanking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CfbTeamMetadataImplCopyWith<_$CfbTeamMetadataImpl> get copyWith =>
      __$$CfbTeamMetadataImplCopyWithImpl<_$CfbTeamMetadataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConferenceDetails? conference, int? apRanking)
        cfb,
    required TResult Function(ConferenceDetails? conference) nfl,
    required TResult Function(ConferenceDetails? conference) nba,
    required TResult Function(ConferenceDetails? conference) cbb,
    required TResult Function(ConferenceDetails? conference) ifl,
    required TResult Function(ConferenceDetails? conference) mlb,
    required TResult Function(ConferenceDetails? conference) liv,
  }) {
    return cfb(conference, apRanking);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult? Function(ConferenceDetails? conference)? nfl,
    TResult? Function(ConferenceDetails? conference)? nba,
    TResult? Function(ConferenceDetails? conference)? cbb,
    TResult? Function(ConferenceDetails? conference)? ifl,
    TResult? Function(ConferenceDetails? conference)? mlb,
    TResult? Function(ConferenceDetails? conference)? liv,
  }) {
    return cfb?.call(conference, apRanking);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult Function(ConferenceDetails? conference)? nfl,
    TResult Function(ConferenceDetails? conference)? nba,
    TResult Function(ConferenceDetails? conference)? cbb,
    TResult Function(ConferenceDetails? conference)? ifl,
    TResult Function(ConferenceDetails? conference)? mlb,
    TResult Function(ConferenceDetails? conference)? liv,
    required TResult orElse(),
  }) {
    if (cfb != null) {
      return cfb(conference, apRanking);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CfbTeamMetadata value) cfb,
    required TResult Function(_NflTeamMetadata value) nfl,
    required TResult Function(_NbaTeamMetadata value) nba,
    required TResult Function(_CbbTeamMetadata value) cbb,
    required TResult Function(_IflTeamMetadata value) ifl,
    required TResult Function(_MlbTeamMetadata value) mlb,
    required TResult Function(_GolfTeamMetadata value) liv,
  }) {
    return cfb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CfbTeamMetadata value)? cfb,
    TResult? Function(_NflTeamMetadata value)? nfl,
    TResult? Function(_NbaTeamMetadata value)? nba,
    TResult? Function(_CbbTeamMetadata value)? cbb,
    TResult? Function(_IflTeamMetadata value)? ifl,
    TResult? Function(_MlbTeamMetadata value)? mlb,
    TResult? Function(_GolfTeamMetadata value)? liv,
  }) {
    return cfb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CfbTeamMetadata value)? cfb,
    TResult Function(_NflTeamMetadata value)? nfl,
    TResult Function(_NbaTeamMetadata value)? nba,
    TResult Function(_CbbTeamMetadata value)? cbb,
    TResult Function(_IflTeamMetadata value)? ifl,
    TResult Function(_MlbTeamMetadata value)? mlb,
    TResult Function(_GolfTeamMetadata value)? liv,
    required TResult orElse(),
  }) {
    if (cfb != null) {
      return cfb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CfbTeamMetadataImplToJson(
      this,
    );
  }
}

abstract class _CfbTeamMetadata implements TeamMetadata {
  const factory _CfbTeamMetadata(
      {final ConferenceDetails? conference,
      final int? apRanking}) = _$CfbTeamMetadataImpl;

  factory _CfbTeamMetadata.fromJson(Map<String, dynamic> json) =
      _$CfbTeamMetadataImpl.fromJson;

  @override
  ConferenceDetails? get conference;
  int? get apRanking;
  @override
  @JsonKey(ignore: true)
  _$$CfbTeamMetadataImplCopyWith<_$CfbTeamMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NflTeamMetadataImplCopyWith<$Res>
    implements $TeamMetadataCopyWith<$Res> {
  factory _$$NflTeamMetadataImplCopyWith(_$NflTeamMetadataImpl value,
          $Res Function(_$NflTeamMetadataImpl) then) =
      __$$NflTeamMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConferenceDetails? conference});

  @override
  $ConferenceDetailsCopyWith<$Res>? get conference;
}

/// @nodoc
class __$$NflTeamMetadataImplCopyWithImpl<$Res>
    extends _$TeamMetadataCopyWithImpl<$Res, _$NflTeamMetadataImpl>
    implements _$$NflTeamMetadataImplCopyWith<$Res> {
  __$$NflTeamMetadataImplCopyWithImpl(
      _$NflTeamMetadataImpl _value, $Res Function(_$NflTeamMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conference = freezed,
  }) {
    return _then(_$NflTeamMetadataImpl(
      conference: freezed == conference
          ? _value.conference
          : conference // ignore: cast_nullable_to_non_nullable
              as ConferenceDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NflTeamMetadataImpl implements _NflTeamMetadata {
  const _$NflTeamMetadataImpl({this.conference, final String? $type})
      : $type = $type ?? 'nfl';

  factory _$NflTeamMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NflTeamMetadataImplFromJson(json);

  @override
  final ConferenceDetails? conference;

  @JsonKey(name: 'league')
  final String $type;

  @override
  String toString() {
    return 'TeamMetadata.nfl(conference: $conference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NflTeamMetadataImpl &&
            (identical(other.conference, conference) ||
                other.conference == conference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NflTeamMetadataImplCopyWith<_$NflTeamMetadataImpl> get copyWith =>
      __$$NflTeamMetadataImplCopyWithImpl<_$NflTeamMetadataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConferenceDetails? conference, int? apRanking)
        cfb,
    required TResult Function(ConferenceDetails? conference) nfl,
    required TResult Function(ConferenceDetails? conference) nba,
    required TResult Function(ConferenceDetails? conference) cbb,
    required TResult Function(ConferenceDetails? conference) ifl,
    required TResult Function(ConferenceDetails? conference) mlb,
    required TResult Function(ConferenceDetails? conference) liv,
  }) {
    return nfl(conference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult? Function(ConferenceDetails? conference)? nfl,
    TResult? Function(ConferenceDetails? conference)? nba,
    TResult? Function(ConferenceDetails? conference)? cbb,
    TResult? Function(ConferenceDetails? conference)? ifl,
    TResult? Function(ConferenceDetails? conference)? mlb,
    TResult? Function(ConferenceDetails? conference)? liv,
  }) {
    return nfl?.call(conference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult Function(ConferenceDetails? conference)? nfl,
    TResult Function(ConferenceDetails? conference)? nba,
    TResult Function(ConferenceDetails? conference)? cbb,
    TResult Function(ConferenceDetails? conference)? ifl,
    TResult Function(ConferenceDetails? conference)? mlb,
    TResult Function(ConferenceDetails? conference)? liv,
    required TResult orElse(),
  }) {
    if (nfl != null) {
      return nfl(conference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CfbTeamMetadata value) cfb,
    required TResult Function(_NflTeamMetadata value) nfl,
    required TResult Function(_NbaTeamMetadata value) nba,
    required TResult Function(_CbbTeamMetadata value) cbb,
    required TResult Function(_IflTeamMetadata value) ifl,
    required TResult Function(_MlbTeamMetadata value) mlb,
    required TResult Function(_GolfTeamMetadata value) liv,
  }) {
    return nfl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CfbTeamMetadata value)? cfb,
    TResult? Function(_NflTeamMetadata value)? nfl,
    TResult? Function(_NbaTeamMetadata value)? nba,
    TResult? Function(_CbbTeamMetadata value)? cbb,
    TResult? Function(_IflTeamMetadata value)? ifl,
    TResult? Function(_MlbTeamMetadata value)? mlb,
    TResult? Function(_GolfTeamMetadata value)? liv,
  }) {
    return nfl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CfbTeamMetadata value)? cfb,
    TResult Function(_NflTeamMetadata value)? nfl,
    TResult Function(_NbaTeamMetadata value)? nba,
    TResult Function(_CbbTeamMetadata value)? cbb,
    TResult Function(_IflTeamMetadata value)? ifl,
    TResult Function(_MlbTeamMetadata value)? mlb,
    TResult Function(_GolfTeamMetadata value)? liv,
    required TResult orElse(),
  }) {
    if (nfl != null) {
      return nfl(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NflTeamMetadataImplToJson(
      this,
    );
  }
}

abstract class _NflTeamMetadata implements TeamMetadata {
  const factory _NflTeamMetadata({final ConferenceDetails? conference}) =
      _$NflTeamMetadataImpl;

  factory _NflTeamMetadata.fromJson(Map<String, dynamic> json) =
      _$NflTeamMetadataImpl.fromJson;

  @override
  ConferenceDetails? get conference;
  @override
  @JsonKey(ignore: true)
  _$$NflTeamMetadataImplCopyWith<_$NflTeamMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NbaTeamMetadataImplCopyWith<$Res>
    implements $TeamMetadataCopyWith<$Res> {
  factory _$$NbaTeamMetadataImplCopyWith(_$NbaTeamMetadataImpl value,
          $Res Function(_$NbaTeamMetadataImpl) then) =
      __$$NbaTeamMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConferenceDetails? conference});

  @override
  $ConferenceDetailsCopyWith<$Res>? get conference;
}

/// @nodoc
class __$$NbaTeamMetadataImplCopyWithImpl<$Res>
    extends _$TeamMetadataCopyWithImpl<$Res, _$NbaTeamMetadataImpl>
    implements _$$NbaTeamMetadataImplCopyWith<$Res> {
  __$$NbaTeamMetadataImplCopyWithImpl(
      _$NbaTeamMetadataImpl _value, $Res Function(_$NbaTeamMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conference = freezed,
  }) {
    return _then(_$NbaTeamMetadataImpl(
      conference: freezed == conference
          ? _value.conference
          : conference // ignore: cast_nullable_to_non_nullable
              as ConferenceDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NbaTeamMetadataImpl implements _NbaTeamMetadata {
  const _$NbaTeamMetadataImpl({this.conference, final String? $type})
      : $type = $type ?? 'nba';

  factory _$NbaTeamMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NbaTeamMetadataImplFromJson(json);

  @override
  final ConferenceDetails? conference;

  @JsonKey(name: 'league')
  final String $type;

  @override
  String toString() {
    return 'TeamMetadata.nba(conference: $conference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NbaTeamMetadataImpl &&
            (identical(other.conference, conference) ||
                other.conference == conference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NbaTeamMetadataImplCopyWith<_$NbaTeamMetadataImpl> get copyWith =>
      __$$NbaTeamMetadataImplCopyWithImpl<_$NbaTeamMetadataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConferenceDetails? conference, int? apRanking)
        cfb,
    required TResult Function(ConferenceDetails? conference) nfl,
    required TResult Function(ConferenceDetails? conference) nba,
    required TResult Function(ConferenceDetails? conference) cbb,
    required TResult Function(ConferenceDetails? conference) ifl,
    required TResult Function(ConferenceDetails? conference) mlb,
    required TResult Function(ConferenceDetails? conference) liv,
  }) {
    return nba(conference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult? Function(ConferenceDetails? conference)? nfl,
    TResult? Function(ConferenceDetails? conference)? nba,
    TResult? Function(ConferenceDetails? conference)? cbb,
    TResult? Function(ConferenceDetails? conference)? ifl,
    TResult? Function(ConferenceDetails? conference)? mlb,
    TResult? Function(ConferenceDetails? conference)? liv,
  }) {
    return nba?.call(conference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult Function(ConferenceDetails? conference)? nfl,
    TResult Function(ConferenceDetails? conference)? nba,
    TResult Function(ConferenceDetails? conference)? cbb,
    TResult Function(ConferenceDetails? conference)? ifl,
    TResult Function(ConferenceDetails? conference)? mlb,
    TResult Function(ConferenceDetails? conference)? liv,
    required TResult orElse(),
  }) {
    if (nba != null) {
      return nba(conference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CfbTeamMetadata value) cfb,
    required TResult Function(_NflTeamMetadata value) nfl,
    required TResult Function(_NbaTeamMetadata value) nba,
    required TResult Function(_CbbTeamMetadata value) cbb,
    required TResult Function(_IflTeamMetadata value) ifl,
    required TResult Function(_MlbTeamMetadata value) mlb,
    required TResult Function(_GolfTeamMetadata value) liv,
  }) {
    return nba(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CfbTeamMetadata value)? cfb,
    TResult? Function(_NflTeamMetadata value)? nfl,
    TResult? Function(_NbaTeamMetadata value)? nba,
    TResult? Function(_CbbTeamMetadata value)? cbb,
    TResult? Function(_IflTeamMetadata value)? ifl,
    TResult? Function(_MlbTeamMetadata value)? mlb,
    TResult? Function(_GolfTeamMetadata value)? liv,
  }) {
    return nba?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CfbTeamMetadata value)? cfb,
    TResult Function(_NflTeamMetadata value)? nfl,
    TResult Function(_NbaTeamMetadata value)? nba,
    TResult Function(_CbbTeamMetadata value)? cbb,
    TResult Function(_IflTeamMetadata value)? ifl,
    TResult Function(_MlbTeamMetadata value)? mlb,
    TResult Function(_GolfTeamMetadata value)? liv,
    required TResult orElse(),
  }) {
    if (nba != null) {
      return nba(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NbaTeamMetadataImplToJson(
      this,
    );
  }
}

abstract class _NbaTeamMetadata implements TeamMetadata {
  const factory _NbaTeamMetadata({final ConferenceDetails? conference}) =
      _$NbaTeamMetadataImpl;

  factory _NbaTeamMetadata.fromJson(Map<String, dynamic> json) =
      _$NbaTeamMetadataImpl.fromJson;

  @override
  ConferenceDetails? get conference;
  @override
  @JsonKey(ignore: true)
  _$$NbaTeamMetadataImplCopyWith<_$NbaTeamMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CbbTeamMetadataImplCopyWith<$Res>
    implements $TeamMetadataCopyWith<$Res> {
  factory _$$CbbTeamMetadataImplCopyWith(_$CbbTeamMetadataImpl value,
          $Res Function(_$CbbTeamMetadataImpl) then) =
      __$$CbbTeamMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConferenceDetails? conference});

  @override
  $ConferenceDetailsCopyWith<$Res>? get conference;
}

/// @nodoc
class __$$CbbTeamMetadataImplCopyWithImpl<$Res>
    extends _$TeamMetadataCopyWithImpl<$Res, _$CbbTeamMetadataImpl>
    implements _$$CbbTeamMetadataImplCopyWith<$Res> {
  __$$CbbTeamMetadataImplCopyWithImpl(
      _$CbbTeamMetadataImpl _value, $Res Function(_$CbbTeamMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conference = freezed,
  }) {
    return _then(_$CbbTeamMetadataImpl(
      conference: freezed == conference
          ? _value.conference
          : conference // ignore: cast_nullable_to_non_nullable
              as ConferenceDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CbbTeamMetadataImpl implements _CbbTeamMetadata {
  const _$CbbTeamMetadataImpl({this.conference, final String? $type})
      : $type = $type ?? 'cbb';

  factory _$CbbTeamMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CbbTeamMetadataImplFromJson(json);

  @override
  final ConferenceDetails? conference;

  @JsonKey(name: 'league')
  final String $type;

  @override
  String toString() {
    return 'TeamMetadata.cbb(conference: $conference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CbbTeamMetadataImpl &&
            (identical(other.conference, conference) ||
                other.conference == conference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CbbTeamMetadataImplCopyWith<_$CbbTeamMetadataImpl> get copyWith =>
      __$$CbbTeamMetadataImplCopyWithImpl<_$CbbTeamMetadataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConferenceDetails? conference, int? apRanking)
        cfb,
    required TResult Function(ConferenceDetails? conference) nfl,
    required TResult Function(ConferenceDetails? conference) nba,
    required TResult Function(ConferenceDetails? conference) cbb,
    required TResult Function(ConferenceDetails? conference) ifl,
    required TResult Function(ConferenceDetails? conference) mlb,
    required TResult Function(ConferenceDetails? conference) liv,
  }) {
    return cbb(conference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult? Function(ConferenceDetails? conference)? nfl,
    TResult? Function(ConferenceDetails? conference)? nba,
    TResult? Function(ConferenceDetails? conference)? cbb,
    TResult? Function(ConferenceDetails? conference)? ifl,
    TResult? Function(ConferenceDetails? conference)? mlb,
    TResult? Function(ConferenceDetails? conference)? liv,
  }) {
    return cbb?.call(conference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult Function(ConferenceDetails? conference)? nfl,
    TResult Function(ConferenceDetails? conference)? nba,
    TResult Function(ConferenceDetails? conference)? cbb,
    TResult Function(ConferenceDetails? conference)? ifl,
    TResult Function(ConferenceDetails? conference)? mlb,
    TResult Function(ConferenceDetails? conference)? liv,
    required TResult orElse(),
  }) {
    if (cbb != null) {
      return cbb(conference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CfbTeamMetadata value) cfb,
    required TResult Function(_NflTeamMetadata value) nfl,
    required TResult Function(_NbaTeamMetadata value) nba,
    required TResult Function(_CbbTeamMetadata value) cbb,
    required TResult Function(_IflTeamMetadata value) ifl,
    required TResult Function(_MlbTeamMetadata value) mlb,
    required TResult Function(_GolfTeamMetadata value) liv,
  }) {
    return cbb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CfbTeamMetadata value)? cfb,
    TResult? Function(_NflTeamMetadata value)? nfl,
    TResult? Function(_NbaTeamMetadata value)? nba,
    TResult? Function(_CbbTeamMetadata value)? cbb,
    TResult? Function(_IflTeamMetadata value)? ifl,
    TResult? Function(_MlbTeamMetadata value)? mlb,
    TResult? Function(_GolfTeamMetadata value)? liv,
  }) {
    return cbb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CfbTeamMetadata value)? cfb,
    TResult Function(_NflTeamMetadata value)? nfl,
    TResult Function(_NbaTeamMetadata value)? nba,
    TResult Function(_CbbTeamMetadata value)? cbb,
    TResult Function(_IflTeamMetadata value)? ifl,
    TResult Function(_MlbTeamMetadata value)? mlb,
    TResult Function(_GolfTeamMetadata value)? liv,
    required TResult orElse(),
  }) {
    if (cbb != null) {
      return cbb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CbbTeamMetadataImplToJson(
      this,
    );
  }
}

abstract class _CbbTeamMetadata implements TeamMetadata {
  const factory _CbbTeamMetadata({final ConferenceDetails? conference}) =
      _$CbbTeamMetadataImpl;

  factory _CbbTeamMetadata.fromJson(Map<String, dynamic> json) =
      _$CbbTeamMetadataImpl.fromJson;

  @override
  ConferenceDetails? get conference;
  @override
  @JsonKey(ignore: true)
  _$$CbbTeamMetadataImplCopyWith<_$CbbTeamMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IflTeamMetadataImplCopyWith<$Res>
    implements $TeamMetadataCopyWith<$Res> {
  factory _$$IflTeamMetadataImplCopyWith(_$IflTeamMetadataImpl value,
          $Res Function(_$IflTeamMetadataImpl) then) =
      __$$IflTeamMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConferenceDetails? conference});

  @override
  $ConferenceDetailsCopyWith<$Res>? get conference;
}

/// @nodoc
class __$$IflTeamMetadataImplCopyWithImpl<$Res>
    extends _$TeamMetadataCopyWithImpl<$Res, _$IflTeamMetadataImpl>
    implements _$$IflTeamMetadataImplCopyWith<$Res> {
  __$$IflTeamMetadataImplCopyWithImpl(
      _$IflTeamMetadataImpl _value, $Res Function(_$IflTeamMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conference = freezed,
  }) {
    return _then(_$IflTeamMetadataImpl(
      conference: freezed == conference
          ? _value.conference
          : conference // ignore: cast_nullable_to_non_nullable
              as ConferenceDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IflTeamMetadataImpl implements _IflTeamMetadata {
  const _$IflTeamMetadataImpl({this.conference, final String? $type})
      : $type = $type ?? 'ifl';

  factory _$IflTeamMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$IflTeamMetadataImplFromJson(json);

  @override
  final ConferenceDetails? conference;

  @JsonKey(name: 'league')
  final String $type;

  @override
  String toString() {
    return 'TeamMetadata.ifl(conference: $conference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IflTeamMetadataImpl &&
            (identical(other.conference, conference) ||
                other.conference == conference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IflTeamMetadataImplCopyWith<_$IflTeamMetadataImpl> get copyWith =>
      __$$IflTeamMetadataImplCopyWithImpl<_$IflTeamMetadataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConferenceDetails? conference, int? apRanking)
        cfb,
    required TResult Function(ConferenceDetails? conference) nfl,
    required TResult Function(ConferenceDetails? conference) nba,
    required TResult Function(ConferenceDetails? conference) cbb,
    required TResult Function(ConferenceDetails? conference) ifl,
    required TResult Function(ConferenceDetails? conference) mlb,
    required TResult Function(ConferenceDetails? conference) liv,
  }) {
    return ifl(conference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult? Function(ConferenceDetails? conference)? nfl,
    TResult? Function(ConferenceDetails? conference)? nba,
    TResult? Function(ConferenceDetails? conference)? cbb,
    TResult? Function(ConferenceDetails? conference)? ifl,
    TResult? Function(ConferenceDetails? conference)? mlb,
    TResult? Function(ConferenceDetails? conference)? liv,
  }) {
    return ifl?.call(conference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult Function(ConferenceDetails? conference)? nfl,
    TResult Function(ConferenceDetails? conference)? nba,
    TResult Function(ConferenceDetails? conference)? cbb,
    TResult Function(ConferenceDetails? conference)? ifl,
    TResult Function(ConferenceDetails? conference)? mlb,
    TResult Function(ConferenceDetails? conference)? liv,
    required TResult orElse(),
  }) {
    if (ifl != null) {
      return ifl(conference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CfbTeamMetadata value) cfb,
    required TResult Function(_NflTeamMetadata value) nfl,
    required TResult Function(_NbaTeamMetadata value) nba,
    required TResult Function(_CbbTeamMetadata value) cbb,
    required TResult Function(_IflTeamMetadata value) ifl,
    required TResult Function(_MlbTeamMetadata value) mlb,
    required TResult Function(_GolfTeamMetadata value) liv,
  }) {
    return ifl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CfbTeamMetadata value)? cfb,
    TResult? Function(_NflTeamMetadata value)? nfl,
    TResult? Function(_NbaTeamMetadata value)? nba,
    TResult? Function(_CbbTeamMetadata value)? cbb,
    TResult? Function(_IflTeamMetadata value)? ifl,
    TResult? Function(_MlbTeamMetadata value)? mlb,
    TResult? Function(_GolfTeamMetadata value)? liv,
  }) {
    return ifl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CfbTeamMetadata value)? cfb,
    TResult Function(_NflTeamMetadata value)? nfl,
    TResult Function(_NbaTeamMetadata value)? nba,
    TResult Function(_CbbTeamMetadata value)? cbb,
    TResult Function(_IflTeamMetadata value)? ifl,
    TResult Function(_MlbTeamMetadata value)? mlb,
    TResult Function(_GolfTeamMetadata value)? liv,
    required TResult orElse(),
  }) {
    if (ifl != null) {
      return ifl(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IflTeamMetadataImplToJson(
      this,
    );
  }
}

abstract class _IflTeamMetadata implements TeamMetadata {
  const factory _IflTeamMetadata({final ConferenceDetails? conference}) =
      _$IflTeamMetadataImpl;

  factory _IflTeamMetadata.fromJson(Map<String, dynamic> json) =
      _$IflTeamMetadataImpl.fromJson;

  @override
  ConferenceDetails? get conference;
  @override
  @JsonKey(ignore: true)
  _$$IflTeamMetadataImplCopyWith<_$IflTeamMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MlbTeamMetadataImplCopyWith<$Res>
    implements $TeamMetadataCopyWith<$Res> {
  factory _$$MlbTeamMetadataImplCopyWith(_$MlbTeamMetadataImpl value,
          $Res Function(_$MlbTeamMetadataImpl) then) =
      __$$MlbTeamMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConferenceDetails? conference});

  @override
  $ConferenceDetailsCopyWith<$Res>? get conference;
}

/// @nodoc
class __$$MlbTeamMetadataImplCopyWithImpl<$Res>
    extends _$TeamMetadataCopyWithImpl<$Res, _$MlbTeamMetadataImpl>
    implements _$$MlbTeamMetadataImplCopyWith<$Res> {
  __$$MlbTeamMetadataImplCopyWithImpl(
      _$MlbTeamMetadataImpl _value, $Res Function(_$MlbTeamMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conference = freezed,
  }) {
    return _then(_$MlbTeamMetadataImpl(
      conference: freezed == conference
          ? _value.conference
          : conference // ignore: cast_nullable_to_non_nullable
              as ConferenceDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MlbTeamMetadataImpl implements _MlbTeamMetadata {
  const _$MlbTeamMetadataImpl({this.conference, final String? $type})
      : $type = $type ?? 'mlb';

  factory _$MlbTeamMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MlbTeamMetadataImplFromJson(json);

  @override
  final ConferenceDetails? conference;

  @JsonKey(name: 'league')
  final String $type;

  @override
  String toString() {
    return 'TeamMetadata.mlb(conference: $conference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MlbTeamMetadataImpl &&
            (identical(other.conference, conference) ||
                other.conference == conference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MlbTeamMetadataImplCopyWith<_$MlbTeamMetadataImpl> get copyWith =>
      __$$MlbTeamMetadataImplCopyWithImpl<_$MlbTeamMetadataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConferenceDetails? conference, int? apRanking)
        cfb,
    required TResult Function(ConferenceDetails? conference) nfl,
    required TResult Function(ConferenceDetails? conference) nba,
    required TResult Function(ConferenceDetails? conference) cbb,
    required TResult Function(ConferenceDetails? conference) ifl,
    required TResult Function(ConferenceDetails? conference) mlb,
    required TResult Function(ConferenceDetails? conference) liv,
  }) {
    return mlb(conference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult? Function(ConferenceDetails? conference)? nfl,
    TResult? Function(ConferenceDetails? conference)? nba,
    TResult? Function(ConferenceDetails? conference)? cbb,
    TResult? Function(ConferenceDetails? conference)? ifl,
    TResult? Function(ConferenceDetails? conference)? mlb,
    TResult? Function(ConferenceDetails? conference)? liv,
  }) {
    return mlb?.call(conference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult Function(ConferenceDetails? conference)? nfl,
    TResult Function(ConferenceDetails? conference)? nba,
    TResult Function(ConferenceDetails? conference)? cbb,
    TResult Function(ConferenceDetails? conference)? ifl,
    TResult Function(ConferenceDetails? conference)? mlb,
    TResult Function(ConferenceDetails? conference)? liv,
    required TResult orElse(),
  }) {
    if (mlb != null) {
      return mlb(conference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CfbTeamMetadata value) cfb,
    required TResult Function(_NflTeamMetadata value) nfl,
    required TResult Function(_NbaTeamMetadata value) nba,
    required TResult Function(_CbbTeamMetadata value) cbb,
    required TResult Function(_IflTeamMetadata value) ifl,
    required TResult Function(_MlbTeamMetadata value) mlb,
    required TResult Function(_GolfTeamMetadata value) liv,
  }) {
    return mlb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CfbTeamMetadata value)? cfb,
    TResult? Function(_NflTeamMetadata value)? nfl,
    TResult? Function(_NbaTeamMetadata value)? nba,
    TResult? Function(_CbbTeamMetadata value)? cbb,
    TResult? Function(_IflTeamMetadata value)? ifl,
    TResult? Function(_MlbTeamMetadata value)? mlb,
    TResult? Function(_GolfTeamMetadata value)? liv,
  }) {
    return mlb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CfbTeamMetadata value)? cfb,
    TResult Function(_NflTeamMetadata value)? nfl,
    TResult Function(_NbaTeamMetadata value)? nba,
    TResult Function(_CbbTeamMetadata value)? cbb,
    TResult Function(_IflTeamMetadata value)? ifl,
    TResult Function(_MlbTeamMetadata value)? mlb,
    TResult Function(_GolfTeamMetadata value)? liv,
    required TResult orElse(),
  }) {
    if (mlb != null) {
      return mlb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MlbTeamMetadataImplToJson(
      this,
    );
  }
}

abstract class _MlbTeamMetadata implements TeamMetadata {
  const factory _MlbTeamMetadata({final ConferenceDetails? conference}) =
      _$MlbTeamMetadataImpl;

  factory _MlbTeamMetadata.fromJson(Map<String, dynamic> json) =
      _$MlbTeamMetadataImpl.fromJson;

  @override
  ConferenceDetails? get conference;
  @override
  @JsonKey(ignore: true)
  _$$MlbTeamMetadataImplCopyWith<_$MlbTeamMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GolfTeamMetadataImplCopyWith<$Res>
    implements $TeamMetadataCopyWith<$Res> {
  factory _$$GolfTeamMetadataImplCopyWith(_$GolfTeamMetadataImpl value,
          $Res Function(_$GolfTeamMetadataImpl) then) =
      __$$GolfTeamMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConferenceDetails? conference});

  @override
  $ConferenceDetailsCopyWith<$Res>? get conference;
}

/// @nodoc
class __$$GolfTeamMetadataImplCopyWithImpl<$Res>
    extends _$TeamMetadataCopyWithImpl<$Res, _$GolfTeamMetadataImpl>
    implements _$$GolfTeamMetadataImplCopyWith<$Res> {
  __$$GolfTeamMetadataImplCopyWithImpl(_$GolfTeamMetadataImpl _value,
      $Res Function(_$GolfTeamMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conference = freezed,
  }) {
    return _then(_$GolfTeamMetadataImpl(
      conference: freezed == conference
          ? _value.conference
          : conference // ignore: cast_nullable_to_non_nullable
              as ConferenceDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GolfTeamMetadataImpl implements _GolfTeamMetadata {
  const _$GolfTeamMetadataImpl({this.conference, final String? $type})
      : $type = $type ?? 'liv';

  factory _$GolfTeamMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GolfTeamMetadataImplFromJson(json);

  @override
  final ConferenceDetails? conference;

  @JsonKey(name: 'league')
  final String $type;

  @override
  String toString() {
    return 'TeamMetadata.liv(conference: $conference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GolfTeamMetadataImpl &&
            (identical(other.conference, conference) ||
                other.conference == conference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GolfTeamMetadataImplCopyWith<_$GolfTeamMetadataImpl> get copyWith =>
      __$$GolfTeamMetadataImplCopyWithImpl<_$GolfTeamMetadataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConferenceDetails? conference, int? apRanking)
        cfb,
    required TResult Function(ConferenceDetails? conference) nfl,
    required TResult Function(ConferenceDetails? conference) nba,
    required TResult Function(ConferenceDetails? conference) cbb,
    required TResult Function(ConferenceDetails? conference) ifl,
    required TResult Function(ConferenceDetails? conference) mlb,
    required TResult Function(ConferenceDetails? conference) liv,
  }) {
    return liv(conference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult? Function(ConferenceDetails? conference)? nfl,
    TResult? Function(ConferenceDetails? conference)? nba,
    TResult? Function(ConferenceDetails? conference)? cbb,
    TResult? Function(ConferenceDetails? conference)? ifl,
    TResult? Function(ConferenceDetails? conference)? mlb,
    TResult? Function(ConferenceDetails? conference)? liv,
  }) {
    return liv?.call(conference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConferenceDetails? conference, int? apRanking)? cfb,
    TResult Function(ConferenceDetails? conference)? nfl,
    TResult Function(ConferenceDetails? conference)? nba,
    TResult Function(ConferenceDetails? conference)? cbb,
    TResult Function(ConferenceDetails? conference)? ifl,
    TResult Function(ConferenceDetails? conference)? mlb,
    TResult Function(ConferenceDetails? conference)? liv,
    required TResult orElse(),
  }) {
    if (liv != null) {
      return liv(conference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CfbTeamMetadata value) cfb,
    required TResult Function(_NflTeamMetadata value) nfl,
    required TResult Function(_NbaTeamMetadata value) nba,
    required TResult Function(_CbbTeamMetadata value) cbb,
    required TResult Function(_IflTeamMetadata value) ifl,
    required TResult Function(_MlbTeamMetadata value) mlb,
    required TResult Function(_GolfTeamMetadata value) liv,
  }) {
    return liv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CfbTeamMetadata value)? cfb,
    TResult? Function(_NflTeamMetadata value)? nfl,
    TResult? Function(_NbaTeamMetadata value)? nba,
    TResult? Function(_CbbTeamMetadata value)? cbb,
    TResult? Function(_IflTeamMetadata value)? ifl,
    TResult? Function(_MlbTeamMetadata value)? mlb,
    TResult? Function(_GolfTeamMetadata value)? liv,
  }) {
    return liv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CfbTeamMetadata value)? cfb,
    TResult Function(_NflTeamMetadata value)? nfl,
    TResult Function(_NbaTeamMetadata value)? nba,
    TResult Function(_CbbTeamMetadata value)? cbb,
    TResult Function(_IflTeamMetadata value)? ifl,
    TResult Function(_MlbTeamMetadata value)? mlb,
    TResult Function(_GolfTeamMetadata value)? liv,
    required TResult orElse(),
  }) {
    if (liv != null) {
      return liv(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GolfTeamMetadataImplToJson(
      this,
    );
  }
}

abstract class _GolfTeamMetadata implements TeamMetadata {
  const factory _GolfTeamMetadata({final ConferenceDetails? conference}) =
      _$GolfTeamMetadataImpl;

  factory _GolfTeamMetadata.fromJson(Map<String, dynamic> json) =
      _$GolfTeamMetadataImpl.fromJson;

  @override
  ConferenceDetails? get conference;
  @override
  @JsonKey(ignore: true)
  _$$GolfTeamMetadataImplCopyWith<_$GolfTeamMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConferenceDetails _$ConferenceDetailsFromJson(Map<String, dynamic> json) {
  return _ConferenceDetails.fromJson(json);
}

/// @nodoc
mixin _$ConferenceDetails {
  String? get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get abbreviation => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConferenceDetailsCopyWith<ConferenceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConferenceDetailsCopyWith<$Res> {
  factory $ConferenceDetailsCopyWith(
          ConferenceDetails value, $Res Function(ConferenceDetails) then) =
      _$ConferenceDetailsCopyWithImpl<$Res, ConferenceDetails>;
  @useResult
  $Res call({String? name, String? id, String? abbreviation, String? slug});
}

/// @nodoc
class _$ConferenceDetailsCopyWithImpl<$Res, $Val extends ConferenceDetails>
    implements $ConferenceDetailsCopyWith<$Res> {
  _$ConferenceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? abbreviation = freezed,
    Object? slug = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      abbreviation: freezed == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConferenceDetailsImplCopyWith<$Res>
    implements $ConferenceDetailsCopyWith<$Res> {
  factory _$$ConferenceDetailsImplCopyWith(_$ConferenceDetailsImpl value,
          $Res Function(_$ConferenceDetailsImpl) then) =
      __$$ConferenceDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? id, String? abbreviation, String? slug});
}

/// @nodoc
class __$$ConferenceDetailsImplCopyWithImpl<$Res>
    extends _$ConferenceDetailsCopyWithImpl<$Res, _$ConferenceDetailsImpl>
    implements _$$ConferenceDetailsImplCopyWith<$Res> {
  __$$ConferenceDetailsImplCopyWithImpl(_$ConferenceDetailsImpl _value,
      $Res Function(_$ConferenceDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? abbreviation = freezed,
    Object? slug = freezed,
  }) {
    return _then(_$ConferenceDetailsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      abbreviation: freezed == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConferenceDetailsImpl implements _ConferenceDetails {
  const _$ConferenceDetailsImpl(
      {this.name, this.id, this.abbreviation, this.slug});

  factory _$ConferenceDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConferenceDetailsImplFromJson(json);

  @override
  final String? name;
  @override
  final String? id;
  @override
  final String? abbreviation;
  @override
  final String? slug;

  @override
  String toString() {
    return 'ConferenceDetails(name: $name, id: $id, abbreviation: $abbreviation, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConferenceDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.abbreviation, abbreviation) ||
                other.abbreviation == abbreviation) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, abbreviation, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConferenceDetailsImplCopyWith<_$ConferenceDetailsImpl> get copyWith =>
      __$$ConferenceDetailsImplCopyWithImpl<_$ConferenceDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConferenceDetailsImplToJson(
      this,
    );
  }
}

abstract class _ConferenceDetails implements ConferenceDetails {
  const factory _ConferenceDetails(
      {final String? name,
      final String? id,
      final String? abbreviation,
      final String? slug}) = _$ConferenceDetailsImpl;

  factory _ConferenceDetails.fromJson(Map<String, dynamic> json) =
      _$ConferenceDetailsImpl.fromJson;

  @override
  String? get name;
  @override
  String? get id;
  @override
  String? get abbreviation;
  @override
  String? get slug;
  @override
  @JsonKey(ignore: true)
  _$$ConferenceDetailsImplCopyWith<_$ConferenceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
