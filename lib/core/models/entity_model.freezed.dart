// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Entity _$EntityFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'player':
      return PlayerEntity.fromJson(json);
    case 'team':
      return TeamEntity.fromJson(json);
    case 'match':
      return MatchEntity.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'Entity', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$Entity {
  SportLeague get league => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get abbrv => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  EntityType get type => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)
        player,
    required TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)
        team,
    required TResult Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)
        match,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)?
        player,
    TResult? Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)?
        team,
    TResult? Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)?
        match,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)?
        player,
    TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)?
        team,
    TResult Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)?
        match,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayerEntity value) player,
    required TResult Function(TeamEntity value) team,
    required TResult Function(MatchEntity value) match,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlayerEntity value)? player,
    TResult? Function(TeamEntity value)? team,
    TResult? Function(MatchEntity value)? match,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayerEntity value)? player,
    TResult Function(TeamEntity value)? team,
    TResult Function(MatchEntity value)? match,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityCopyWith<Entity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityCopyWith<$Res> {
  factory $EntityCopyWith(Entity value, $Res Function(Entity) then) =
      _$EntityCopyWithImpl<$Res, Entity>;
  @useResult
  $Res call(
      {SportLeague league,
      String? label,
      String? abbrv,
      String? id,
      EntityType type,
      String? uuid,
      String? image});
}

/// @nodoc
class _$EntityCopyWithImpl<$Res, $Val extends Entity>
    implements $EntityCopyWith<$Res> {
  _$EntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? label = freezed,
    Object? abbrv = freezed,
    Object? id = freezed,
    Object? type = null,
    Object? uuid = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      abbrv: freezed == abbrv
          ? _value.abbrv
          : abbrv // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EntityType,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerEntityImplCopyWith<$Res>
    implements $EntityCopyWith<$Res> {
  factory _$$PlayerEntityImplCopyWith(
          _$PlayerEntityImpl value, $Res Function(_$PlayerEntityImpl) then) =
      __$$PlayerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SportLeague league,
      String? label,
      String? abbrv,
      String? id,
      EntityType type,
      String? teamId,
      String? uuid,
      String? image});
}

/// @nodoc
class __$$PlayerEntityImplCopyWithImpl<$Res>
    extends _$EntityCopyWithImpl<$Res, _$PlayerEntityImpl>
    implements _$$PlayerEntityImplCopyWith<$Res> {
  __$$PlayerEntityImplCopyWithImpl(
      _$PlayerEntityImpl _value, $Res Function(_$PlayerEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? label = freezed,
    Object? abbrv = freezed,
    Object? id = freezed,
    Object? type = null,
    Object? teamId = freezed,
    Object? uuid = freezed,
    Object? image = freezed,
  }) {
    return _then(_$PlayerEntityImpl(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      abbrv: freezed == abbrv
          ? _value.abbrv
          : abbrv // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EntityType,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerEntityImpl implements PlayerEntity {
  const _$PlayerEntityImpl(
      {required this.league,
      this.label,
      this.abbrv,
      this.id,
      this.type = EntityType.player,
      this.teamId,
      this.uuid,
      this.image});

  factory _$PlayerEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerEntityImplFromJson(json);

  @override
  final SportLeague league;
  @override
  final String? label;
  @override
  final String? abbrv;
  @override
  final String? id;
  @override
  @JsonKey()
  final EntityType type;
  @override
  final String? teamId;
  @override
  final String? uuid;
  @override
  final String? image;

  @override
  String toString() {
    return 'Entity.player(league: $league, label: $label, abbrv: $abbrv, id: $id, type: $type, teamId: $teamId, uuid: $uuid, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEntityImpl &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.abbrv, abbrv) || other.abbrv == abbrv) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, league, label, abbrv, id, type, teamId, uuid, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEntityImplCopyWith<_$PlayerEntityImpl> get copyWith =>
      __$$PlayerEntityImplCopyWithImpl<_$PlayerEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)
        player,
    required TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)
        team,
    required TResult Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)
        match,
  }) {
    return player(league, label, abbrv, id, type, teamId, uuid, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)?
        player,
    TResult? Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)?
        team,
    TResult? Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)?
        match,
  }) {
    return player?.call(league, label, abbrv, id, type, teamId, uuid, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)?
        player,
    TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)?
        team,
    TResult Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)?
        match,
    required TResult orElse(),
  }) {
    if (player != null) {
      return player(league, label, abbrv, id, type, teamId, uuid, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayerEntity value) player,
    required TResult Function(TeamEntity value) team,
    required TResult Function(MatchEntity value) match,
  }) {
    return player(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlayerEntity value)? player,
    TResult? Function(TeamEntity value)? team,
    TResult? Function(MatchEntity value)? match,
  }) {
    return player?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayerEntity value)? player,
    TResult Function(TeamEntity value)? team,
    TResult Function(MatchEntity value)? match,
    required TResult orElse(),
  }) {
    if (player != null) {
      return player(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerEntityImplToJson(
      this,
    );
  }
}

abstract class PlayerEntity implements Entity {
  const factory PlayerEntity(
      {required final SportLeague league,
      final String? label,
      final String? abbrv,
      final String? id,
      final EntityType type,
      final String? teamId,
      final String? uuid,
      final String? image}) = _$PlayerEntityImpl;

  factory PlayerEntity.fromJson(Map<String, dynamic> json) =
      _$PlayerEntityImpl.fromJson;

  @override
  SportLeague get league;
  @override
  String? get label;
  @override
  String? get abbrv;
  @override
  String? get id;
  @override
  EntityType get type;
  String? get teamId;
  @override
  String? get uuid;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$PlayerEntityImplCopyWith<_$PlayerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TeamEntityImplCopyWith<$Res>
    implements $EntityCopyWith<$Res> {
  factory _$$TeamEntityImplCopyWith(
          _$TeamEntityImpl value, $Res Function(_$TeamEntityImpl) then) =
      __$$TeamEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SportLeague league,
      String? label,
      String? abbrv,
      String? id,
      EntityType type,
      String? primaryColor,
      String? secondaryColor,
      String? uuid,
      String? image,
      String? altImage});
}

