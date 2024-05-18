import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressModel {
  final String uid;
  final String phoneNumber;
  final String name;
  final String locationUrl;
  final LatLng location;

  AddressModel({
    required this.uid,
    required this.phoneNumber,
    required this.locationUrl,
    required this.name,
    required this.location,
  });

  factory AddressModel.fromFirestore(Map<String, dynamic> data) {
    return AddressModel(
      uid: data['uid'],
      phoneNumber: data['phoneNumber'] ?? '',
      name: data['name'],
      locationUrl: data['locationUrl'] ?? '',
      location: LatLng(data['location'].latitude, data['location'].longitude),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "locationUrl": locationUrl,
      'phoneNumber': phoneNumber,
      'name': name,
      'location': GeoPoint(location.latitude, location.longitude),
      'uid': uid,
    };
  }
}
