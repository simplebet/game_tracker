// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_update_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatsUpdateResponseModel _$StatsUpdateResponseModelFromJson(
    Map<String, dynamic> json) {
  return _StatsUpdateResponseModel.fromJson(json);
}

/// @nodoc
mixin _$StatsUpdateResponseModel {
  SportLeague get league => throw _privateConstructorUsedError;
  StatsUpdateModel? get match => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsUpdateResponseModelCopyWith<StatsUpdateResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsUpdateResponseModelCopyWith<$Res> {
  factory $StatsUpdateResponseModelCopyWith(StatsUpdateResponseModel value,
          $Res Function(StatsUpdateResponseModel) then) =
      _$StatsUpdateResponseModelCopyWithImpl<$Res, StatsUpdateResponseModel>;
  @useResult
  $Res call({SportLeague league, StatsUpdateModel? match});

  $StatsUpdateModelCopyWith<$Res>? get match;
}

/// @nodoc
class _$StatsUpdateResponseModelCopyWithImpl<$Res,
        $Val extends StatsUpdateResponseModel>
    implements $StatsUpdateResponseModelCopyWith<$Res> {
  _$StatsUpdateResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? match = freezed,
  }) {
    return _then(_value.copyWith(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      match: freezed == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as StatsUpdateModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatsUpdateModelCopyWith<$Res>? get match {
    if (_value.match == null) {
      return null;
    }

    return $StatsUpdateModelCopyWith<$Res>(_value.match!, (value) {
      return _then(_value.copyWith(match: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatsUpdateResponseModelImplCopyWith<$Res>
    implements $StatsUpdateResponseModelCopyWith<$Res> {
  factory _$$StatsUpdateResponseModelImplCopyWith(
          _$StatsUpdateResponseModelImpl value,
          $Res Function(_$StatsUpdateResponseModelImpl) then) =
      __$$StatsUpdateResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SportLeague league, StatsUpdateModel? match});

  @override
  $StatsUpdateModelCopyWith<$Res>? get match;
}

/// @nodoc
class __$$StatsUpdateResponseModelImplCopyWithImpl<$Res>
    extends _$StatsUpdateResponseModelCopyWithImpl<$Res,
        _$StatsUpdateResponseModelImpl>
    implements _$$StatsUpdateResponseModelImplCopyWith<$Res> {
  __$$StatsUpdateResponseModelImplCopyWithImpl(
      _$StatsUpdateResponseModelImpl _value,
      $Res Function(_$StatsUpdateResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? match = freezed,
  }) {
    return _then(_$StatsUpdateResponseModelImpl(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      match: freezed == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as StatsUpdateModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsUpdateResponseModelImpl implements _StatsUpdateResponseModel {
  const _$StatsUpdateResponseModelImpl({required this.league, this.match});

  factory _$StatsUpdateResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsUpdateResponseModelImplFromJson(json);

  @override
  final SportLeague league;
  @override
  final StatsUpdateModel? match;

  @override
  String toString() {
    return 'StatsUpdateResponseModel(league: $league, match: $match)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsUpdateResponseModelImpl &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.match, match) || other.match == match));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, league, match);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsUpdateResponseModelImplCopyWith<_$StatsUpdateResponseModelImpl>
      get copyWith => __$$StatsUpdateResponseModelImplCopyWithImpl<
          _$StatsUpdateResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsUpdateResponseModelImplToJson(
      this,
    );
  }
}

abstract class _StatsUpdateResponseModel implements StatsUpdateResponseModel {
  const factory _StatsUpdateResponseModel(
      {required final SportLeague league,
      final StatsUpdateModel? match}) = _$StatsUpdateResponseModelImpl;

  factory _StatsUpdateResponseModel.fromJson(Map<String, dynamic> json) =
      _$StatsUpdateResponseModelImpl.fromJson;

  @override
  SportLeague get league;
  @override
  StatsUpdateModel? get match;
  @override
  @JsonKey(ignore: true)
  _$$StatsUpdateResponseModelImplCopyWith<_$StatsUpdateResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StatsUpdateModel _$StatsUpdateModelFromJson(Map<String, dynamic> json) {
  return _StatsUpdateModel.fromJson(json);
}

/// @nodoc
mixin _$StatsUpdateModel {
  TeamModel? get awayTeam => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  TeamModel? get homeTeam => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  SportLeague? get league => throw _privateConstructorUsedError;
  List<dynamic>? get players => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  StatsUpdateMatchModel? get match => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsUpdateModelCopyWith<StatsUpdateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsUpdateModelCopyWith<$Res> {
  factory $StatsUpdateModelCopyWith(
          StatsUpdateModel value, $Res Function(StatsUpdateModel) then) =
      _$StatsUpdateModelCopyWithImpl<$Res, StatsUpdateModel>;
  @useResult
  $Res call(
      {TeamModel? awayTeam,
      String? eventId,
      TeamModel? homeTeam,
      String? id,
      SportLeague? league,
      List<dynamic>? players,
      DateTime? startTime,
      StatsUpdateMatchModel? match});

  $TeamModelCopyWith<$Res>? get awayTeam;
  $TeamModelCopyWith<$Res>? get homeTeam;
  $StatsUpdateMatchModelCopyWith<$Res>? get match;
}

/// @nodoc
class _$StatsUpdateModelCopyWithImpl<$Res, $Val extends StatsUpdateModel>
    implements $StatsUpdateModelCopyWith<$Res> {
  _$StatsUpdateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awayTeam = freezed,
    Object? eventId = freezed,
    Object? homeTeam = freezed,
    Object? id = freezed,
    Object? league = freezed,
    Object? players = freezed,
    Object? startTime = freezed,
    Object? match = freezed,
  }) {
    return _then(_value.copyWith(
      awayTeam: freezed == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      homeTeam: freezed == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague?,
      players: freezed == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      match: freezed == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as StatsUpdateMatchModel?,
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
  $StatsUpdateMatchModelCopyWith<$Res>? get match {
    if (_value.match == null) {
      return null;
    }

    return $StatsUpdateMatchModelCopyWith<$Res>(_value.match!, (value) {
      return _then(_value.copyWith(match: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatsUpdateModelImplCopyWith<$Res>
    implements $StatsUpdateModelCopyWith<$Res> {
  factory _$$StatsUpdateModelImplCopyWith(_$StatsUpdateModelImpl value,
          $Res Function(_$StatsUpdateModelImpl) then) =
      __$$StatsUpdateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TeamModel? awayTeam,
      String? eventId,
      TeamModel? homeTeam,
      String? id,
      SportLeague? league,
      List<dynamic>? players,
      DateTime? startTime,
      StatsUpdateMatchModel? match});

  @override
  $TeamModelCopyWith<$Res>? get awayTeam;
  @override
  $TeamModelCopyWith<$Res>? get homeTeam;
  @override
  $StatsUpdateMatchModelCopyWith<$Res>? get match;
}

/// @nodoc
class __$$StatsUpdateModelImplCopyWithImpl<$Res>
    extends _$StatsUpdateModelCopyWithImpl<$Res, _$StatsUpdateModelImpl>
    implements _$$StatsUpdateModelImplCopyWith<$Res> {
  __$$StatsUpdateModelImplCopyWithImpl(_$StatsUpdateModelImpl _value,
      $Res Function(_$StatsUpdateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awayTeam = freezed,
    Object? eventId = freezed,
    Object? homeTeam = freezed,
    Object? id = freezed,
    Object? league = freezed,
    Object? players = freezed,
    Object? startTime = freezed,
    Object? match = freezed,
  }) {
    return _then(_$StatsUpdateModelImpl(
      awayTeam: freezed == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      homeTeam: freezed == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague?,
      players: freezed == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      match: freezed == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as StatsUpdateMatchModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsUpdateModelImpl implements _StatsUpdateModel {
  const _$StatsUpdateModelImpl(
      {required this.awayTeam,
      required this.eventId,
      required this.homeTeam,
      required this.id,
      required this.league,
      required final List<dynamic>? players,
      required this.startTime,
      required this.match})
      : _players = players;

  factory _$StatsUpdateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsUpdateModelImplFromJson(json);

  @override
  final TeamModel? awayTeam;
  @override
  final String? eventId;
  @override
  final TeamModel? homeTeam;
  @override
  final String? id;
  @override
  final SportLeague? league;
  final List<dynamic>? _players;
  @override
  List<dynamic>? get players {
    final value = _players;
    if (value == null) return null;
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? startTime;
  @override
  final StatsUpdateMatchModel? match;

  @override
  String toString() {
    return 'StatsUpdateModel(awayTeam: $awayTeam, eventId: $eventId, homeTeam: $homeTeam, id: $id, league: $league, players: $players, startTime: $startTime, match: $match)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsUpdateModelImpl &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.league, league) || other.league == league) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.match, match) || other.match == match));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, awayTeam, eventId, homeTeam, id,
      league, const DeepCollectionEquality().hash(_players), startTime, match);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsUpdateModelImplCopyWith<_$StatsUpdateModelImpl> get copyWith =>
      __$$StatsUpdateModelImplCopyWithImpl<_$StatsUpdateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsUpdateModelImplToJson(
      this,
    );
  }
}

abstract class _StatsUpdateModel implements StatsUpdateModel {
  const factory _StatsUpdateModel(
      {required final TeamModel? awayTeam,
      required final String? eventId,
      required final TeamModel? homeTeam,
      required final String? id,
      required final SportLeague? league,
      required final List<dynamic>? players,
      required final DateTime? startTime,
      required final StatsUpdateMatchModel? match}) = _$StatsUpdateModelImpl;

  factory _StatsUpdateModel.fromJson(Map<String, dynamic> json) =
      _$StatsUpdateModelImpl.fromJson;

  @override
  TeamModel? get awayTeam;
  @override
  String? get eventId;
  @override
  TeamModel? get homeTeam;
  @override
  String? get id;
  @override
  SportLeague? get league;
  @override
  List<dynamic>? get players;
  @override
  DateTime? get startTime;
  @override
  StatsUpdateMatchModel? get match;
  @override
  @JsonKey(ignore: true)
  _$$StatsUpdateModelImplCopyWith<_$StatsUpdateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatsUpdateMatchModel _$StatsUpdateMatchModelFromJson(
    Map<String, dynamic> json) {
  return _StatsUpdateMatchModel.fromJson(json);
}

/// @nodoc
mixin _$StatsUpdateMatchModel {
  int get awayTwoPointMakes => throw _privateConstructorUsedError;
  int get homeTwoPointMakes => throw _privateConstructorUsedError;
  int get awaySteals => throw _privateConstructorUsedError;
  int get homeSteals => throw _privateConstructorUsedError;
  int get awayOffensiveRebounds => throw _privateConstructorUsedError;
  int get homeOffensiveRebounds => throw _privateConstructorUsedError;
  int get awayFieldGoalMakes => throw _privateConstructorUsedError;
  int get homeFieldGoalMakes => throw _privateConstructorUsedError;
  int get awayFieldGoalAttempts => throw _privateConstructorUsedError;
  int get homeFieldGoalAttempts => throw _privateConstructorUsedError;
  int get awayTwoPointAttempts => throw _privateConstructorUsedError;
  int get homeTwoPointAttempts => throw _privateConstructorUsedError;
  int get awayThreePointMakes => throw _privateConstructorUsedError;
  int get homeThreePointMakes => throw _privateConstructorUsedError;
  int get awayScore => throw _privateConstructorUsedError;
  int get homeScore => throw _privateConstructorUsedError;
  double get awayFieldGoalPercentage => throw _privateConstructorUsedError;
  double get homeFieldGoalPercentage => throw _privateConstructorUsedError;
  int get awayFouls => throw _privateConstructorUsedError;
  int get homeFouls => throw _privateConstructorUsedError;
  int get awayTurnovers => throw _privateConstructorUsedError;
  int get homeTurnovers => throw _privateConstructorUsedError;
  int get awayFreeThrowAttempts => throw _privateConstructorUsedError;
  int get homeFreeThrowAttempts => throw _privateConstructorUsedError;
  double get awayTwoPointPercentage => throw _privateConstructorUsedError;
  double get homeTwoPointPercentage => throw _privateConstructorUsedError;
  int get awayAssists => throw _privateConstructorUsedError;
  int get homeAssists => throw _privateConstructorUsedError;
  int get awayBlocks => throw _privateConstructorUsedError;
  int get homeBlocks => throw _privateConstructorUsedError;
  int get awayFreeThrowMakes => throw _privateConstructorUsedError;
  int get homeFreeThrowMakes => throw _privateConstructorUsedError;
  int get awayDefensiveRebounds => throw _privateConstructorUsedError;
  int get homeDefensiveRebounds => throw _privateConstructorUsedError;
  double get awayFreeThrowPercentage => throw _privateConstructorUsedError;
  double get homeFreeThrowPercentage => throw _privateConstructorUsedError;
  double get awayThreePointPercentage => throw _privateConstructorUsedError;
  double get homeThreePointPercentage => throw _privateConstructorUsedError;
  int get awayThreePointAttempts => throw _privateConstructorUsedError;
  int get homeThreePointAttempts => throw _privateConstructorUsedError;
  int get currentPeriod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  Map<String, PeriodScoreModel> get periodScores =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsUpdateMatchModelCopyWith<StatsUpdateMatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsUpdateMatchModelCopyWith<$Res> {
  factory $StatsUpdateMatchModelCopyWith(StatsUpdateMatchModel value,
          $Res Function(StatsUpdateMatchModel) then) =
      _$StatsUpdateMatchModelCopyWithImpl<$Res, StatsUpdateMatchModel>;
  @useResult
  $Res call(
      {int awayTwoPointMakes,
      int homeTwoPointMakes,
      int awaySteals,
      int homeSteals,
      int awayOffensiveRebounds,
      int homeOffensiveRebounds,
      int awayFieldGoalMakes,
      int homeFieldGoalMakes,
      int awayFieldGoalAttempts,
      int homeFieldGoalAttempts,
      int awayTwoPointAttempts,
      int homeTwoPointAttempts,
      int awayThreePointMakes,
      int homeThreePointMakes,
      int awayScore,
      int homeScore,
      double awayFieldGoalPercentage,
      double homeFieldGoalPercentage,
      int awayFouls,
      int homeFouls,
      int awayTurnovers,
      int homeTurnovers,
      int awayFreeThrowAttempts,
      int homeFreeThrowAttempts,
      double awayTwoPointPercentage,
      double homeTwoPointPercentage,
      int awayAssists,
      int homeAssists,
      int awayBlocks,
      int homeBlocks,
      int awayFreeThrowMakes,
      int homeFreeThrowMakes,
      int awayDefensiveRebounds,
      int homeDefensiveRebounds,
      double awayFreeThrowPercentage,
      double homeFreeThrowPercentage,
      double awayThreePointPercentage,
      double homeThreePointPercentage,
      int awayThreePointAttempts,
      int homeThreePointAttempts,
      int currentPeriod,
      String status,
      Map<String, PeriodScoreModel> periodScores});
}

/// @nodoc
class _$StatsUpdateMatchModelCopyWithImpl<$Res,
        $Val extends StatsUpdateMatchModel>
    implements $StatsUpdateMatchModelCopyWith<$Res> {
  _$StatsUpdateMatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awayTwoPointMakes = null,
    Object? homeTwoPointMakes = null,
    Object? awaySteals = null,
    Object? homeSteals = null,
    Object? awayOffensiveRebounds = null,
    Object? homeOffensiveRebounds = null,
    Object? awayFieldGoalMakes = null,
    Object? homeFieldGoalMakes = null,
    Object? awayFieldGoalAttempts = null,
    Object? homeFieldGoalAttempts = null,
    Object? awayTwoPointAttempts = null,
    Object? homeTwoPointAttempts = null,
    Object? awayThreePointMakes = null,
    Object? homeThreePointMakes = null,
    Object? awayScore = null,
    Object? homeScore = null,
    Object? awayFieldGoalPercentage = null,
    Object? homeFieldGoalPercentage = null,
    Object? awayFouls = null,
    Object? homeFouls = null,
    Object? awayTurnovers = null,
    Object? homeTurnovers = null,
    Object? awayFreeThrowAttempts = null,
    Object? homeFreeThrowAttempts = null,
    Object? awayTwoPointPercentage = null,
    Object? homeTwoPointPercentage = null,
    Object? awayAssists = null,
    Object? homeAssists = null,
    Object? awayBlocks = null,
    Object? homeBlocks = null,
    Object? awayFreeThrowMakes = null,
    Object? homeFreeThrowMakes = null,
    Object? awayDefensiveRebounds = null,
    Object? homeDefensiveRebounds = null,
    Object? awayFreeThrowPercentage = null,
    Object? homeFreeThrowPercentage = null,
    Object? awayThreePointPercentage = null,
    Object? homeThreePointPercentage = null,
    Object? awayThreePointAttempts = null,
    Object? homeThreePointAttempts = null,
    Object? currentPeriod = null,
    Object? status = null,
    Object? periodScores = null,
  }) {
    return _then(_value.copyWith(
      awayTwoPointMakes: null == awayTwoPointMakes
          ? _value.awayTwoPointMakes
          : awayTwoPointMakes // ignore: cast_nullable_to_non_nullable
              as int,
      homeTwoPointMakes: null == homeTwoPointMakes
          ? _value.homeTwoPointMakes
          : homeTwoPointMakes // ignore: cast_nullable_to_non_nullable
              as int,
      awaySteals: null == awaySteals
          ? _value.awaySteals
          : awaySteals // ignore: cast_nullable_to_non_nullable
              as int,
      homeSteals: null == homeSteals
          ? _value.homeSteals
          : homeSteals // ignore: cast_nullable_to_non_nullable
              as int,
      awayOffensiveRebounds: null == awayOffensiveRebounds
          ? _value.awayOffensiveRebounds
          : awayOffensiveRebounds // ignore: cast_nullable_to_non_nullable
              as int,
      homeOffensiveRebounds: null == homeOffensiveRebounds
          ? _value.homeOffensiveRebounds
          : homeOffensiveRebounds // ignore: cast_nullable_to_non_nullable
              as int,
      awayFieldGoalMakes: null == awayFieldGoalMakes
          ? _value.awayFieldGoalMakes
          : awayFieldGoalMakes // ignore: cast_nullable_to_non_nullable
              as int,
      homeFieldGoalMakes: null == homeFieldGoalMakes
          ? _value.homeFieldGoalMakes
          : homeFieldGoalMakes // ignore: cast_nullable_to_non_nullable
              as int,
      awayFieldGoalAttempts: null == awayFieldGoalAttempts
          ? _value.awayFieldGoalAttempts
          : awayFieldGoalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      homeFieldGoalAttempts: null == homeFieldGoalAttempts
          ? _value.homeFieldGoalAttempts
          : homeFieldGoalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      awayTwoPointAttempts: null == awayTwoPointAttempts
          ? _value.awayTwoPointAttempts
          : awayTwoPointAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      homeTwoPointAttempts: null == homeTwoPointAttempts
          ? _value.homeTwoPointAttempts
          : homeTwoPointAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      awayThreePointMakes: null == awayThreePointMakes
          ? _value.awayThreePointMakes
          : awayThreePointMakes // ignore: cast_nullable_to_non_nullable
              as int,
      homeThreePointMakes: null == homeThreePointMakes
          ? _value.homeThreePointMakes
          : homeThreePointMakes // ignore: cast_nullable_to_non_nullable
              as int,
      awayScore: null == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int,
      homeScore: null == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int,
      awayFieldGoalPercentage: null == awayFieldGoalPercentage
          ? _value.awayFieldGoalPercentage
          : awayFieldGoalPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      homeFieldGoalPercentage: null == homeFieldGoalPercentage
          ? _value.homeFieldGoalPercentage
          : homeFieldGoalPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      awayFouls: null == awayFouls
          ? _value.awayFouls
          : awayFouls // ignore: cast_nullable_to_non_nullable
              as int,
      homeFouls: null == homeFouls
          ? _value.homeFouls
          : homeFouls // ignore: cast_nullable_to_non_nullable
              as int,
      awayTurnovers: null == awayTurnovers
          ? _value.awayTurnovers
          : awayTurnovers // ignore: cast_nullable_to_non_nullable
              as int,
      homeTurnovers: null == homeTurnovers
          ? _value.homeTurnovers
          : homeTurnovers // ignore: cast_nullable_to_non_nullable
              as int,
      awayFreeThrowAttempts: null == awayFreeThrowAttempts
          ? _value.awayFreeThrowAttempts
          : awayFreeThrowAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      homeFreeThrowAttempts: null == homeFreeThrowAttempts
          ? _value.homeFreeThrowAttempts
          : homeFreeThrowAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      awayTwoPointPercentage: null == awayTwoPointPercentage
          ? _value.awayTwoPointPercentage
          : awayTwoPointPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      homeTwoPointPercentage: null == homeTwoPointPercentage
          ? _value.homeTwoPointPercentage
          : homeTwoPointPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      awayAssists: null == awayAssists
          ? _value.awayAssists
          : awayAssists // ignore: cast_nullable_to_non_nullable
              as int,
      homeAssists: null == homeAssists
          ? _value.homeAssists
          : homeAssists // ignore: cast_nullable_to_non_nullable
              as int,
      awayBlocks: null == awayBlocks
          ? _value.awayBlocks
          : awayBlocks // ignore: cast_nullable_to_non_nullable
              as int,
      homeBlocks: null == homeBlocks
          ? _value.homeBlocks
          : homeBlocks // ignore: cast_nullable_to_non_nullable
              as int,
      awayFreeThrowMakes: null == awayFreeThrowMakes
          ? _value.awayFreeThrowMakes
          : awayFreeThrowMakes // ignore: cast_nullable_to_non_nullable
              as int,
      homeFreeThrowMakes: null == homeFreeThrowMakes
          ? _value.homeFreeThrowMakes
          : homeFreeThrowMakes // ignore: cast_nullable_to_non_nullable
              as int,
      awayDefensiveRebounds: null == awayDefensiveRebounds
          ? _value.awayDefensiveRebounds
          : awayDefensiveRebounds // ignore: cast_nullable_to_non_nullable
              as int,
      homeDefensiveRebounds: null == homeDefensiveRebounds
          ? _value.homeDefensiveRebounds
          : homeDefensiveRebounds // ignore: cast_nullable_to_non_nullable
              as int,
      awayFreeThrowPercentage: null == awayFreeThrowPercentage
          ? _value.awayFreeThrowPercentage
          : awayFreeThrowPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      homeFreeThrowPercentage: null == homeFreeThrowPercentage
          ? _value.homeFreeThrowPercentage
          : homeFreeThrowPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      awayThreePointPercentage: null == awayThreePointPercentage
          ? _value.awayThreePointPercentage
          : awayThreePointPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      homeThreePointPercentage: null == homeThreePointPercentage
          ? _value.homeThreePointPercentage
          : homeThreePointPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      awayThreePointAttempts: null == awayThreePointAttempts
          ? _value.awayThreePointAttempts
          : awayThreePointAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      homeThreePointAttempts: null == homeThreePointAttempts
          ? _value.homeThreePointAttempts
          : homeThreePointAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      currentPeriod: null == currentPeriod
          ? _value.currentPeriod
          : currentPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      periodScores: null == periodScores
          ? _value.periodScores
          : periodScores // ignore: cast_nullable_to_non_nullable
              as Map<String, PeriodScoreModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsUpdateMatchModelImplCopyWith<$Res>
    implements $StatsUpdateMatchModelCopyWith<$Res> {
  factory _$$StatsUpdateMatchModelImplCopyWith(
          _$StatsUpdateMatchModelImpl value,
          $Res Function(_$StatsUpdateMatchModelImpl) then) =
      __$$StatsUpdateMatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int awayTwoPointMakes,
      int homeTwoPointMakes,
      int awaySteals,
      int homeSteals,
      int awayOffensiveRebounds,
      int homeOffensiveRebounds,
      int awayFieldGoalMakes,
      int homeFieldGoalMakes,
      int awayFieldGoalAttempts,
      int homeFieldGoalAttempts,
      int awayTwoPointAttempts,
      int homeTwoPointAttempts,
      int awayThreePointMakes,
      int homeThreePointMakes,
      int awayScore,
      int homeScore,
      double awayFieldGoalPercentage,
      double homeFieldGoalPercentage,
      int awayFouls,
      int homeFouls,
      int awayTurnovers,
      int homeTurnovers,
      int awayFreeThrowAttempts,
      int homeFreeThrowAttempts,
      double awayTwoPointPercentage,
      double homeTwoPointPercentage,
      int awayAssists,
      int homeAssists,
      int awayBlocks,
      int homeBlocks,
      int awayFreeThrowMakes,
      int homeFreeThrowMakes,
      int awayDefensiveRebounds,
      int homeDefensiveRebounds,
      double awayFreeThrowPercentage,
      double homeFreeThrowPercentage,
      double awayThreePointPercentage,
      double homeThreePointPercentage,
      int awayThreePointAttempts,
      int homeThreePointAttempts,
      int currentPeriod,
      String status,
      Map<String, PeriodScoreModel> periodScores});
}

/// @nodoc
class __$$StatsUpdateMatchModelImplCopyWithImpl<$Res>
    extends _$StatsUpdateMatchModelCopyWithImpl<$Res,
        _$StatsUpdateMatchModelImpl>
    implements _$$StatsUpdateMatchModelImplCopyWith<$Res> {
  __$$StatsUpdateMatchModelImplCopyWithImpl(_$StatsUpdateMatchModelImpl _value,
      $Res Function(_$StatsUpdateMatchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awayTwoPointMakes = null,
    Object? homeTwoPointMakes = null,
    Object? awaySteals = null,
    Object? homeSteals = null,
    Object? awayOffensiveRebounds = null,
    Object? homeOffensiveRebounds = null,
    Object? awayFieldGoalMakes = null,
    Object? homeFieldGoalMakes = null,
    Object? awayFieldGoalAttempts = null,
    Object? homeFieldGoalAttempts = null,
    Object? awayTwoPointAttempts = null,
    Object? homeTwoPointAttempts = null,
    Object? awayThreePointMakes = null,
    Object? homeThreePointMakes = null,
    Object? awayScore = null,
    Object? homeScore = null,
    Object? awayFieldGoalPercentage = null,
    Object? homeFieldGoalPercentage = null,
    Object? awayFouls = null,
    Object? homeFouls = null,
    Object? awayTurnovers = null,
    Object? homeTurnovers = null,
    Object? awayFreeThrowAttempts = null,
    Object? homeFreeThrowAttempts = null,
    Object? awayTwoPointPercentage = null,
    Object? homeTwoPointPercentage = null,
    Object? awayAssists = null,
    Object? homeAssists = null,
    Object? awayBlocks = null,
    Object? homeBlocks = null,
    Object? awayFreeThrowMakes = null,
    Object? homeFreeThrowMakes = null,
    Object? awayDefensiveRebounds = null,
    Object? homeDefensiveRebounds = null,
    Object? awayFreeThrowPercentage = null,
    Object? homeFreeThrowPercentage = null,
    Object? awayThreePointPercentage = null,
    Object? homeThreePointPercentage = null,
    Object? awayThreePointAttempts = null,
    Object? homeThreePointAttempts = null,
    Object? currentPeriod = null,
    Object? status = null,
    Object? periodScores = null,
  }) {
    return _then(_$StatsUpdateMatchModelImpl(
      awayTwoPointMakes: null == awayTwoPointMakes
          ? _value.awayTwoPointMakes
          : awayTwoPointMakes // ignore: cast_nullable_to_non_nullable
              as int,
      homeTwoPointMakes: null == homeTwoPointMakes
          ? _value.homeTwoPointMakes
          : homeTwoPointMakes // ignore: cast_nullable_to_non_nullable
              as int,
      awaySteals: null == awaySteals
          ? _value.awaySteals
          : awaySteals // ignore: cast_nullable_to_non_nullable
              as int,
      homeSteals: null == homeSteals
          ? _value.homeSteals
          : homeSteals // ignore: cast_nullable_to_non_nullable
              as int,
      awayOffensiveRebounds: null == awayOffensiveRebounds
          ? _value.awayOffensiveRebounds
          : awayOffensiveRebounds // ignore: cast_nullable_to_non_nullable
              as int,
      homeOffensiveRebounds: null == homeOffensiveRebounds
          ? _value.homeOffensiveRebounds
          : homeOffensiveRebounds // ignore: cast_nullable_to_non_nullable
              as int,
      awayFieldGoalMakes: null == awayFieldGoalMakes
          ? _value.awayFieldGoalMakes
          : awayFieldGoalMakes // ignore: cast_nullable_to_non_nullable
              as int,
      homeFieldGoalMakes: null == homeFieldGoalMakes
          ? _value.homeFieldGoalMakes
          : homeFieldGoalMakes // ignore: cast_nullable_to_non_nullable
              as int,
      awayFieldGoalAttempts: null == awayFieldGoalAttempts
          ? _value.awayFieldGoalAttempts
          : awayFieldGoalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      homeFieldGoalAttempts: null == homeFieldGoalAttempts
          ? _value.homeFieldGoalAttempts
          : homeFieldGoalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      awayTwoPointAttempts: null == awayTwoPointAttempts
          ? _value.awayTwoPointAttempts
          : awayTwoPointAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      homeTwoPointAttempts: null == homeTwoPointAttempts
          ? _value.homeTwoPointAttempts
          : homeTwoPointAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      awayThreePointMakes: null == awayThreePointMakes
          ? _value.awayThreePointMakes
          : awayThreePointMakes // ignore: cast_nullable_to_non_nullable
              as int,
      homeThreePointMakes: null == homeThreePointMakes
          ? _value.homeThreePointMakes
          : homeThreePointMakes // ignore: cast_nullable_to_non_nullable
              as int,
      awayScore: null == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int,
      homeScore: null == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int,
      awayFieldGoalPercentage: null == awayFieldGoalPercentage
          ? _value.awayFieldGoalPercentage
          : awayFieldGoalPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      homeFieldGoalPercentage: null == homeFieldGoalPercentage
          ? _value.homeFieldGoalPercentage
          : homeFieldGoalPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      awayFouls: null == awayFouls
          ? _value.awayFouls
          : awayFouls // ignore: cast_nullable_to_non_nullable
              as int,
      homeFouls: null == homeFouls
          ? _value.homeFouls
          : homeFouls // ignore: cast_nullable_to_non_nullable
              as int,
      awayTurnovers: null == awayTurnovers
          ? _value.awayTurnovers
          : awayTurnovers // ignore: cast_nullable_to_non_nullable
              as int,
      homeTurnovers: null == homeTurnovers
          ? _value.homeTurnovers
          : homeTurnovers // ignore: cast_nullable_to_non_nullable
              as int,
      awayFreeThrowAttempts: null == awayFreeThrowAttempts
          ? _value.awayFreeThrowAttempts
          : awayFreeThrowAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      homeFreeThrowAttempts: null == homeFreeThrowAttempts
          ? _value.homeFreeThrowAttempts
          : homeFreeThrowAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      awayTwoPointPercentage: null == awayTwoPointPercentage
          ? _value.awayTwoPointPercentage
          : awayTwoPointPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      homeTwoPointPercentage: null == homeTwoPointPercentage
          ? _value.homeTwoPointPercentage
          : homeTwoPointPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      awayAssists: null == awayAssists
          ? _value.awayAssists
          : awayAssists // ignore: cast_nullable_to_non_nullable
              as int,
      homeAssists: null == homeAssists
          ? _value.homeAssists
          : homeAssists // ignore: cast_nullable_to_non_nullable
              as int,
      awayBlocks: null == awayBlocks
          ? _value.awayBlocks
          : awayBlocks // ignore: cast_nullable_to_non_nullable
              as int,
      homeBlocks: null == homeBlocks
          ? _value.homeBlocks
          : homeBlocks // ignore: cast_nullable_to_non_nullable
              as int,
      awayFreeThrowMakes: null == awayFreeThrowMakes
          ? _value.awayFreeThrowMakes
          : awayFreeThrowMakes // ignore: cast_nullable_to_non_nullable
              as int,
      homeFreeThrowMakes: null == homeFreeThrowMakes
          ? _value.homeFreeThrowMakes
          : homeFreeThrowMakes // ignore: cast_nullable_to_non_nullable
              as int,
      awayDefensiveRebounds: null == awayDefensiveRebounds
          ? _value.awayDefensiveRebounds
          : awayDefensiveRebounds // ignore: cast_nullable_to_non_nullable
              as int,
      homeDefensiveRebounds: null == homeDefensiveRebounds
          ? _value.homeDefensiveRebounds
          : homeDefensiveRebounds // ignore: cast_nullable_to_non_nullable
              as int,
      awayFreeThrowPercentage: null == awayFreeThrowPercentage
          ? _value.awayFreeThrowPercentage
          : awayFreeThrowPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      homeFreeThrowPercentage: null == homeFreeThrowPercentage
          ? _value.homeFreeThrowPercentage
          : homeFreeThrowPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      awayThreePointPercentage: null == awayThreePointPercentage
          ? _value.awayThreePointPercentage
          : awayThreePointPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      homeThreePointPercentage: null == homeThreePointPercentage
          ? _value.homeThreePointPercentage
          : homeThreePointPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      awayThreePointAttempts: null == awayThreePointAttempts
          ? _value.awayThreePointAttempts
          : awayThreePointAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      homeThreePointAttempts: null == homeThreePointAttempts
          ? _value.homeThreePointAttempts
          : homeThreePointAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      currentPeriod: null == currentPeriod
          ? _value.currentPeriod
          : currentPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      periodScores: null == periodScores
          ? _value._periodScores
          : periodScores // ignore: cast_nullable_to_non_nullable
              as Map<String, PeriodScoreModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsUpdateMatchModelImpl implements _StatsUpdateMatchModel {
  const _$StatsUpdateMatchModelImpl(
      {required this.awayTwoPointMakes,
      required this.homeTwoPointMakes,
      required this.awaySteals,
      required this.homeSteals,
      required this.awayOffensiveRebounds,
      required this.homeOffensiveRebounds,
      required this.awayFieldGoalMakes,
      required this.homeFieldGoalMakes,
      required this.awayFieldGoalAttempts,
      required this.homeFieldGoalAttempts,
      required this.awayTwoPointAttempts,
      required this.homeTwoPointAttempts,
      required this.awayThreePointMakes,
      required this.homeThreePointMakes,
      required this.awayScore,
      required this.homeScore,
      required this.awayFieldGoalPercentage,
      required this.homeFieldGoalPercentage,
      required this.awayFouls,
      required this.homeFouls,
      required this.awayTurnovers,
      required this.homeTurnovers,
      required this.awayFreeThrowAttempts,
      required this.homeFreeThrowAttempts,
      required this.awayTwoPointPercentage,
      required this.homeTwoPointPercentage,
      required this.awayAssists,
      required this.homeAssists,
      required this.awayBlocks,
      required this.homeBlocks,
      required this.awayFreeThrowMakes,
      required this.homeFreeThrowMakes,
      required this.awayDefensiveRebounds,
      required this.homeDefensiveRebounds,
      required this.awayFreeThrowPercentage,
      required this.homeFreeThrowPercentage,
      required this.awayThreePointPercentage,
      required this.homeThreePointPercentage,
      required this.awayThreePointAttempts,
      required this.homeThreePointAttempts,
      required this.currentPeriod,
      required this.status,
      required final Map<String, PeriodScoreModel> periodScores})
      : _periodScores = periodScores;

  factory _$StatsUpdateMatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsUpdateMatchModelImplFromJson(json);

  @override
  final int awayTwoPointMakes;
  @override
  final int homeTwoPointMakes;
  @override
  final int awaySteals;
  @override
  final int homeSteals;
  @override
  final int awayOffensiveRebounds;
  @override
  final int homeOffensiveRebounds;
  @override
  final int awayFieldGoalMakes;
  @override
  final int homeFieldGoalMakes;
  @override
  final int awayFieldGoalAttempts;
  @override
  final int homeFieldGoalAttempts;
  @override
  final int awayTwoPointAttempts;
  @override
  final int homeTwoPointAttempts;
  @override
  final int awayThreePointMakes;
  @override
  final int homeThreePointMakes;
  @override
  final int awayScore;
  @override
  final int homeScore;
  @override
  final double awayFieldGoalPercentage;
  @override
  final double homeFieldGoalPercentage;
  @override
  final int awayFouls;
  @override
  final int homeFouls;
  @override
  final int awayTurnovers;
  @override
  final int homeTurnovers;
  @override
  final int awayFreeThrowAttempts;
  @override
  final int homeFreeThrowAttempts;
  @override
  final double awayTwoPointPercentage;
  @override
  final double homeTwoPointPercentage;
  @override
  final int awayAssists;
  @override
  final int homeAssists;
  @override
  final int awayBlocks;
  @override
  final int homeBlocks;
  @override
  final int awayFreeThrowMakes;
  @override
  final int homeFreeThrowMakes;
  @override
  final int awayDefensiveRebounds;
  @override
  final int homeDefensiveRebounds;
  @override
  final double awayFreeThrowPercentage;
  @override
  final double homeFreeThrowPercentage;
  @override
  final double awayThreePointPercentage;
  @override
  final double homeThreePointPercentage;
  @override
  final int awayThreePointAttempts;
  @override
  final int homeThreePointAttempts;
  @override
  final int currentPeriod;
  @override
  final String status;
  final Map<String, PeriodScoreModel> _periodScores;
  @override
  Map<String, PeriodScoreModel> get periodScores {
    if (_periodScores is EqualUnmodifiableMapView) return _periodScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_periodScores);
  }

  @override
  String toString() {
    return 'StatsUpdateMatchModel(awayTwoPointMakes: $awayTwoPointMakes, homeTwoPointMakes: $homeTwoPointMakes, awaySteals: $awaySteals, homeSteals: $homeSteals, awayOffensiveRebounds: $awayOffensiveRebounds, homeOffensiveRebounds: $homeOffensiveRebounds, awayFieldGoalMakes: $awayFieldGoalMakes, homeFieldGoalMakes: $homeFieldGoalMakes, awayFieldGoalAttempts: $awayFieldGoalAttempts, homeFieldGoalAttempts: $homeFieldGoalAttempts, awayTwoPointAttempts: $awayTwoPointAttempts, homeTwoPointAttempts: $homeTwoPointAttempts, awayThreePointMakes: $awayThreePointMakes, homeThreePointMakes: $homeThreePointMakes, awayScore: $awayScore, homeScore: $homeScore, awayFieldGoalPercentage: $awayFieldGoalPercentage, homeFieldGoalPercentage: $homeFieldGoalPercentage, awayFouls: $awayFouls, homeFouls: $homeFouls, awayTurnovers: $awayTurnovers, homeTurnovers: $homeTurnovers, awayFreeThrowAttempts: $awayFreeThrowAttempts, homeFreeThrowAttempts: $homeFreeThrowAttempts, awayTwoPointPercentage: $awayTwoPointPercentage, homeTwoPointPercentage: $homeTwoPointPercentage, awayAssists: $awayAssists, homeAssists: $homeAssists, awayBlocks: $awayBlocks, homeBlocks: $homeBlocks, awayFreeThrowMakes: $awayFreeThrowMakes, homeFreeThrowMakes: $homeFreeThrowMakes, awayDefensiveRebounds: $awayDefensiveRebounds, homeDefensiveRebounds: $homeDefensiveRebounds, awayFreeThrowPercentage: $awayFreeThrowPercentage, homeFreeThrowPercentage: $homeFreeThrowPercentage, awayThreePointPercentage: $awayThreePointPercentage, homeThreePointPercentage: $homeThreePointPercentage, awayThreePointAttempts: $awayThreePointAttempts, homeThreePointAttempts: $homeThreePointAttempts, currentPeriod: $currentPeriod, status: $status, periodScores: $periodScores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsUpdateMatchModelImpl &&
            (identical(other.awayTwoPointMakes, awayTwoPointMakes) ||
                other.awayTwoPointMakes == awayTwoPointMakes) &&
            (identical(other.homeTwoPointMakes, homeTwoPointMakes) ||
                other.homeTwoPointMakes == homeTwoPointMakes) &&
            (identical(other.awaySteals, awaySteals) ||
                other.awaySteals == awaySteals) &&
            (identical(other.homeSteals, homeSteals) ||
                other.homeSteals == homeSteals) &&
            (identical(other.awayOffensiveRebounds, awayOffensiveRebounds) ||
                other.awayOffensiveRebounds == awayOffensiveRebounds) &&
            (identical(other.homeOffensiveRebounds, homeOffensiveRebounds) ||
                other.homeOffensiveRebounds == homeOffensiveRebounds) &&
            (identical(other.awayFieldGoalMakes, awayFieldGoalMakes) ||
                other.awayFieldGoalMakes == awayFieldGoalMakes) &&
            (identical(other.homeFieldGoalMakes, homeFieldGoalMakes) ||
                other.homeFieldGoalMakes == homeFieldGoalMakes) &&
            (identical(other.awayFieldGoalAttempts, awayFieldGoalAttempts) ||
                other.awayFieldGoalAttempts == awayFieldGoalAttempts) &&
            (identical(other.homeFieldGoalAttempts, homeFieldGoalAttempts) ||
                other.homeFieldGoalAttempts == homeFieldGoalAttempts) &&
            (identical(other.awayTwoPointAttempts, awayTwoPointAttempts) ||
                other.awayTwoPointAttempts == awayTwoPointAttempts) &&
            (identical(other.homeTwoPointAttempts, homeTwoPointAttempts) ||
                other.homeTwoPointAttempts == homeTwoPointAttempts) &&
            (identical(other.awayThreePointMakes, awayThreePointMakes) ||
                other.awayThreePointMakes == awayThreePointMakes) &&
            (identical(other.homeThreePointMakes, homeThreePointMakes) ||
                other.homeThreePointMakes == homeThreePointMakes) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.awayFieldGoalPercentage, awayFieldGoalPercentage) ||
                other.awayFieldGoalPercentage == awayFieldGoalPercentage) &&
            (identical(other.homeFieldGoalPercentage, homeFieldGoalPercentage) ||
                other.homeFieldGoalPercentage == homeFieldGoalPercentage) &&
            (identical(other.awayFouls, awayFouls) ||
                other.awayFouls == awayFouls) &&
            (identical(other.homeFouls, homeFouls) ||
                other.homeFouls == homeFouls) &&
            (identical(other.awayTurnovers, awayTurnovers) ||
                other.awayTurnovers == awayTurnovers) &&
            (identical(other.homeTurnovers, homeTurnovers) ||
                other.homeTurnovers == homeTurnovers) &&
            (identical(other.awayFreeThrowAttempts, awayFreeThrowAttempts) ||
                other.awayFreeThrowAttempts == awayFreeThrowAttempts) &&
            (identical(other.homeFreeThrowAttempts, homeFreeThrowAttempts) ||
                other.homeFreeThrowAttempts == homeFreeThrowAttempts) &&
            (identical(other.awayTwoPointPercentage, awayTwoPointPercentage) ||
                other.awayTwoPointPercentage == awayTwoPointPercentage) &&
            (identical(other.homeTwoPointPercentage, homeTwoPointPercentage) ||
                other.homeTwoPointPercentage == homeTwoPointPercentage) &&
            (identical(other.awayAssists, awayAssists) ||
                other.awayAssists == awayAssists) &&
            (identical(other.homeAssists, homeAssists) ||
                other.homeAssists == homeAssists) &&
            (identical(other.awayBlocks, awayBlocks) ||
                other.awayBlocks == awayBlocks) &&
            (identical(other.homeBlocks, homeBlocks) ||
                other.homeBlocks == homeBlocks) &&
            (identical(other.awayFreeThrowMakes, awayFreeThrowMakes) ||
                other.awayFreeThrowMakes == awayFreeThrowMakes) &&
            (identical(other.homeFreeThrowMakes, homeFreeThrowMakes) ||
                other.homeFreeThrowMakes == homeFreeThrowMakes) &&
            (identical(other.awayDefensiveRebounds, awayDefensiveRebounds) ||
                other.awayDefensiveRebounds == awayDefensiveRebounds) &&
            (identical(other.homeDefensiveRebounds, homeDefensiveRebounds) ||
                other.homeDefensiveRebounds == homeDefensiveRebounds) &&
            (identical(other.awayFreeThrowPercentage, awayFreeThrowPercentage) ||
                other.awayFreeThrowPercentage == awayFreeThrowPercentage) &&
            (identical(other.homeFreeThrowPercentage, homeFreeThrowPercentage) ||
                other.homeFreeThrowPercentage == homeFreeThrowPercentage) &&
            (identical(other.awayThreePointPercentage, awayThreePointPercentage) || other.awayThreePointPercentage == awayThreePointPercentage) &&
            (identical(other.homeThreePointPercentage, homeThreePointPercentage) || other.homeThreePointPercentage == homeThreePointPercentage) &&
            (identical(other.awayThreePointAttempts, awayThreePointAttempts) || other.awayThreePointAttempts == awayThreePointAttempts) &&
            (identical(other.homeThreePointAttempts, homeThreePointAttempts) || other.homeThreePointAttempts == homeThreePointAttempts) &&
            (identical(other.currentPeriod, currentPeriod) || other.currentPeriod == currentPeriod) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._periodScores, _periodScores));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        awayTwoPointMakes,
        homeTwoPointMakes,
        awaySteals,
        homeSteals,
        awayOffensiveRebounds,
        homeOffensiveRebounds,
        awayFieldGoalMakes,
        homeFieldGoalMakes,
        awayFieldGoalAttempts,
        homeFieldGoalAttempts,
        awayTwoPointAttempts,
        homeTwoPointAttempts,
        awayThreePointMakes,
        homeThreePointMakes,
        awayScore,
        homeScore,
        awayFieldGoalPercentage,
        homeFieldGoalPercentage,
        awayFouls,
        homeFouls,
        awayTurnovers,
        homeTurnovers,
        awayFreeThrowAttempts,
        homeFreeThrowAttempts,
        awayTwoPointPercentage,
        homeTwoPointPercentage,
        awayAssists,
        homeAssists,
        awayBlocks,
        homeBlocks,
        awayFreeThrowMakes,
        homeFreeThrowMakes,
        awayDefensiveRebounds,
        homeDefensiveRebounds,
        awayFreeThrowPercentage,
        homeFreeThrowPercentage,
        awayThreePointPercentage,
        homeThreePointPercentage,
        awayThreePointAttempts,
        homeThreePointAttempts,
        currentPeriod,
        status,
        const DeepCollectionEquality().hash(_periodScores)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsUpdateMatchModelImplCopyWith<_$StatsUpdateMatchModelImpl>
      get copyWith => __$$StatsUpdateMatchModelImplCopyWithImpl<
          _$StatsUpdateMatchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsUpdateMatchModelImplToJson(
      this,
    );
  }
}

abstract class _StatsUpdateMatchModel implements StatsUpdateMatchModel {
  const factory _StatsUpdateMatchModel(
          {required final int awayTwoPointMakes,
          required final int homeTwoPointMakes,
          required final int awaySteals,
          required final int homeSteals,
          required final int awayOffensiveRebounds,
          required final int homeOffensiveRebounds,
          required final int awayFieldGoalMakes,
          required final int homeFieldGoalMakes,
          required final int awayFieldGoalAttempts,
          required final int homeFieldGoalAttempts,
          required final int awayTwoPointAttempts,
          required final int homeTwoPointAttempts,
          required final int awayThreePointMakes,
          required final int homeThreePointMakes,
          required final int awayScore,
          required final int homeScore,
          required final double awayFieldGoalPercentage,
          required final double homeFieldGoalPercentage,
          required final int awayFouls,
          required final int homeFouls,
          required final int awayTurnovers,
          required final int homeTurnovers,
          required final int awayFreeThrowAttempts,
          required final int homeFreeThrowAttempts,
          required final double awayTwoPointPercentage,
          required final double homeTwoPointPercentage,
          required final int awayAssists,
          required final int homeAssists,
          required final int awayBlocks,
          required final int homeBlocks,
          required final int awayFreeThrowMakes,
          required final int homeFreeThrowMakes,
          required final int awayDefensiveRebounds,
          required final int homeDefensiveRebounds,
          required final double awayFreeThrowPercentage,
          required final double homeFreeThrowPercentage,
          required final double awayThreePointPercentage,
          required final double homeThreePointPercentage,
          required final int awayThreePointAttempts,
          required final int homeThreePointAttempts,
          required final int currentPeriod,
          required final String status,
          required final Map<String, PeriodScoreModel> periodScores}) =
      _$StatsUpdateMatchModelImpl;

  factory _StatsUpdateMatchModel.fromJson(Map<String, dynamic> json) =
      _$StatsUpdateMatchModelImpl.fromJson;

  @override
  int get awayTwoPointMakes;
  @override
  int get homeTwoPointMakes;
  @override
  int get awaySteals;
  @override
  int get homeSteals;
  @override
  int get awayOffensiveRebounds;
  @override
  int get homeOffensiveRebounds;
  @override
  int get awayFieldGoalMakes;
  @override
  int get homeFieldGoalMakes;
  @override
  int get awayFieldGoalAttempts;
  @override
  int get homeFieldGoalAttempts;
  @override
  int get awayTwoPointAttempts;
  @override
  int get homeTwoPointAttempts;
  @override
  int get awayThreePointMakes;
  @override
  int get homeThreePointMakes;
  @override
  int get awayScore;
  @override
  int get homeScore;
  @override
  double get awayFieldGoalPercentage;
  @override
  double get homeFieldGoalPercentage;
  @override
  int get awayFouls;
  @override
  int get homeFouls;
  @override
  int get awayTurnovers;
  @override
  int get homeTurnovers;
  @override
  int get awayFreeThrowAttempts;
  @override
  int get homeFreeThrowAttempts;
  @override
  double get awayTwoPointPercentage;
  @override
  double get homeTwoPointPercentage;
  @override
  int get awayAssists;
  @override
  int get homeAssists;
  @override
  int get awayBlocks;
  @override
  int get homeBlocks;
  @override
  int get awayFreeThrowMakes;
  @override
  int get homeFreeThrowMakes;
  @override
  int get awayDefensiveRebounds;
  @override
  int get homeDefensiveRebounds;
  @override
  double get awayFreeThrowPercentage;
  @override
  double get homeFreeThrowPercentage;
  @override
  double get awayThreePointPercentage;
  @override
  double get homeThreePointPercentage;
  @override
  int get awayThreePointAttempts;
  @override
  int get homeThreePointAttempts;
  @override
  int get currentPeriod;
  @override
  String get status;
  @override
  Map<String, PeriodScoreModel> get periodScores;
  @override
  @JsonKey(ignore: true)
  _$$StatsUpdateMatchModelImplCopyWith<_$StatsUpdateMatchModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PeriodScoreModel _$PeriodScoreModelFromJson(Map<String, dynamic> json) {
  return _PeriodScoreModel.fromJson(json);
}

/// @nodoc
mixin _$PeriodScoreModel {
  int? get away => throw _privateConstructorUsedError;
  int? get home => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeriodScoreModelCopyWith<PeriodScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodScoreModelCopyWith<$Res> {
  factory $PeriodScoreModelCopyWith(
          PeriodScoreModel value, $Res Function(PeriodScoreModel) then) =
      _$PeriodScoreModelCopyWithImpl<$Res, PeriodScoreModel>;
  @useResult
  $Res call({int? away, int? home});
}

/// @nodoc
class _$PeriodScoreModelCopyWithImpl<$Res, $Val extends PeriodScoreModel>
    implements $PeriodScoreModelCopyWith<$Res> {
  _$PeriodScoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? away = freezed,
    Object? home = freezed,
  }) {
    return _then(_value.copyWith(
      away: freezed == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int?,
      home: freezed == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeriodScoreModelImplCopyWith<$Res>
    implements $PeriodScoreModelCopyWith<$Res> {
  factory _$$PeriodScoreModelImplCopyWith(_$PeriodScoreModelImpl value,
          $Res Function(_$PeriodScoreModelImpl) then) =
      __$$PeriodScoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? away, int? home});
}

/// @nodoc
class __$$PeriodScoreModelImplCopyWithImpl<$Res>
    extends _$PeriodScoreModelCopyWithImpl<$Res, _$PeriodScoreModelImpl>
    implements _$$PeriodScoreModelImplCopyWith<$Res> {
  __$$PeriodScoreModelImplCopyWithImpl(_$PeriodScoreModelImpl _value,
      $Res Function(_$PeriodScoreModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? away = freezed,
    Object? home = freezed,
  }) {
    return _then(_$PeriodScoreModelImpl(
      away: freezed == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int?,
      home: freezed == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PeriodScoreModelImpl implements _PeriodScoreModel {
  const _$PeriodScoreModelImpl({required this.away, required this.home});

  factory _$PeriodScoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PeriodScoreModelImplFromJson(json);

  @override
  final int? away;
  @override
  final int? home;

  @override
  String toString() {
    return 'PeriodScoreModel(away: $away, home: $home)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeriodScoreModelImpl &&
            (identical(other.away, away) || other.away == away) &&
            (identical(other.home, home) || other.home == home));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, away, home);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeriodScoreModelImplCopyWith<_$PeriodScoreModelImpl> get copyWith =>
      __$$PeriodScoreModelImplCopyWithImpl<_$PeriodScoreModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PeriodScoreModelImplToJson(
      this,
    );
  }
}

abstract class _PeriodScoreModel implements PeriodScoreModel {
  const factory _PeriodScoreModel(
      {required final int? away,
      required final int? home}) = _$PeriodScoreModelImpl;

  factory _PeriodScoreModel.fromJson(Map<String, dynamic> json) =
      _$PeriodScoreModelImpl.fromJson;

  @override
  int? get away;
  @override
  int? get home;
  @override
  @JsonKey(ignore: true)
  _$$PeriodScoreModelImplCopyWith<_$PeriodScoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
