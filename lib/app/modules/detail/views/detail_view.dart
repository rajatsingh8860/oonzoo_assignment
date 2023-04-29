import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oonzoo_assignment/app/utils/strings.dart';
import 'package:oonzoo_assignment/app/utils/urls.dart';
import 'package:oonzoo_assignment/app/widgets/appbar.dart';
import 'package:oonzoo_assignment/app/widgets/carousel.dart';

import '../../../widgets/custom_button.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(leading: true),
        bottomSheet: bottomSheetWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CarouselWidget(imgList: controller.imgList),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  Strings.holaBonita,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    Strings.productId,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      const Text(
                        Strings.price,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        children: [
                          const Text(
                            Strings.discountPrice,
                          ),
                          Positioned(
                              right: 0,
                              bottom: 7,
                              child: Container(
                                  height: 2, width: 65, color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        Strings.off,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      const Text(
                        Strings.size,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 7,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      controller.setSize(index);
                                    },
                                    child: Container(
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: controller
                                                      .selectIndex.value ==
                                                  index
                                              ? Border.all(
                                                  color: Colors.black,
                                                  width: 2.0)
                                              : Border.all(color: Colors.grey)),
                                      alignment: Alignment.center,
                                      child: Text(controller.sizeList[index]),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    Strings.materialAndCare,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: const [
                      Text(Strings.productMaterial),
                      SizedBox(
                        width: 10,
                      ),
                      Text(Strings.cotton),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Obx(
                    () => Row(
                      children: [
                        const Text(
                          Strings.sizeAndFit,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            controller.setLength(index: 0);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey),
                                color: !controller.lengthInCm.value
                                    ? Colors.black54
                                    : Colors.white),
                            alignment: Alignment.center,
                            child: Text(
                              Strings.inches,
                              style: TextStyle(
                                  color: !controller.lengthInCm.value
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.setLength(index: 1);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey),
                                color: controller.lengthInCm.value
                                    ? Colors.black54
                                    : Colors.white),
                            alignment: Alignment.center,
                            child: Text(
                              Strings.cm,
                              style: TextStyle(
                                  color: controller.lengthInCm.value
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => sizeAndFitTile(
                      title: Strings.age,
                      value: controller.sizeList[controller.selectIndex.value]),
                ),
                Obx(
                  () => sizeAndFitTile(
                      title: Strings.length,
                      value: controller.getClothDimensions()),
                ),
                Obx(
                  () => sizeAndFitTile(
                      title: Strings.shoulder,
                      value: controller.getClothDimensions()),
                ),
                Obx(
                  () => sizeAndFitTile(
                      title: Strings.chest,
                      value: controller.getClothDimensions()),
                ),
                productDescriptionTile(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                  child: Text(
                    Strings.brandInformation,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                brandTile(),
                SizedBox(
                  height: Get.height * 0.10,
                )
              ],
            ),
          ),
        ));
  }

  Widget sizeAndFitTile({required String title, required String value}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
        ),
        const Divider(
          height: 2,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget productDescriptionTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            Strings.productDescription,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          Text(Strings.brand),
          SizedBox(
            height: 4,
          ),
          Text(Strings.type),
          SizedBox(
            height: 4,
          ),
          Text(Strings.fabric),
          SizedBox(
            height: 4,
          ),
          Text(Strings.sleeves),
          SizedBox(
            height: 4,
          ),
          Text(Strings.neck)
        ],
      ),
    );
  }

  Widget brandTile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              image: const DecorationImage(
                  image: NetworkImage(Urls.brand), fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Text(
            Strings.brandDescription,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Widget bottomSheetWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: const [
          Expanded(
            child: CustomButton(
                buttonText: Strings.addToCart,
                buttonColor: Colors.deepOrangeAccent,
                textColor: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: CustomButton(
              buttonText: Strings.shortList,
              buttonColor: Colors.white,
              textColor: Colors.black,
              icon: Icon(
                Icons.favorite_outline,
              ),
              borderColor: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
