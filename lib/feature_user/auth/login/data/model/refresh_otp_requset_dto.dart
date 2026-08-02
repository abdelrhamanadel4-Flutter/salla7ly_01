import 'package:json_annotation/json_annotation.dart';

part 'refresh_otp_requset_dto.g.dart';

@JsonSerializable()
class RefreshOtpRequsetDto {
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  RefreshOtpRequsetDto({
    this.refreshToken,
  });

  factory RefreshOtpRequsetDto.fromJson(Map<String, dynamic> json) => _$RefreshOtpRequsetDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshOtpRequsetDtoToJson(this);
}