// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoundImpl _$$RoundImplFromJson(Map<String, dynamic> json) => _$RoundImpl(
      id: json['id'] as int,
      gameId: json['gameId'] as int,
      roundPlayers: roundPlayersFromJson(json['roundPlayers']),
      roundNumber: json['roundNumber'] as int,
      status: $enumDecode(_$RoundStatusEnumMap, json['status']),
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int,
    );

Map<String, dynamic> _$$RoundImplToJson(_$RoundImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gameId': instance.gameId,
      'roundNumber': instance.roundNumber,
      'status': _$RoundStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

const _$RoundStatusEnumMap = {
  RoundStatus.created: 'created',
  RoundStatus.inProgress: 'inProgress',
  RoundStatus.completed: 'completed',
};
