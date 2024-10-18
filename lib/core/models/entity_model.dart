import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_tracker/core/models/enums.dart';

part 'entity_model.freezed.dart';
part 'entity_model.g.dart';

@Freezed(unionKey: 'type')
class Entity with _$Entity {
  const factory Entity.player({
    required SportLeague league,
    String? label,
    String? abbrv,
    String? id,
    @Default(EntityType.player) EntityType type,
    String? teamId,
    String? uuid,
    String? image,
  }) = PlayerEntity;

  const factory Entity.team({
    required SportLeague league,
    String? label,
    String? abbrv,
    String? id,
    @Default(EntityType.team) EntityType type,
    String? primaryColor,
    String? secondaryColor,
    String? uuid,
    String? image,
    String? altImage,
  }) = TeamEntity;

  const factory Entity.match({
    required SportLeague league,
    String? label,
    String? abbrv,
    String? id,
    @Default(EntityType.match) EntityType type,
    String? uuid,
    String? image,
  }) = MatchEntity;

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
}

extension TeamIdExtension on Entity {
  String get currentTeamId {
    return this is PlayerEntity
        ? (this as PlayerEntity).teamId!
        : (this as TeamEntity).id!;
  }
}
