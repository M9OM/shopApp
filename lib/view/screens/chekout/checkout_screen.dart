import 'package:flutter/material.dart';
import 'package:stylish/view/screens/main_screen.dart';

import 'address/address_screen.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الدفع'),
        leading: IconButton(onPressed:() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
                (Route<dynamic> route) => false,
              );
        }, icon: Icon(Icons.close)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: IgnorePointer(
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'العنوان'),
                Tab(text: 'المعاينة'),
                Tab(text: 'الدفع'),
              ],
            ),
          ),
        ),
      ),
      body: AddressScreen(),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
