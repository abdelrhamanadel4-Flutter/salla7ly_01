
class RequsetOtpResponse {
  final Data? data;

  RequsetOtpResponse({
    this.data,
  });
}

class Data {
  final String? expiresAt;
  final String? devOtpCode;

  Data({
    this.expiresAt,
    this.devOtpCode,
  });

}