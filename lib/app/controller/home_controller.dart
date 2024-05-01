import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
bool added = true;
void addCart (){
added = !added;
notifyListeners();
}



}