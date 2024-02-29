// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
mixin _$Game {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      fromJson: gamePlayersFromJson)
  List<GamePlayer> get gamePlayers => throw _privateConstructorUsedError;
  @JsonKey(
      includeToJson: false, includeFromJson: true, fromJson: roundsFromJson)
  List<Round> get rounds => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  int get currentRound => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          fromJson: gamePlayersFromJson)
      List<GamePlayer> gamePlayers,
      @JsonKey(
          includeToJson: false, includeFromJson: true, fromJson: roundsFromJson)
      List<Round> rounds,
      GameStatus status,
      int currentRound,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gamePlayers = null,
    Object? rounds = null,
    Object? status = null,
    Object? currentRound = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      gamePlayers: null == gamePlayers
          ? _value.gamePlayers
          : gamePlayers // ignore: cast_nullable_to_non_nullable
              as List<GamePlayer>,
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as List<Round>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          fromJson: gamePlayersFromJson)
      List<GamePlayer> gamePlayers,
      @JsonKey(
          includeToJson: false, includeFromJson: true, fromJson: roundsFromJson)
      List<Round> rounds,
      GameStatus status,
      int currentRound,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gamePlayers = null,
    Object? rounds = null,
    Object? status = null,
    Object? currentRound = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$GameImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      gamePlayers: null == gamePlayers
          ? _value._gamePlayers
          : gamePlayers // ignore: cast_nullable_to_non_nullable
              as List<GamePlayer>,
      rounds: null == rounds
          ? _value._rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as List<Round>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$GameImpl extends _Game {
  const _$GameImpl(
      {required this.id,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          fromJson: gamePlayersFromJson)
      final List<GamePlayer> gamePlayers = const [],
      @JsonKey(
          includeToJson: false, includeFromJson: true, fromJson: roundsFromJson)
      final List<Round> rounds = const [],
      required this.status,
      required this.currentRound,
      required this.createdAt,
      required this.updatedAt})
      : _gamePlayers = gamePlayers,
        _rounds = rounds,
        super._();

  factory _$GameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameImplFromJson(json);

  @override
  final int id;
  final List<GamePlayer> _gamePlayers;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      fromJson: gamePlayersFromJson)
  List<GamePlayer> get gamePlayers {
    if (_gamePlayers is EqualUnmodifiableListView) return _gamePlayers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gamePlayers);
  }

  final List<Round> _rounds;
  @override
  @JsonKey(
      includeToJson: false, includeFromJson: true, fromJson: roundsFromJson)
  List<Round> get rounds {
    if (_rounds is EqualUnmodifiableListView) return _rounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rounds);
  }

  @override
  final GameStatus status;
  @override
  final int currentRound;
  @override
  final int createdAt;
  @override
  final int updatedAt;

  @override
  String toString() {
    return 'Game(id: $id, gamePlayers: $gamePlayers, rounds: $rounds, status: $status, currentRound: $currentRound, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._gamePlayers, _gamePlayers) &&
            const DeepCollectionEquality().equals(other._rounds, _rounds) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentRound, currentRound) ||
                other.currentRound == currentRound) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_gamePlayers),
      const DeepCollectionEquality().hash(_rounds),
      status,
      currentRound,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameImplToJson(
      this,
    );
  }
}

abstract class _Game extends Game {
  const factory _Game(
      {required final int id,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          fromJson: gamePlayersFromJson)
      final List<GamePlayer> gamePlayers,
      @JsonKey(
          includeToJson: false, includeFromJson: true, fromJson: roundsFromJson)
      final List<Round> rounds,
      required final GameStatus status,
      required final int currentRound,
      required final int createdAt,
      required final int updatedAt}) = _$GameImpl;
  const _Game._() : super._();

  factory _Game.fromJson(Map<String, dynamic> json) = _$GameImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      fromJson: gamePlayersFromJson)
  List<GamePlayer> get gamePlayers;
  @override
  @JsonKey(
      includeToJson: false, includeFromJson: true, fromJson: roundsFromJson)
  List<Round> get rounds;
  @override
  GameStatus get status;
  @override
  int get currentRound;
  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
