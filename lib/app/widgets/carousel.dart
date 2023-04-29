import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oonzoo_assignment/app/utils/cached_image.dart';
import 'package:oonzoo_assignment/app/widgets/photo_view.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key, required this.imgList}) : super(key: key);
  final List<String> imgList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: imgList
            .map((item) => GestureDetector(
                  onTap: () {
                    Get.to(FullPhotoWidget(imageLink: item));
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: Get.width,
                        child: CachedImage(
                          imageUrl: item,
                          height: 180.0,
                          width: Get.width * 0.80,
                        ),
                      )),
                ))
            .toList(),
        options: CarouselOptions(
          height: 180.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ));
  }
}
