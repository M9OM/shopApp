import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends ChangeNotifier {
  late LatLng _markerPosition;
  LatLng get markerPosition => _markerPosition;

  void markerSet(LatLng marker) {
    _markerPosition = marker;
    notifyListeners();
  }

  
}
