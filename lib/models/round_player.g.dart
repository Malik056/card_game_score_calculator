// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoundPlayerImpl _$$RoundPlayerImplFromJson(Map<String, dynamic> json) =>
    _$RoundPlayerImpl(
      id: json['id'] as int,
      player: playerFromJson(json['player']),
      score: (json['score'] as num).toDouble(),
      roundId: json['roundId'] as int,
    );

Map<String, dynamic> _$$RoundPlayerImplToJson(_$RoundPlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player': playerToJson(instance.player),
      'score': instance.score,
      'roundId': instance.roundId,
    };
