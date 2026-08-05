import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
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
        title: Text("اختار مكانك", style: AppStyles.bold20Primary),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
        ),
      ),
      body: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),

            loading: () => const Center(child: CircularProgressIndicator()),

            loaded: (location) {
              return Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(location.latitude, location.longitude),
                      zoom: 17,
                    ),

                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,

                    markers: {if (cubit.marker != null) cubit.marker!},

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
                            Text(location.city, style: AppStyles.bold20Primary),

                            verticalSpace(8),

                            Text(
                              location.address,
                              style: AppStyles.semiBold14darkBlue,
                              textAlign: TextAlign.center,
                            ),

                            verticalSpace(16),

                            CustomElevatedButton(
                              text: "اختار المكان",
                              onPressed: () {
                                cubit.confirmLocation(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },

            error: (_) => const Center(child: Text("فيه حاجه غلط")),
          );
        },
      ),
    );
  }
}
