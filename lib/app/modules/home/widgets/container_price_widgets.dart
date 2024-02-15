import 'package:flutter/material.dart';

class ContainerForPrice extends StatelessWidget {
  final double height;
  final double width;

  const ContainerForPrice({
    Key? key,
    this.height = 36,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.black,
        ),
      ),
    );
  }
}
