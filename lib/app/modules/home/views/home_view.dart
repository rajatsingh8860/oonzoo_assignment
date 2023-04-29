import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oonzoo_assignment/app/widgets/carousel.dart';
import 'package:oonzoo_assignment/app/widgets/product_card.dart';

import '../../../widgets/appbar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: appBar(actionRequired: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CarouselWidget(imgList: controller.imgList),
              GridView.count(
                padding: const EdgeInsets.all(15),
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                shrinkWrap: true,
                childAspectRatio: 0.7,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  20,
                  (index) {
                    return ProductCard(
                        imageLink: controller.getImageLink(index));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
