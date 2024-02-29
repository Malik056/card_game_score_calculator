// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Round _$RoundFromJson(Map<String, dynamic> json) {
  return _Round.fromJson(json);
}

/// @nodoc
mixin _$Round {
  int get id => throw _privateConstructorUsedError;
  int get gameId => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      fromJson: roundPlayersFromJson)
  List<RoundPlayer> get roundPlayers => throw _privateConstructorUsedError;
  int get roundNumber => throw _privateConstructorUsedError;
  RoundStatus get status => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoundCopyWith<Round> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundCopyWith<$Res> {
  factory $RoundCopyWith(Round value, $Res Function(Round) then) =
      _$RoundCopyWithImpl<$Res, Round>;
  @useResult
  $Res call(
      {int id,
      int gameId,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          fromJson: roundPlayersFromJson)
      List<RoundPlayer> roundPlayers,
      int roundNumber,
      RoundStatus status,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class _$RoundCopyWithImpl<$Res, $Val extends Round>
    implements $RoundCopyWith<$Res> {
  _$RoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameId = null,
    Object? roundPlayers = null,
    Object? roundNumber = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      roundPlayers: null == roundPlayers
          ? _value.roundPlayers
          : roundPlayers // ignore: cast_nullable_to_non_nullable
              as List<RoundPlayer>,
      roundNumber: null == roundNumber
          ? _value.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoundStatus,
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
abstract class _$$RoundImplCopyWith<$Res> implements $RoundCopyWith<$Res> {
  factory _$$RoundImplCopyWith(
          _$RoundImpl value, $Res Function(_$RoundImpl) then) =
      __$$RoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int gameId,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          fromJson: roundPlayersFromJson)
      List<RoundPlayer> roundPlayers,
      int roundNumber,
      RoundStatus status,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class __$$RoundImplCopyWithImpl<$Res>
    extends _$RoundCopyWithImpl<$Res, _$RoundImpl>
    implements _$$RoundImplCopyWith<$Res> {
  __$$RoundImplCopyWithImpl(
      _$RoundImpl _value, $Res Function(_$RoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameId = null,
    Object? roundPlayers = null,
    Object? roundNumber = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RoundImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      roundPlayers: null == roundPlayers
          ? _value._roundPlayers
          : roundPlayers // ignore: cast_nullable_to_non_nullable
              as List<RoundPlayer>,
      roundNumber: null == roundNumber
          ? _value.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoundStatus,
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
class _$RoundImpl extends _Round {
  const _$RoundImpl(
      {required this.id,
      required this.gameId,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          fromJson: roundPlayersFromJson)
      required final List<RoundPlayer> roundPlayers,
      required this.roundNumber,
      required this.status,
      required this.createdAt,
      required this.updatedAt})
      : _roundPlayers = roundPlayers,
        super._();

  factory _$RoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoundImplFromJson(json);

  @override
  final int id;
  @override
  final int gameId;
  final List<RoundPlayer> _roundPlayers;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      fromJson: roundPlayersFromJson)
  List<RoundPlayer> get roundPlayers {
    if (_roundPlayers is EqualUnmodifiableListView) return _roundPlayers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roundPlayers);
  }

  @override
  final int roundNumber;
  @override
  final RoundStatus status;
  @override
  final int createdAt;
  @override
  final int updatedAt;

  @override
  String toString() {
    return 'Round(id: $id, gameId: $gameId, roundPlayers: $roundPlayers, roundNumber: $roundNumber, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            const DeepCollectionEquality()
                .equals(other._roundPlayers, _roundPlayers) &&
            (identical(other.roundNumber, roundNumber) ||
                other.roundNumber == roundNumber) &&
            (identical(other.status, status) || other.status == status) &&
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
      gameId,
      const DeepCollectionEquality().hash(_roundPlayers),
      roundNumber,
      status,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoundImplCopyWith<_$RoundImpl> get copyWith =>
      __$$RoundImplCopyWithImpl<_$RoundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoundImplToJson(
      this,
    );
  }
}

abstract class _Round extends Round {
  const factory _Round(
      {required final int id,
      required final int gameId,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          fromJson: roundPlayersFromJson)
      required final List<RoundPlayer> roundPlayers,
      required final int roundNumber,
      required final RoundStatus status,
      required final int createdAt,
      required final int updatedAt}) = _$RoundImpl;
  const _Round._() : super._();

  factory _Round.fromJson(Map<String, dynamic> json) = _$RoundImpl.fromJson;

  @override
  int get id;
  @override
  int get gameId;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      fromJson: roundPlayersFromJson)
  List<RoundPlayer> get roundPlayers;
  @override
  int get roundNumber;
  @override
  RoundStatus get status;
  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RoundImplCopyWith<_$RoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
