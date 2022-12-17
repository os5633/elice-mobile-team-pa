import 'package:flutter/material.dart';

class PurpleLogoAsset extends StatelessWidget {
  const PurpleLogoAsset({
    this.width = 108,
    this.height,
    Key? key,
  }) : super(key: key);

  final double? width;
  final double? height;

  static const PURPLE_LOGO_PATH = "assets/images/elice_purple_logo.png";

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      PURPLE_LOGO_PATH,
      width: width,
      height: height,
    );
  }
}
