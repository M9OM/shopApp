import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stylish/view/screens/chekout/address/components/boutton.dart';

import 'mapPreview.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({Key? key}) : super(key: key);

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed to prevent memory leaks
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          // const MyButton()
        ],
      ),
    );
  }
}
