import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   MyButton({Key? key, required this.onTap, required this.text}) : super(key: key);
Function onTap;
String text;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: _width*0.8,
        child: ElevatedButton(
          
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 66, 85, 191),
            ),
          ),
          onPressed: () {
onTap();


          },
          child:  Text(text, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
