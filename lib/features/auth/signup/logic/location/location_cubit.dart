import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/select_location.dart';

import 'location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  static const _fallbackLocation = LatLng(30.0444, 31.2357);

  LocationCubit() : super(const LocationState.initial());

  GoogleMapController? mapController;

  Marker? marker;

  LatLng? currentLatLng;

  SelectedLocation? selectedLocation;

  Future<void> getCurrentLocation() async {
    emit(const LocationState.loading());

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        await changeLocation(_fallbackLocation);
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await changeLocation(_fallbackLocation);
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      currentLatLng = LatLng(position.latitude, position.longitude);

      marker = Marker(
        markerId: const MarkerId("current_location"),
        position: currentLatLng!,
      );

      selectedLocation = await _locationFromCoordinates(currentLatLng!);

      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(currentLatLng!, 17),
      );

      emit(LocationState.loaded(selectedLocation!));
    } catch (_) {
      await changeLocation(_fallbackLocation);
    }
  }

  Future<void> changeLocation(LatLng latLng) async {
    try {
      currentLatLng = latLng;

      mapController?.animateCamera(CameraUpdate.newLatLng(latLng));

      marker = Marker(
        markerId: const MarkerId("selected_location"),
        position: latLng,
      );

      selectedLocation = await _locationFromCoordinates(latLng);

      emit(LocationState.loaded(selectedLocation!));
    } catch (e) {
      emit(LocationState.error(e.toString()));
    }
  }

  SelectedLocation _buildSelectedLocation(
    Placemark place,
    double latitude,
    double longitude,
  ) {
    final city = place.administrativeArea ?? place.locality ?? "";
    final address = [
      place.name,
      place.street,
      place.subLocality,
      place.locality,
    ].where((e) => e != null && e.isNotEmpty).join(", ");

    return SelectedLocation(
      city: city,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<SelectedLocation> _locationFromCoordinates(LatLng latLng) async {
    try {
      final places = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (places.isNotEmpty) {
        return _buildSelectedLocation(
          places.first,
          latLng.latitude,
          latLng.longitude,
        );
      }
    } catch (_) {
      // Reverse geocoding is optional: keep the map usable if it fails.
    }

    return SelectedLocation(
      city: '',
      address:
          '${latLng.latitude.toStringAsFixed(6)}, ${latLng.longitude.toStringAsFixed(6)}',
      latitude: latLng.latitude,
      longitude: latLng.longitude,
    );
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (currentLatLng != null) {
      controller.animateCamera(CameraUpdate.newLatLngZoom(currentLatLng!, 17));
    }
  }

  void confirmLocation(BuildContext context) {
    if (selectedLocation != null) {
      Navigator.pop(context, selectedLocation);
    }
  }
}
