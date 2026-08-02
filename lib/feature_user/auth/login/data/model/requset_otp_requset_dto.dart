import 'package:json_annotation/json_annotation.dart';

part 'requset_otp_requset_dto.g.dart';

@JsonSerializable()
class RequsetOtpRequsetDto {
  @JsonKey(name: 'phone')
  final String? phone;

  RequsetOtpRequsetDto({
    this.phone,
  });

  factory RequsetOtpRequsetDto.fromJson(Map<String, dynamic> json) => _$RequsetOtpRequsetDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RequsetOtpRequsetDtoToJson(this);
}