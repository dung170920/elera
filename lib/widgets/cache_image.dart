import 'package:elera/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CacheImage extends StatelessWidget {
  const CacheImage(
      {super.key,
      required this.image,
      this.width = double.maxFinite,
      this.height = double.maxFinite,
      this.borderRadius = 8,
      this.fit = BoxFit.cover});

  final String image;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(image: imageProvider, fit: fit),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          imageNotAvailable,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
