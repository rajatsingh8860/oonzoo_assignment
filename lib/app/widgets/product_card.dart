import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oonzoo_assignment/app/utils/strings.dart';

import '../routes/app_pages.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.imageLink}) : super(key: key);

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              child: Image.network(
                imageLink,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5, top: 12, bottom: 3),
              child: Text(Strings.heading),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
              child: Text(
                Strings.subHeading,
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
