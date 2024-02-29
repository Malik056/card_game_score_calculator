// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoundPlayer _$RoundPlayerFromJson(Map<String, dynamic> json) {
  return _RoundPlayer.fromJson(json);
}

/// @nodoc
mixin _$RoundPlayer {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(toJson: playerToJson, fromJson: playerFromJson)
  Player get player => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  int get roundId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoundPlayerCopyWith<RoundPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundPlayerCopyWith<$Res> {
  factory $RoundPlayerCopyWith(
          RoundPlayer value, $Res Function(RoundPlayer) then) =
      _$RoundPlayerCopyWithImpl<$Res, RoundPlayer>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(toJson: playerToJson, fromJson: playerFromJson) Player player,
      double score,
      int roundId});

  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class _$RoundPlayerCopyWithImpl<$Res, $Val extends RoundPlayer>
    implements $RoundPlayerCopyWith<$Res> {
  _$RoundPlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player = null,
    Object? score = null,
    Object? roundId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Player,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      roundId: null == roundId
          ? _value.roundId
          : roundId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get player {
    return $PlayerCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoundPlayerImplCopyWith<$Res>
    implements $RoundPlayerCopyWith<$Res> {
  factory _$$RoundPlayerImplCopyWith(
          _$RoundPlayerImpl value, $Res Function(_$RoundPlayerImpl) then) =
      __$$RoundPlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(toJson: playerToJson, fromJson: playerFromJson) Player player,
      double score,
      int roundId});

  @override
  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class __$$RoundPlayerImplCopyWithImpl<$Res>
    extends _$RoundPlayerCopyWithImpl<$Res, _$RoundPlayerImpl>
    implements _$$RoundPlayerImplCopyWith<$Res> {
  __$$RoundPlayerImplCopyWithImpl(
      _$RoundPlayerImpl _value, $Res Function(_$RoundPlayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player = null,
    Object? score = null,
    Object? roundId = null,
  }) {
    return _then(_$RoundPlayerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Player,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      roundId: null == roundId
          ? _value.roundId
          : roundId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$RoundPlayerImpl extends _RoundPlayer {
  const _$RoundPlayerImpl(
      {required this.id,
      @JsonKey(toJson: playerToJson, fromJson: playerFromJson)
      required this.player,
      required this.score,
      required this.roundId})
      : super._();

  factory _$RoundPlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoundPlayerImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(toJson: playerToJson, fromJson: playerFromJson)
  final Player player;
  @override
  final double score;
  @override
  final int roundId;

  @override
  String toString() {
    return 'RoundPlayer(id: $id, player: $player, score: $score, roundId: $roundId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoundPlayerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.roundId, roundId) || other.roundId == roundId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, player, score, roundId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoundPlayerImplCopyWith<_$RoundPlayerImpl> get copyWith =>
      __$$RoundPlayerImplCopyWithImpl<_$RoundPlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoundPlayerImplToJson(
      this,
    );
  }
}

abstract class _RoundPlayer extends RoundPlayer {
  const factory _RoundPlayer(
      {required final int id,
      @JsonKey(toJson: playerToJson, fromJson: playerFromJson)
      required final Player player,
      required final double score,
      required final int roundId}) = _$RoundPlayerImpl;
  const _RoundPlayer._() : super._();

  factory _RoundPlayer.fromJson(Map<String, dynamic> json) =
      _$RoundPlayerImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(toJson: playerToJson, fromJson: playerFromJson)
  Player get player;
  @override
  double get score;
  @override
  int get roundId;
  @override
  @JsonKey(ignore: true)
  _$$RoundPlayerImplCopyWith<_$RoundPlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
