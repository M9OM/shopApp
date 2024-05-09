import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             SizedBox(
              height: 350,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Positioned(
                    top: -80,
                    right: 250,
                    child: Container(
                      width: 400,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent.withOpacity(0.1),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 250,
                    child: Container(
                      width: 400,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent.withOpacity(0.1),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    child: FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        child: Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: const Center(
                            child: Text(
                              "زاد",
                              style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            );
  }
}