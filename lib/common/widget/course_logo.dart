import 'package:cached_network_image/cached_network_image.dart';
import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:flutter/material.dart';

class CourseLogo extends StatelessWidget {
  const CourseLogo({
    Key? key,
    required this.imagePath,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String imagePath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      progressIndicatorBuilder: (context, url, progress) => SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            value: progress.progress,
          )),
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image(
          image: imageProvider,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
      errorWidget: (context, url, error) => const ErrorImageAsset(),
    );
  }
}
