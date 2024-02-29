// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GamePlayerImpl _$$GamePlayerImplFromJson(Map<String, dynamic> json) =>
    _$GamePlayerImpl(
      id: json['id'] as int,
      player: playerFromJson(json['player']),
      score: (json['score'] as num).toDouble(),
      gameId: json['gameId'] as int,
    );

Map<String, dynamic> _$$GamePlayerImplToJson(_$GamePlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player': playerToJson(instance.player),
      'score': instance.score,
      'gameId': instance.gameId,
    };
