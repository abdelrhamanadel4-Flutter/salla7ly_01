import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salla7ly/features/auth/signup/logic/location/location_cubit.dart';
import 'package:salla7ly/features/auth/signup/logic/location/location_state.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<LocationCubit>().getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LocationCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Location"),
        centerTitle: true,
      ),
      body: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),

            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),

            loaded: (location) {
              return Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        location.latitude,
                        location.longitude,
                      ),
                      zoom: 17,
                    ),

                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,

                    markers: {
                      if (cubit.marker != null) cubit.marker!,
                    },

                    onMapCreated: cubit.onMapCreated,

                    onTap: cubit.changeLocation,
                  ),

                  Positioned(
                    bottom: 20,
                    right: 16,
                    left: 16,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              location.city,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              location.address,
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 15),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  cubit.confirmLocation(
                                    context,
                                  );
                                },
                                child: const Text(
                                  "Confirm Location",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },

            error: (_) => const Center(
              child: Text(
                "Something went wrong",
              ),
            ),
          );
        },
      ),
    );
  }
}