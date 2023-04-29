import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;

  const CachedImage({Key? key, required this.imageUrl, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: "$imageUrl",
        fit: BoxFit.cover,
        placeholder: (ctx, url) => Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[350]!,
              child: Container(
                  height: height,
                  width: width,
                  color: Colors.white,
                ),

            ),
        errorWidget: (_, __, ___) => const SizedBox());
  }
}
