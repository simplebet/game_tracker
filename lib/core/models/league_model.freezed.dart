// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'league_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaguesResponseDataModel _$LeaguesResponseDataModelFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return _LeaguesResponseDataModelSuccess.fromJson(json);
    case 'error':
      return _LeaguesResponseDataModelError.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'LeaguesResponseDataModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$LeaguesResponseDataModel {
  ResponseStatus get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LeagueListDataModel data, ResponseStatus status)
        success,
    required TResult Function(ErrorResponseModel error, ResponseStatus status)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LeagueListDataModel data, ResponseStatus status)? success,
    TResult? Function(ErrorResponseModel error, ResponseStatus status)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LeagueListDataModel data, ResponseStatus status)? success,
    TResult Function(ErrorResponseModel error, ResponseStatus status)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LeaguesResponseDataModelSuccess value) success,
    required TResult Function(_LeaguesResponseDataModelError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LeaguesResponseDataModelSuccess value)? success,
    TResult? Function(_LeaguesResponseDataModelError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LeaguesResponseDataModelSuccess value)? success,
    TResult Function(_LeaguesResponseDataModelError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaguesResponseDataModelCopyWith<LeaguesResponseDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaguesResponseDataModelCopyWith<$Res> {
  factory $LeaguesResponseDataModelCopyWith(LeaguesResponseDataModel value,
          $Res Function(LeaguesResponseDataModel) then) =
      _$LeaguesResponseDataModelCopyWithImpl<$Res, LeaguesResponseDataModel>;
  @useResult
  $Res call({ResponseStatus status});
}

/// @nodoc
class _$LeaguesResponseDataModelCopyWithImpl<$Res,
        $Val extends LeaguesResponseDataModel>
    implements $LeaguesResponseDataModelCopyWith<$Res> {
  _$LeaguesResponseDataModelCopyWithImpl(this._value, this._then);

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
abstract class _$$LeaguesResponseDataModelSuccessImplCopyWith<$Res>
    implements $LeaguesResponseDataModelCopyWith<$Res> {
  factory _$$LeaguesResponseDataModelSuccessImplCopyWith(
          _$LeaguesResponseDataModelSuccessImpl value,
          $Res Function(_$LeaguesResponseDataModelSuccessImpl) then) =
      __$$LeaguesResponseDataModelSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LeagueListDataModel data, ResponseStatus status});

  $LeagueListDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$LeaguesResponseDataModelSuccessImplCopyWithImpl<$Res>
    extends _$LeaguesResponseDataModelCopyWithImpl<$Res,
        _$LeaguesResponseDataModelSuccessImpl>
    implements _$$LeaguesResponseDataModelSuccessImplCopyWith<$Res> {
  __$$LeaguesResponseDataModelSuccessImplCopyWithImpl(
      _$LeaguesResponseDataModelSuccessImpl _value,
      $Res Function(_$LeaguesResponseDataModelSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_$LeaguesResponseDataModelSuccessImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LeagueListDataModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResponseStatus,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LeagueListDataModelCopyWith<$Res> get data {
    return $LeagueListDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaguesResponseDataModelSuccessImpl
    implements _LeaguesResponseDataModelSuccess {
  const _$LeaguesResponseDataModelSuccessImpl(
      {required this.data,
      this.status = ResponseStatus.success,
      final String? $type})
      : $type = $type ?? 'success';

  factory _$LeaguesResponseDataModelSuccessImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LeaguesResponseDataModelSuccessImplFromJson(json);

  @override
  final LeagueListDataModel data;
  @override
  @JsonKey()
  final ResponseStatus status;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LeaguesResponseDataModel.success(data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaguesResponseDataModelSuccessImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaguesResponseDataModelSuccessImplCopyWith<
          _$LeaguesResponseDataModelSuccessImpl>
      get copyWith => __$$LeaguesResponseDataModelSuccessImplCopyWithImpl<
          _$LeaguesResponseDataModelSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LeagueListDataModel data, ResponseStatus status)
        success,
    required TResult Function(ErrorResponseModel error, ResponseStatus status)
        error,
  }) {
    return success(data, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LeagueListDataModel data, ResponseStatus status)? success,
    TResult? Function(ErrorResponseModel error, ResponseStatus status)? error,
  }) {
    return success?.call(data, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LeagueListDataModel data, ResponseStatus status)? success,
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
    required TResult Function(_LeaguesResponseDataModelSuccess value) success,
    required TResult Function(_LeaguesResponseDataModelError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LeaguesResponseDataModelSuccess value)? success,
    TResult? Function(_LeaguesResponseDataModelError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LeaguesResponseDataModelSuccess value)? success,
    TResult Function(_LeaguesResponseDataModelError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaguesResponseDataModelSuccessImplToJson(
      this,
    );
  }
}

abstract class _LeaguesResponseDataModelSuccess
    implements LeaguesResponseDataModel {
  const factory _LeaguesResponseDataModelSuccess(
      {required final LeagueListDataModel data,
      final ResponseStatus status}) = _$LeaguesResponseDataModelSuccessImpl;

  factory _LeaguesResponseDataModelSuccess.fromJson(Map<String, dynamic> json) =
      _$LeaguesResponseDataModelSuccessImpl.fromJson;

  LeagueListDataModel get data;
  @override
  ResponseStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$LeaguesResponseDataModelSuccessImplCopyWith<
          _$LeaguesResponseDataModelSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LeaguesResponseDataModelErrorImplCopyWith<$Res>
    implements $LeaguesResponseDataModelCopyWith<$Res> {
  factory _$$LeaguesResponseDataModelErrorImplCopyWith(
          _$LeaguesResponseDataModelErrorImpl value,
          $Res Function(_$LeaguesResponseDataModelErrorImpl) then) =
      __$$LeaguesResponseDataModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ErrorResponseModel error, ResponseStatus status});

  $ErrorResponseModelCopyWith<$Res> get error;
}

/// @nodoc
class __$$LeaguesResponseDataModelErrorImplCopyWithImpl<$Res>
    extends _$LeaguesResponseDataModelCopyWithImpl<$Res,
        _$LeaguesResponseDataModelErrorImpl>
    implements _$$LeaguesResponseDataModelErrorImplCopyWith<$Res> {
  __$$LeaguesResponseDataModelErrorImplCopyWithImpl(
      _$LeaguesResponseDataModelErrorImpl _value,
      $Res Function(_$LeaguesResponseDataModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? status = null,
  }) {
    return _then(_$LeaguesResponseDataModelErrorImpl(
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
class _$LeaguesResponseDataModelErrorImpl
    implements _LeaguesResponseDataModelError {
  const _$LeaguesResponseDataModelErrorImpl(
      {required this.error,
      this.status = ResponseStatus.error,
      final String? $type})
      : $type = $type ?? 'error';

  factory _$LeaguesResponseDataModelErrorImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LeaguesResponseDataModelErrorImplFromJson(json);

  @override
  final ErrorResponseModel error;
  @override
  @JsonKey()
  final ResponseStatus status;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LeaguesResponseDataModel.error(error: $error, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaguesResponseDataModelErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaguesResponseDataModelErrorImplCopyWith<
          _$LeaguesResponseDataModelErrorImpl>
      get copyWith => __$$LeaguesResponseDataModelErrorImplCopyWithImpl<
          _$LeaguesResponseDataModelErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LeagueListDataModel data, ResponseStatus status)
        success,
    required TResult Function(ErrorResponseModel error, ResponseStatus status)
        error,
  }) {
    return error(this.error, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LeagueListDataModel data, ResponseStatus status)? success,
    TResult? Function(ErrorResponseModel error, ResponseStatus status)? error,
  }) {
    return error?.call(this.error, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LeagueListDataModel data, ResponseStatus status)? success,
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
    required TResult Function(_LeaguesResponseDataModelSuccess value) success,
    required TResult Function(_LeaguesResponseDataModelError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LeaguesResponseDataModelSuccess value)? success,
    TResult? Function(_LeaguesResponseDataModelError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LeaguesResponseDataModelSuccess value)? success,
    TResult Function(_LeaguesResponseDataModelError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaguesResponseDataModelErrorImplToJson(
      this,
    );
  }
}

abstract class _LeaguesResponseDataModelError
    implements LeaguesResponseDataModel {
  const factory _LeaguesResponseDataModelError(
      {required final ErrorResponseModel error,
      final ResponseStatus status}) = _$LeaguesResponseDataModelErrorImpl;

  factory _LeaguesResponseDataModelError.fromJson(Map<String, dynamic> json) =
      _$LeaguesResponseDataModelErrorImpl.fromJson;

  ErrorResponseModel get error;
  @override
  ResponseStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$LeaguesResponseDataModelErrorImplCopyWith<
          _$LeaguesResponseDataModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeagueListDataModel _$LeagueListDataModelFromJson(Map<String, dynamic> json) {
  return _LeagueListDataModel.fromJson(json);
}

/// @nodoc
mixin _$LeagueListDataModel {
  List<LeagueModel>? get leagues => throw _privateConstructorUsedError;
  LeagueModel? get league => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeagueListDataModelCopyWith<LeagueListDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueListDataModelCopyWith<$Res> {
  factory $LeagueListDataModelCopyWith(
          LeagueListDataModel value, $Res Function(LeagueListDataModel) then) =
      _$LeagueListDataModelCopyWithImpl<$Res, LeagueListDataModel>;
  @useResult
  $Res call({List<LeagueModel>? leagues, LeagueModel? league});

  $LeagueModelCopyWith<$Res>? get league;
}

/// @nodoc
class _$LeagueListDataModelCopyWithImpl<$Res, $Val extends LeagueListDataModel>
    implements $LeagueListDataModelCopyWith<$Res> {
  _$LeagueListDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leagues = freezed,
    Object? league = freezed,
  }) {
    return _then(_value.copyWith(
      leagues: freezed == leagues
          ? _value.leagues
          : leagues // ignore: cast_nullable_to_non_nullable
              as List<LeagueModel>?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as LeagueModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeagueModelCopyWith<$Res>? get league {
    if (_value.league == null) {
      return null;
    }

    return $LeagueModelCopyWith<$Res>(_value.league!, (value) {
      return _then(_value.copyWith(league: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeagueListDataModelImplCopyWith<$Res>
    implements $LeagueListDataModelCopyWith<$Res> {
  factory _$$LeagueListDataModelImplCopyWith(_$LeagueListDataModelImpl value,
          $Res Function(_$LeagueListDataModelImpl) then) =
      __$$LeagueListDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LeagueModel>? leagues, LeagueModel? league});

  @override
  $LeagueModelCopyWith<$Res>? get league;
}

/// @nodoc
class __$$LeagueListDataModelImplCopyWithImpl<$Res>
    extends _$LeagueListDataModelCopyWithImpl<$Res, _$LeagueListDataModelImpl>
    implements _$$LeagueListDataModelImplCopyWith<$Res> {
  __$$LeagueListDataModelImplCopyWithImpl(_$LeagueListDataModelImpl _value,
      $Res Function(_$LeagueListDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leagues = freezed,
    Object? league = freezed,
  }) {
    return _then(_$LeagueListDataModelImpl(
      leagues: freezed == leagues
          ? _value._leagues
          : leagues // ignore: cast_nullable_to_non_nullable
              as List<LeagueModel>?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as LeagueModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeagueListDataModelImpl implements _LeagueListDataModel {
  const _$LeagueListDataModelImpl(
      {final List<LeagueModel>? leagues, this.league})
      : _leagues = leagues;

  factory _$LeagueListDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeagueListDataModelImplFromJson(json);

  final List<LeagueModel>? _leagues;
  @override
  List<LeagueModel>? get leagues {
    final value = _leagues;
    if (value == null) return null;
    if (_leagues is EqualUnmodifiableListView) return _leagues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final LeagueModel? league;

  @override
  String toString() {
    return 'LeagueListDataModel(leagues: $leagues, league: $league)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeagueListDataModelImpl &&
            const DeepCollectionEquality().equals(other._leagues, _leagues) &&
            (identical(other.league, league) || other.league == league));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_leagues), league);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeagueListDataModelImplCopyWith<_$LeagueListDataModelImpl> get copyWith =>
      __$$LeagueListDataModelImplCopyWithImpl<_$LeagueListDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeagueListDataModelImplToJson(
      this,
    );
  }
}

abstract class _LeagueListDataModel implements LeagueListDataModel {
  const factory _LeagueListDataModel(
      {final List<LeagueModel>? leagues,
      final LeagueModel? league}) = _$LeagueListDataModelImpl;

  factory _LeagueListDataModel.fromJson(Map<String, dynamic> json) =
      _$LeagueListDataModelImpl.fromJson;

  @override
  List<LeagueModel>? get leagues;
  @override
  LeagueModel? get league;
  @override
  @JsonKey(ignore: true)
  _$$LeagueListDataModelImplCopyWith<_$LeagueListDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeagueModel _$LeagueModelFromJson(Map<String, dynamic> json) {
  return _LeagueModel.fromJson(json);
}

/// @nodoc
mixin _$LeagueModel {
  SportLeague get name => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get offSeasonMessage => throw _privateConstructorUsedError;
  bool get isBeta => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  bool get isOffSeason => throw _privateConstructorUsedError;
  int? get expectedPeriods => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeagueModelCopyWith<LeagueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueModelCopyWith<$Res> {
  factory $LeagueModelCopyWith(
          LeagueModel value, $Res Function(LeagueModel) then) =
      _$LeagueModelCopyWithImpl<$Res, LeagueModel>;
  @useResult
  $Res call(
      {SportLeague name,
      String title,
      String offSeasonMessage,
      bool isBeta,
      String? icon,
      bool isDefault,
      bool isEnabled,
      bool isOffSeason,
      int? expectedPeriods});
}

/// @nodoc
class _$LeagueModelCopyWithImpl<$Res, $Val extends LeagueModel>
    implements $LeagueModelCopyWith<$Res> {
  _$LeagueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? title = null,
    Object? offSeasonMessage = null,
    Object? isBeta = null,
    Object? icon = freezed,
    Object? isDefault = null,
    Object? isEnabled = null,
    Object? isOffSeason = null,
    Object? expectedPeriods = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      offSeasonMessage: null == offSeasonMessage
          ? _value.offSeasonMessage
          : offSeasonMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isBeta: null == isBeta
          ? _value.isBeta
          : isBeta // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffSeason: null == isOffSeason
          ? _value.isOffSeason
          : isOffSeason // ignore: cast_nullable_to_non_nullable
              as bool,
      expectedPeriods: freezed == expectedPeriods
          ? _value.expectedPeriods
          : expectedPeriods // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeagueModelImplCopyWith<$Res>
    implements $LeagueModelCopyWith<$Res> {
  factory _$$LeagueModelImplCopyWith(
          _$LeagueModelImpl value, $Res Function(_$LeagueModelImpl) then) =
      __$$LeagueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SportLeague name,
      String title,
      String offSeasonMessage,
      bool isBeta,
      String? icon,
      bool isDefault,
      bool isEnabled,
      bool isOffSeason,
      int? expectedPeriods});
}

/// @nodoc
class __$$LeagueModelImplCopyWithImpl<$Res>
    extends _$LeagueModelCopyWithImpl<$Res, _$LeagueModelImpl>
    implements _$$LeagueModelImplCopyWith<$Res> {
  __$$LeagueModelImplCopyWithImpl(
      _$LeagueModelImpl _value, $Res Function(_$LeagueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? title = null,
    Object? offSeasonMessage = null,
    Object? isBeta = null,
    Object? icon = freezed,
    Object? isDefault = null,
    Object? isEnabled = null,
    Object? isOffSeason = null,
    Object? expectedPeriods = freezed,
  }) {
    return _then(_$LeagueModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      offSeasonMessage: null == offSeasonMessage
          ? _value.offSeasonMessage
          : offSeasonMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isBeta: null == isBeta
          ? _value.isBeta
          : isBeta // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffSeason: null == isOffSeason
          ? _value.isOffSeason
          : isOffSeason // ignore: cast_nullable_to_non_nullable
              as bool,
      expectedPeriods: freezed == expectedPeriods
          ? _value.expectedPeriods
          : expectedPeriods // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeagueModelImpl implements _LeagueModel {
  const _$LeagueModelImpl(
      {required this.name,
      this.title = '',
      this.offSeasonMessage = '',
      this.isBeta = false,
      this.icon,
      this.isDefault = false,
      this.isEnabled = true,
      this.isOffSeason = false,
      this.expectedPeriods});

  factory _$LeagueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeagueModelImplFromJson(json);

  @override
  final SportLeague name;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String offSeasonMessage;
  @override
  @JsonKey()
  final bool isBeta;
  @override
  final String? icon;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @JsonKey()
  final bool isEnabled;
  @override
  @JsonKey()
  final bool isOffSeason;
  @override
  final int? expectedPeriods;

  @override
  String toString() {
    return 'LeagueModel(name: $name, title: $title, offSeasonMessage: $offSeasonMessage, isBeta: $isBeta, icon: $icon, isDefault: $isDefault, isEnabled: $isEnabled, isOffSeason: $isOffSeason, expectedPeriods: $expectedPeriods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeagueModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.offSeasonMessage, offSeasonMessage) ||
                other.offSeasonMessage == offSeasonMessage) &&
            (identical(other.isBeta, isBeta) || other.isBeta == isBeta) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.isOffSeason, isOffSeason) ||
                other.isOffSeason == isOffSeason) &&
            (identical(other.expectedPeriods, expectedPeriods) ||
                other.expectedPeriods == expectedPeriods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, title, offSeasonMessage,
      isBeta, icon, isDefault, isEnabled, isOffSeason, expectedPeriods);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeagueModelImplCopyWith<_$LeagueModelImpl> get copyWith =>
      __$$LeagueModelImplCopyWithImpl<_$LeagueModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeagueModelImplToJson(
      this,
    );
  }
}

abstract class _LeagueModel implements LeagueModel {
  const factory _LeagueModel(
      {required final SportLeague name,
      final String title,
      final String offSeasonMessage,
      final bool isBeta,
      final String? icon,
      final bool isDefault,
      final bool isEnabled,
      final bool isOffSeason,
      final int? expectedPeriods}) = _$LeagueModelImpl;

  factory _LeagueModel.fromJson(Map<String, dynamic> json) =
      _$LeagueModelImpl.fromJson;

  @override
  SportLeague get name;
  @override
  String get title;
  @override
  String get offSeasonMessage;
  @override
  bool get isBeta;
  @override
  String? get icon;
  @override
  bool get isDefault;
  @override
  bool get isEnabled;
  @override
  bool get isOffSeason;
  @override
  int? get expectedPeriods;
  @override
  @JsonKey(ignore: true)
  _$$LeagueModelImplCopyWith<_$LeagueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
