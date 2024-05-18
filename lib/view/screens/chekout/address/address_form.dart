import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stylish/controller/location_controller.dart';
import 'package:stylish/models/adress_model.dart';
import 'package:stylish/view/screens/chekout/address/address_screen.dart';
import 'package:stylish/view/screens/chekout/address/components/boutton.dart';
import 'package:stylish/view/screens/chekout/checkout_screen.dart';

import 'mapPreview.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({Key? key}) : super(key: key);

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  late User currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser!;
  }

  void dispose() {
    // Dispose the controllers when the widget is disposed to prevent memory leaks
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationController>(
        builder: (context, locationController, child) {
      return Scaffold(
        body: ListView(
          children: [
            const MapPreview(),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _nameController, // Assign controller to TextField
                decoration: const InputDecoration(
                  labelText: 'الاسم', // Change label to labelText
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _phoneController, // Assign controller to TextField
                decoration: const InputDecoration(
                  labelText: 'رقم الهاتف', // Change label to labelText
                ),
              ),
            ),
            MyButton(
              text: 'حفظ العنوان',
              onTap: () async{
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );

var latitude = locationController.markerPosition.latitude;
var longitude = locationController.markerPosition.longitude;

    var urlLocation = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

                AddressModel address = AddressModel(
                  uid: currentUser.uid,
                  phoneNumber: _phoneController.text,
                  locationUrl: urlLocation,
                  name: _nameController.text,
                  location: locationController.markerPosition,
                );

sendAddressToFirestore(address);

              },
            )
          ],
        ),
      );
    });
  }

  Future<void> sendAddressToFirestore(AddressModel address) async {
    final firestore = FirebaseFirestore.instance;

    try {
      await firestore
          .collection('Address').add(address.toFirestore());
      print('Address added/updated successfully');
    } catch (e) {
      print('Error adding/updating address: $e');
    }
  }
}
