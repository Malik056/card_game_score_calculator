// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      id: json['id'] as int,
      gamePlayers: json['gamePlayers'] == null
          ? const []
          : gamePlayersFromJson(json['gamePlayers']),
      rounds:
          json['rounds'] == null ? const [] : roundsFromJson(json['rounds']),
      status: $enumDecode(_$GameStatusEnumMap, json['status']),
      currentRound: json['currentRound'] as int,
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int,
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$GameStatusEnumMap[instance.status]!,
      'currentRound': instance.currentRound,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

const _$GameStatusEnumMap = {
  GameStatus.draft: 'draft',
  GameStatus.inProgress: 'inProgress',
  GameStatus.finished: 'finished',
};
