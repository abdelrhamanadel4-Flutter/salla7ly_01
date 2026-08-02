
class VerifyOtpResponse {
  final DataVerifyOtpResponse? data;

  VerifyOtpResponse({
    this.data,
  });
}

class DataVerifyOtpResponse {
  final User? user;
  final bool? isNewUser;
  final String? accountState;
  final String? message;
  final Tokens? tokens;

  DataVerifyOtpResponse({
    this.user,
    this.isNewUser,
    this.accountState,
    this.message,
    this.tokens,
  });

}

class Tokens {
  final String? tokenType;
  final String? accessToken;
  final int? expiresIn;
  final String? refreshToken;
  final int? refreshExpiresIn;

  Tokens({
    this.tokenType,
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
    this.refreshExpiresIn,
  });
}

class User {
  final String? id;
  final dynamic fullName;
  final String? phone;
  final String? role;
  final String? status;
  final dynamic city;
  final dynamic address;
  final dynamic latitude;
  final dynamic longitude;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.id,
    this.fullName,
    this.phone,
    this.role,
    this.status,
    this.city,
    this.address,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
  });
}