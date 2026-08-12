class ProfileResponse {
  final DataProfileResponse? data;

  ProfileResponse({this.data});
}

class DataProfileResponse {
  final UserProfileResponse? user;
  final TechnicianProfileResponse? technician;
  final String? accountState;
  final String? message;

  DataProfileResponse({this.user, this.technician, this.accountState, this.message});
}

class UserProfileResponse {
  final String? id;
  final String? fullName;
  final int? pointsBalance;

  UserProfileResponse({this.id, this.fullName, this.pointsBalance});
}

class TechnicianProfileResponse {
  final String? profileImage;

  TechnicianProfileResponse({this.profileImage});
}
