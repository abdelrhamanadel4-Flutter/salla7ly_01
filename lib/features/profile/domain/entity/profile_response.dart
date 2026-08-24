class ProfileResponse {
  final DataProfileResponse? data;

  ProfileResponse({this.data});
}

class DataProfileResponse {
  final UserProfileResponse? user;
  final TechnicianProfileResponse? technician;
  final String? accountState;
  final String? message;

  DataProfileResponse({
    this.user,
    this.technician,
    this.accountState,
    this.message,
  });
}

class UserProfileResponse {
  final String? id;
  final String? fullName;
  final String? phone;
  final String? city;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? profileImage;
  final int? pointsBalance;

  UserProfileResponse({
    this.id,
    this.fullName,
    this.phone,
    this.city,
    this.address,
    this.latitude,
    this.longitude,
    this.profileImage,
    this.pointsBalance,
  });
}

class TechnicianProfileResponse {
  final String? profileImage;
  final String? overallRating;

  TechnicianProfileResponse({this.profileImage, this.overallRating});
}
