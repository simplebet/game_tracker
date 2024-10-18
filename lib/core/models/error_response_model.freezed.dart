// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) {
  return _ErrorResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponseModel {
  int? get httpStatusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get httpStatusMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_code')
  int? get apiErrorCode => throw _privateConstructorUsedError;
  dynamic get reason => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorResponseModelCopyWith<ErrorResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResponseModelCopyWith<$Res> {
  factory $ErrorResponseModelCopyWith(
          ErrorResponseModel value, $Res Function(ErrorResponseModel) then) =
      _$ErrorResponseModelCopyWithImpl<$Res, ErrorResponseModel>;
  @useResult
  $Res call(
      {int? httpStatusCode,
      @JsonKey(name: 'name') String? httpStatusMessage,
      @JsonKey(name: 'error_code') int? apiErrorCode,
      dynamic reason,
      String? message});
}

/// @nodoc
class _$ErrorResponseModelCopyWithImpl<$Res, $Val extends ErrorResponseModel>
    implements $ErrorResponseModelCopyWith<$Res> {
  _$ErrorResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? httpStatusCode = freezed,
    Object? httpStatusMessage = freezed,
    Object? apiErrorCode = freezed,
    Object? reason = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      httpStatusCode: freezed == httpStatusCode
          ? _value.httpStatusCode
          : httpStatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      httpStatusMessage: freezed == httpStatusMessage
          ? _value.httpStatusMessage
          : httpStatusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      apiErrorCode: freezed == apiErrorCode
          ? _value.apiErrorCode
          : apiErrorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorResponseModelImplCopyWith<$Res>
    implements $ErrorResponseModelCopyWith<$Res> {
  factory _$$ErrorResponseModelImplCopyWith(_$ErrorResponseModelImpl value,
          $Res Function(_$ErrorResponseModelImpl) then) =
      __$$ErrorResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? httpStatusCode,
      @JsonKey(name: 'name') String? httpStatusMessage,
      @JsonKey(name: 'error_code') int? apiErrorCode,
      dynamic reason,
      String? message});
}

/// @nodoc
class __$$ErrorResponseModelImplCopyWithImpl<$Res>
    extends _$ErrorResponseModelCopyWithImpl<$Res, _$ErrorResponseModelImpl>
    implements _$$ErrorResponseModelImplCopyWith<$Res> {
  __$$ErrorResponseModelImplCopyWithImpl(_$ErrorResponseModelImpl _value,
      $Res Function(_$ErrorResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? httpStatusCode = freezed,
    Object? httpStatusMessage = freezed,
    Object? apiErrorCode = freezed,
    Object? reason = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ErrorResponseModelImpl(
      httpStatusCode: freezed == httpStatusCode
          ? _value.httpStatusCode
          : httpStatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      httpStatusMessage: freezed == httpStatusMessage
          ? _value.httpStatusMessage
          : httpStatusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      apiErrorCode: freezed == apiErrorCode
          ? _value.apiErrorCode
          : apiErrorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorResponseModelImpl implements _ErrorResponseModel {
  const _$ErrorResponseModelImpl(
      {this.httpStatusCode,
      @JsonKey(name: 'name') this.httpStatusMessage,
      @JsonKey(name: 'error_code') this.apiErrorCode,
      this.reason = null,
      this.message});

  factory _$ErrorResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorResponseModelImplFromJson(json);

  @override
  final int? httpStatusCode;
  @override
  @JsonKey(name: 'name')
  final String? httpStatusMessage;
  @override
  @JsonKey(name: 'error_code')
  final int? apiErrorCode;
  @override
  @JsonKey()
  final dynamic reason;
  @override
  final String? message;

  @override
  String toString() {
    return 'ErrorResponseModel(httpStatusCode: $httpStatusCode, httpStatusMessage: $httpStatusMessage, apiErrorCode: $apiErrorCode, reason: $reason, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResponseModelImpl &&
            (identical(other.httpStatusCode, httpStatusCode) ||
                other.httpStatusCode == httpStatusCode) &&
            (identical(other.httpStatusMessage, httpStatusMessage) ||
                other.httpStatusMessage == httpStatusMessage) &&
            (identical(other.apiErrorCode, apiErrorCode) ||
                other.apiErrorCode == apiErrorCode) &&
            const DeepCollectionEquality().equals(other.reason, reason) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      httpStatusCode,
      httpStatusMessage,
      apiErrorCode,
      const DeepCollectionEquality().hash(reason),
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResponseModelImplCopyWith<_$ErrorResponseModelImpl> get copyWith =>
      __$$ErrorResponseModelImplCopyWithImpl<_$ErrorResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ErrorResponseModel implements ErrorResponseModel {
  const factory _ErrorResponseModel(
      {final int? httpStatusCode,
      @JsonKey(name: 'name') final String? httpStatusMessage,
      @JsonKey(name: 'error_code') final int? apiErrorCode,
      final dynamic reason,
      final String? message}) = _$ErrorResponseModelImpl;

  factory _ErrorResponseModel.fromJson(Map<String, dynamic> json) =
      _$ErrorResponseModelImpl.fromJson;

  @override
  int? get httpStatusCode;
  @override
  @JsonKey(name: 'name')
  String? get httpStatusMessage;
  @override
  @JsonKey(name: 'error_code')
  int? get apiErrorCode;
  @override
  dynamic get reason;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ErrorResponseModelImplCopyWith<_$ErrorResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
