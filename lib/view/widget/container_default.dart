import 'package:flutter/material.dart';

import '../../utils/color_pallete.dart';

class ContainerDefault extends StatelessWidget {
  Widget child;
  double height;
  double padding;
  Alignment alignment;

  ContainerDefault(
      {required this.child,
      this.height = 70,
      this.padding = 20,
      this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: padding, right: padding, top: 10, bottom: 10),
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      height: height,
      child: child,
      decoration: BoxDecoration(
          // border: Border.all(),
          color: ColorPallete.colorprimary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