/// @nodoc
class __$$TeamEntityImplCopyWithImpl<$Res>
    extends _$EntityCopyWithImpl<$Res, _$TeamEntityImpl>
    implements _$$TeamEntityImplCopyWith<$Res> {
  __$$TeamEntityImplCopyWithImpl(
      _$TeamEntityImpl _value, $Res Function(_$TeamEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? label = freezed,
    Object? abbrv = freezed,
    Object? id = freezed,
    Object? type = null,
    Object? primaryColor = freezed,
    Object? secondaryColor = freezed,
    Object? uuid = freezed,
    Object? image = freezed,
    Object? altImage = freezed,
  }) {
    return _then(_$TeamEntityImpl(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      abbrv: freezed == abbrv
          ? _value.abbrv
          : abbrv // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EntityType,
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryColor: freezed == secondaryColor
          ? _value.secondaryColor
          : secondaryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      altImage: freezed == altImage
          ? _value.altImage
          : altImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamEntityImpl implements TeamEntity {
  const _$TeamEntityImpl(
      {required this.league,
      this.label,
      this.abbrv,
      this.id,
      this.type = EntityType.team,
      this.primaryColor,
      this.secondaryColor,
      this.uuid,
      this.image,
      this.altImage});

  factory _$TeamEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamEntityImplFromJson(json);

  @override
  final SportLeague league;
  @override
  final String? label;
  @override
  final String? abbrv;
  @override
  final String? id;
  @override
  @JsonKey()
  final EntityType type;
  @override
  final String? primaryColor;
  @override
  final String? secondaryColor;
  @override
  final String? uuid;
  @override
  final String? image;
  @override
  final String? altImage;

  @override
  String toString() {
    return 'Entity.team(league: $league, label: $label, abbrv: $abbrv, id: $id, type: $type, primaryColor: $primaryColor, secondaryColor: $secondaryColor, uuid: $uuid, image: $image, altImage: $altImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamEntityImpl &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.abbrv, abbrv) || other.abbrv == abbrv) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor) &&
            (identical(other.secondaryColor, secondaryColor) ||
                other.secondaryColor == secondaryColor) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.altImage, altImage) ||
                other.altImage == altImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, league, label, abbrv, id, type,
      primaryColor, secondaryColor, uuid, image, altImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamEntityImplCopyWith<_$TeamEntityImpl> get copyWith =>
      __$$TeamEntityImplCopyWithImpl<_$TeamEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)
        player,
    required TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)
        team,
    required TResult Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)
        match,
  }) {
    return team(league, label, abbrv, id, type, primaryColor, secondaryColor,
        uuid, image, altImage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)?
        player,
    TResult? Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)?
        team,
    TResult? Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)?
        match,
  }) {
    return team?.call(league, label, abbrv, id, type, primaryColor,
        secondaryColor, uuid, image, altImage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)?
        player,
    TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)?
        team,
    TResult Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)?
        match,
    required TResult orElse(),
  }) {
    if (team != null) {
      return team(league, label, abbrv, id, type, primaryColor, secondaryColor,
          uuid, image, altImage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayerEntity value) player,
    required TResult Function(TeamEntity value) team,
    required TResult Function(MatchEntity value) match,
  }) {
    return team(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlayerEntity value)? player,
    TResult? Function(TeamEntity value)? team,
    TResult? Function(MatchEntity value)? match,
  }) {
    return team?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayerEntity value)? player,
    TResult Function(TeamEntity value)? team,
    TResult Function(MatchEntity value)? match,
    required TResult orElse(),
  }) {
    if (team != null) {
      return team(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamEntityImplToJson(
      this,
    );
  }
}

abstract class TeamEntity implements Entity {
  const factory TeamEntity(
      {required final SportLeague league,
      final String? label,
      final String? abbrv,
      final String? id,
      final EntityType type,
      final String? primaryColor,
      final String? secondaryColor,
      final String? uuid,
      final String? image,
      final String? altImage}) = _$TeamEntityImpl;

  factory TeamEntity.fromJson(Map<String, dynamic> json) =
      _$TeamEntityImpl.fromJson;

  @override
  SportLeague get league;
  @override
  String? get label;
  @override
  String? get abbrv;
  @override
  String? get id;
  @override
  EntityType get type;
  String? get primaryColor;
  String? get secondaryColor;
  @override
  String? get uuid;
  @override
  String? get image;
  String? get altImage;
  @override
  @JsonKey(ignore: true)
  _$$TeamEntityImplCopyWith<_$TeamEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchEntityImplCopyWith<$Res>
    implements $EntityCopyWith<$Res> {
  factory _$$MatchEntityImplCopyWith(
          _$MatchEntityImpl value, $Res Function(_$MatchEntityImpl) then) =
      __$$MatchEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SportLeague league,
      String? label,
      String? abbrv,
      String? id,
      EntityType type,
      String? uuid,
      String? image});
}

