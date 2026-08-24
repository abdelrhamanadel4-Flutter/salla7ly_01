import 'dart:io';

class UpdateProfileRequest {
  final String? fullName;
  final String? city;
  final String? address;
  final double? latitude;
  final double? longitude;
  final File? profileImage;

  const UpdateProfileRequest({
    this.fullName,
    this.city,
    this.address,
    this.latitude,
    this.longitude,
    this.profileImage,
  });

  bool get hasChanges =>
      fullName != null ||
      city != null ||
      address != null ||
      latitude != null ||
      longitude != null ||
      profileImage != null;

  Map<String, dynamic> toJson() => {
    if (fullName != null) 'fullName': fullName,
    if (city != null) 'city': city,
    if (address != null) 'address': address,
    if (latitude != null) 'latitude': latitude,
    if (longitude != null) 'longitude': longitude,
  };
}
