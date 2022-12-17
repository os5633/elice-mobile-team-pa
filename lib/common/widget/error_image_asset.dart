import 'package:flutter/material.dart';

class ErrorImageAsset extends StatelessWidget {
  const ErrorImageAsset({
    Key? key,
    this.width = 44,
    this.height = 44,
  }) : super(key: key);

  final double width;
  final double height;

  static const ERROR_IMAGE_PATH = "assets/images/error.png";

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ERROR_IMAGE_PATH,
      width: width,
      height: height,
    );
  }
}
