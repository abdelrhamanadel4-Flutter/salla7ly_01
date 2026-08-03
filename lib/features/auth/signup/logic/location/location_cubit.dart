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
  LocationCubit() : super(const LocationState.initial());

  GoogleMapController? mapController;

  Marker? marker;

  LatLng? currentLatLng;

  SelectedLocation? selectedLocation;

  Future<void> getCurrentLocation() async {
    emit(const LocationState.loading());

    try {
      bool serviceEnabled =
          await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        emit(
          const LocationState.error(
            "Please enable location service",
          ),
        );
        return;
      }

      LocationPermission permission =
          await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          const LocationState.error(
            "Location permission denied",
          ),
        );
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      currentLatLng = LatLng(
        position.latitude,
        position.longitude,
      );

      marker = Marker(
        markerId: const MarkerId("current_location"),
        position: currentLatLng!,
      );

      final places = await placemarkFromCoordinates(
        currentLatLng!.latitude,
        currentLatLng!.longitude,
      );

      final place = places.first;

      selectedLocation = _buildSelectedLocation(
        place,
        currentLatLng!.latitude,
        currentLatLng!.longitude,
      );

      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(
          currentLatLng!,
          17,
        ),
      );

      emit(
        LocationState.loaded(
          selectedLocation!,
        ),
      );
    } catch (e) {
      emit(
        LocationState.error(
          e.toString(),
        ),
      );
    }
  }

  Future<void> changeLocation(
    LatLng latLng,
  ) async {
    try {
      currentLatLng = latLng;

      mapController?.animateCamera(
        CameraUpdate.newLatLng(latLng),
      );

      marker = Marker(
        markerId: const MarkerId("selected_location"),
        position: latLng,
      );

      final places = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      final place = places.first;

      selectedLocation = _buildSelectedLocation(
        place,
        latLng.latitude,
        latLng.longitude,
      );

      emit(
        LocationState.loaded(
          selectedLocation!,
        ),
      );
    } catch (e) {
      emit(
        LocationState.error(
          e.toString(),
        ),
      );
    }
  }

  SelectedLocation _buildSelectedLocation(
    Placemark place,
    double latitude,
    double longitude,
  ) {
final city = place.administrativeArea ??
    place.locality ??
    "";
    final address = [
      place.name,
      place.street,
      place.subLocality,
      place.locality,
    ]
        .where(
          (e) => e != null && e.isNotEmpty,
        )
        .join(", ");

    return SelectedLocation(
      city: city,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
  }

  void onMapCreated(
    GoogleMapController controller,
  ) {
    mapController = controller;
  }

  void confirmLocation(
    BuildContext context,
  ) {
    if (selectedLocation != null) {
      Navigator.pop(
        context,
        selectedLocation,
      );
    }
  }
}