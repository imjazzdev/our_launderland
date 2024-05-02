import 'package:flutter/material.dart';

import '../../utils/color_pallete.dart';

class OkeBottomNav extends StatelessWidget {
  final String txt;
  final double margin;

  OkeBottomNav({this.txt = 'OKE', this.margin = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 200,
        child: Text(
          txt,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: margin),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
            color: ColorPallete.colorprimary),
      ),
    );
  }
}