/// @nodoc
class __$$MatchEntityImplCopyWithImpl<$Res>
    extends _$EntityCopyWithImpl<$Res, _$MatchEntityImpl>
    implements _$$MatchEntityImplCopyWith<$Res> {
  __$$MatchEntityImplCopyWithImpl(
      _$MatchEntityImpl _value, $Res Function(_$MatchEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = null,
    Object? label = freezed,
    Object? abbrv = freezed,
    Object? id = freezed,
    Object? type = null,
    Object? uuid = freezed,
    Object? image = freezed,
  }) {
    return _then(_$MatchEntityImpl(
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as SportLeague,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      abbrv: freezed == abbrv
          ? _value.abbrv
          : abbrv // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EntityType,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchEntityImpl implements MatchEntity {
  const _$MatchEntityImpl(
      {required this.league,
      this.label,
      this.abbrv,
      this.id,
      this.type = EntityType.match,
      this.uuid,
      this.image});

  factory _$MatchEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchEntityImplFromJson(json);

  @override
  final SportLeague league;
  @override
  final String? label;
  @override
  final String? abbrv;
  @override
  final String? id;
  @override
  @JsonKey()
  final EntityType type;
  @override
  final String? uuid;
  @override
  final String? image;

  @override
  String toString() {
    return 'Entity.match(league: $league, label: $label, abbrv: $abbrv, id: $id, type: $type, uuid: $uuid, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchEntityImpl &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.abbrv, abbrv) || other.abbrv == abbrv) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, league, label, abbrv, id, type, uuid, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchEntityImplCopyWith<_$MatchEntityImpl> get copyWith =>
      __$$MatchEntityImplCopyWithImpl<_$MatchEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)
        player,
    required TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)
        team,
    required TResult Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)
        match,
  }) {
    return match(league, label, abbrv, id, type, uuid, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)?
        player,
    TResult? Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)?
        team,
    TResult? Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)?
        match,
  }) {
    return match?.call(league, label, abbrv, id, type, uuid, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? teamId,
            String? uuid,
            String? image)?
        player,
    TResult Function(
            SportLeague league,
            String? label,
            String? abbrv,
            String? id,
            EntityType type,
            String? primaryColor,
            String? secondaryColor,
            String? uuid,
            String? image,
            String? altImage)?
        team,
    TResult Function(SportLeague league, String? label, String? abbrv,
            String? id, EntityType type, String? uuid, String? image)?
        match,
    required TResult orElse(),
  }) {
    if (match != null) {
      return match(league, label, abbrv, id, type, uuid, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayerEntity value) player,
    required TResult Function(TeamEntity value) team,
    required TResult Function(MatchEntity value) match,
  }) {
    return match(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlayerEntity value)? player,
    TResult? Function(TeamEntity value)? team,
    TResult? Function(MatchEntity value)? match,
  }) {
    return match?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayerEntity value)? player,
    TResult Function(TeamEntity value)? team,
    TResult Function(MatchEntity value)? match,
    required TResult orElse(),
  }) {
    if (match != null) {
      return match(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchEntityImplToJson(
      this,
    );
  }
}

abstract class MatchEntity implements Entity {
  const factory MatchEntity(
      {required final SportLeague league,
      final String? label,
      final String? abbrv,
      final String? id,
      final EntityType type,
      final String? uuid,
      final String? image}) = _$MatchEntityImpl;

  factory MatchEntity.fromJson(Map<String, dynamic> json) =
      _$MatchEntityImpl.fromJson;

  @override
  SportLeague get league;
  @override
  String? get label;
  @override
  String? get abbrv;
  @override
  String? get id;
  @override
  EntityType get type;
  @override
  String? get uuid;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$MatchEntityImplCopyWith<_$MatchEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
