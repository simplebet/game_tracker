import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response_model.freezed.dart';
part 'error_response_model.g.dart';

@freezed
class ErrorResponseModel with _$ErrorResponseModel {
  const factory ErrorResponseModel({
    int? httpStatusCode,
    @JsonKey(name: 'name') String? httpStatusMessage,
    @JsonKey(name: 'error_code') int? apiErrorCode,
    @Default(null) dynamic reason,
    String? message,
  }) = _ErrorResponseModel;

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);
}
