import 'package:freezed_annotation/freezed_annotation.dart';

part 'foul_details.freezed.dart';
part 'foul_details.g.dart';

@freezed
class FoulDetails with _$FoulDetails {
  const factory FoulDetails({
    @Default(0) int awayTotal,
    @Default(0) int homeTotal,
    @Default(0) int awayTwoMinute,
    @Default(0) int homeTwoMinute,
  }) = _FoulDetails;

  factory FoulDetails.fromJson(Map<String, dynamic> json) =>
      _$FoulDetailsFromJson(json);
}
