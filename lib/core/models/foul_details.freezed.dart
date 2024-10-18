// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'foul_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoulDetails _$FoulDetailsFromJson(Map<String, dynamic> json) {
  return _FoulDetails.fromJson(json);
}

/// @nodoc
mixin _$FoulDetails {
  int get awayTotal => throw _privateConstructorUsedError;
  int get homeTotal => throw _privateConstructorUsedError;
  int get awayTwoMinute => throw _privateConstructorUsedError;
  int get homeTwoMinute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoulDetailsCopyWith<FoulDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoulDetailsCopyWith<$Res> {
  factory $FoulDetailsCopyWith(
          FoulDetails value, $Res Function(FoulDetails) then) =
      _$FoulDetailsCopyWithImpl<$Res, FoulDetails>;
  @useResult
  $Res call(
      {int awayTotal, int homeTotal, int awayTwoMinute, int homeTwoMinute});
}

/// @nodoc
class _$FoulDetailsCopyWithImpl<$Res, $Val extends FoulDetails>
    implements $FoulDetailsCopyWith<$Res> {
  _$FoulDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awayTotal = null,
    Object? homeTotal = null,
    Object? awayTwoMinute = null,
    Object? homeTwoMinute = null,
  }) {
    return _then(_value.copyWith(
      awayTotal: null == awayTotal
          ? _value.awayTotal
          : awayTotal // ignore: cast_nullable_to_non_nullable
              as int,
      homeTotal: null == homeTotal
          ? _value.homeTotal
          : homeTotal // ignore: cast_nullable_to_non_nullable
              as int,
      awayTwoMinute: null == awayTwoMinute
          ? _value.awayTwoMinute
          : awayTwoMinute // ignore: cast_nullable_to_non_nullable
              as int,
      homeTwoMinute: null == homeTwoMinute
          ? _value.homeTwoMinute
          : homeTwoMinute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoulDetailsImplCopyWith<$Res>
    implements $FoulDetailsCopyWith<$Res> {
  factory _$$FoulDetailsImplCopyWith(
          _$FoulDetailsImpl value, $Res Function(_$FoulDetailsImpl) then) =
      __$$FoulDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int awayTotal, int homeTotal, int awayTwoMinute, int homeTwoMinute});
}

/// @nodoc
class __$$FoulDetailsImplCopyWithImpl<$Res>
    extends _$FoulDetailsCopyWithImpl<$Res, _$FoulDetailsImpl>
    implements _$$FoulDetailsImplCopyWith<$Res> {
  __$$FoulDetailsImplCopyWithImpl(
      _$FoulDetailsImpl _value, $Res Function(_$FoulDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awayTotal = null,
    Object? homeTotal = null,
    Object? awayTwoMinute = null,
    Object? homeTwoMinute = null,
  }) {
    return _then(_$FoulDetailsImpl(
      awayTotal: null == awayTotal
          ? _value.awayTotal
          : awayTotal // ignore: cast_nullable_to_non_nullable
              as int,
      homeTotal: null == homeTotal
          ? _value.homeTotal
          : homeTotal // ignore: cast_nullable_to_non_nullable
              as int,
      awayTwoMinute: null == awayTwoMinute
          ? _value.awayTwoMinute
          : awayTwoMinute // ignore: cast_nullable_to_non_nullable
              as int,
      homeTwoMinute: null == homeTwoMinute
          ? _value.homeTwoMinute
          : homeTwoMinute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoulDetailsImpl implements _FoulDetails {
  const _$FoulDetailsImpl(
      {this.awayTotal = 0,
      this.homeTotal = 0,
      this.awayTwoMinute = 0,
      this.homeTwoMinute = 0});

  factory _$FoulDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoulDetailsImplFromJson(json);

  @override
  @JsonKey()
  final int awayTotal;
  @override
  @JsonKey()
  final int homeTotal;
  @override
  @JsonKey()
  final int awayTwoMinute;
  @override
  @JsonKey()
  final int homeTwoMinute;

  @override
  String toString() {
    return 'FoulDetails(awayTotal: $awayTotal, homeTotal: $homeTotal, awayTwoMinute: $awayTwoMinute, homeTwoMinute: $homeTwoMinute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoulDetailsImpl &&
            (identical(other.awayTotal, awayTotal) ||
                other.awayTotal == awayTotal) &&
            (identical(other.homeTotal, homeTotal) ||
                other.homeTotal == homeTotal) &&
            (identical(other.awayTwoMinute, awayTwoMinute) ||
                other.awayTwoMinute == awayTwoMinute) &&
            (identical(other.homeTwoMinute, homeTwoMinute) ||
                other.homeTwoMinute == homeTwoMinute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, awayTotal, homeTotal, awayTwoMinute, homeTwoMinute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoulDetailsImplCopyWith<_$FoulDetailsImpl> get copyWith =>
      __$$FoulDetailsImplCopyWithImpl<_$FoulDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoulDetailsImplToJson(
      this,
    );
  }
}

abstract class _FoulDetails implements FoulDetails {
  const factory _FoulDetails(
      {final int awayTotal,
      final int homeTotal,
      final int awayTwoMinute,
      final int homeTwoMinute}) = _$FoulDetailsImpl;

  factory _FoulDetails.fromJson(Map<String, dynamic> json) =
      _$FoulDetailsImpl.fromJson;

  @override
  int get awayTotal;
  @override
  int get homeTotal;
  @override
  int get awayTwoMinute;
  @override
  int get homeTwoMinute;
  @override
  @JsonKey(ignore: true)
  _$$FoulDetailsImplCopyWith<_$FoulDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
