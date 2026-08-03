
class SignUpResponse {
  final DataSignUpResponse? data;

  SignUpResponse({
    this.data,
  });
}

class DataSignUpResponse {
  final UserSignUpResponse? user;
  final TechnicianProfile? technicianProfile;
  final String? accountState;
  final String? message;

  DataSignUpResponse({
    this.user,
    this.technicianProfile,
    this.accountState,
    this.message,
  });

}

class TechnicianProfile {
  final String? id;
  final String? userId;
  final String? categoryId;
  final String? verificationStatus;
  final bool? isAvailable;
  final String? overallRating;
  final int? totalReviews;
  final String? profileImage;
  final String? createdAt;
  final String? updatedAt;

  TechnicianProfile({
    this.id,
    this.userId,
    this.categoryId,
    this.verificationStatus,
    this.isAvailable,
    this.overallRating,
    this.totalReviews,
    this.profileImage,
    this.createdAt,
    this.updatedAt, required UserId,
  });


}

class UserSignUpResponse {
  final String? id;
  final String? fullName;
  final String? phone;
  final String? role;
  final String? status;
  final String? city;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? createdAt;
  final String? updatedAt;

  UserSignUpResponse({
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