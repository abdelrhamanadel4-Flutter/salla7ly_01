import 'dart:io';

class SignupRequest {
  final String fullName;
  final String city;
  final String address;
  final double latitude;
  final double longitude;
  final String role;

  final String? categoryId;
  final File? nationalId;
  final File? criminalRecordFile;
  final File? profileImage;

  SignupRequest({
    required this.fullName,
    required this.city,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.role,
    this.categoryId,
    this.nationalId,
    this.criminalRecordFile,
    this.profileImage,
  });
}