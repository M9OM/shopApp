import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:stylish/view/screens/chekout/address/address_form.dart';
import 'package:stylish/view/screens/chekout/address/components/boutton.dart';

import '../../../../controller/location_controller.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({Key? key}) : super(key: key);

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  late GoogleMapController mapController;
  LatLng markerPosition = const LatLng(0, 0);
  bool isMapInitialized = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, don't continue
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, don't continue
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately
      return;
    }

    // When we reach here, permissions are granted and we can get the location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      markerPosition = LatLng(position.latitude, position.longitude);
      isMapInitialized = true; // Indicate that the map should be updated
    });

    if (mapController != null) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: markerPosition,
            zoom: 18.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عنوان التوصيل'),
      ),
      body: Consumer<LocationController>(
          builder: (context, locationController, child) {
        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onMapCreated: (controller) {
                mapController = controller;
                if (isMapInitialized) {
                  mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: markerPosition,
                        zoom: 18.0,
                      ),
                    ),
                  );
                }
              },
              onCameraMove: (position) {
                setState(() {
                  markerPosition = position.target;
                });
              },
              markers: {
                Marker(
                  markerId: const MarkerId('marker_id'),
                  position: markerPosition,
                  visible: false,
                ),
              },
              initialCameraPosition: CameraPosition(
                target: markerPosition,
                zoom: 18.0,
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_sharp,
                  color: Colors.indigo,
                  size: 40,
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
            Positioned(
              bottom:
                  80, // Adjust this value to move the button higher or lower
              right: 16,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: _getCurrentLocation,
                child: const Icon(
                  Icons.my_location,
                  color: Colors.indigo,
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                child: Column(
                  children: [
                    MyButton(
                      text: 'حفظ العنوان',
                      onTap: () {
                        locationController.markerSet(markerPosition);

                               Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddressForm(),
                          ));
                      },
                    ),
                  ],
                ))
          ],
        );
      }),
    );
  }
}
