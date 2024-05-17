import 'package:flutter/material.dart';

class AdressController extends ChangeNotifier {
  String _urlLocation ='';
  String get urlLocation => _urlLocation;


  void urlSet(String url) {
    _urlLocation = url;
  
    notifyListeners();
  }
}
