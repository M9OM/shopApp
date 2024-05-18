import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import '../../../../controller/location_controller.dart';
import 'package:geolocator/geolocator.dart';

class MapPreview extends StatelessWidget {
  const MapPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationController>(
        builder: (context, locationController, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: IgnorePointer(
                  child: GoogleMap(
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                          zoom: 18.0, target: locationController.markerPosition)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(
                    color: Color.fromARGB(255, 167, 167, 167),
                  ),
                ),
                title: Text('المنطقة'),
                subtitle: Text('المحج'),
                leading: Icon(Icons.location_on_sharp),
                trailing: Text(
                  'تعديل',
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
_getLocation() async
      {
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        debugPrint('location: ${position.latitude}');
        final coordinates = new Coordinates(position.latitude, position.longitude);
        var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        var first = addresses.first;
        print("${first.featureName} : ${first.addressLine}");
      }
}
