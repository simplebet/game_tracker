// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorResponseModelImpl _$$ErrorResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ErrorResponseModelImpl(
      httpStatusCode: (json['http_status_code'] as num?)?.toInt(),
      httpStatusMessage: json['name'] as String?,
      apiErrorCode: (json['error_code'] as num?)?.toInt(),
      reason: json['reason'] ?? null,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ErrorResponseModelImplToJson(
        _$ErrorResponseModelImpl instance) =>
    <String, dynamic>{
      'http_status_code': instance.httpStatusCode,
      'name': instance.httpStatusMessage,
      'error_code': instance.apiErrorCode,
      'reason': instance.reason,
      'message': instance.message,
    };
