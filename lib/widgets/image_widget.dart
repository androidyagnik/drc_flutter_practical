import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget getNetworkImage(String url, double width, double height,
    {BoxFit fit = BoxFit.fill}) {
  // return Image.network(url, fit: fit);

  return CachedNetworkImage(
    imageUrl: url,
    fit: fit,
    height: height,
    width: width,
    progressIndicatorBuilder: (context, url, downloadProgress) => Container(
      child: CircularProgressIndicator(
        value: downloadProgress.progress,
      ),
      width: width,
      height: height,
      alignment: Alignment.center,
    ),
    errorWidget: (context, url, error) => Container(
      width: width,
      height: height,
      color: Colors.grey,
    ),
  );
}
