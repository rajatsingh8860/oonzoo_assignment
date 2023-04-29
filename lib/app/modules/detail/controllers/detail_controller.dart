import 'package:get/get.dart';

class DetailController extends GetxController {
  final List<String> imgList = [
    'https://cdn.fcglcdn.com/brainbees/images/products/438x531/11293030a.jpg',
    'https://cdn.fcglcdn.com/brainbees/images/products/438x531/11293030e.jpg',
    'https://cdn.fcglcdn.com/brainbees/images/products/438x531/11293030h.jpg',
    'https://cdn.fcglcdn.com/brainbees/images/products/438x531/11293030d.jpg',
  ];

  RxInt selectIndex = 0.obs;
  RxString size = "4-5 Y".obs;
  List<String> sizeList = [
    "4-5 Y",
    "5-6 Y",
    "6-7 Y",
    "7-8 Y",
    "8-9 Y",
    "9-10 Y",
    "10-12 Y"
  ];
  RxBool lengthInCm = true.obs;
  double cmToInch = 0.393701;

  void setSize(int index) {
    selectIndex.value = index;
  }

  void setLength({required int index}) {
    lengthInCm.value = index == 0 ? false : true;
  }

  String getClothDimensions() {
    double length = 81.5;
    return lengthInCm.value
        ? length.toString()
        : (length * cmToInch).toStringAsFixed(2);
  }
}
