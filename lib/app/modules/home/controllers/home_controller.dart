import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<String> imgList = [
    'https://cdn.fcglcdn.com/brainbees/banners/merchf_roi_hp_great-styles_28_04_20231682706637946.jpg',
    'https://cdn.fcglcdn.com/brainbees/banners/hp_mktg_p01_weekend_sale_super_apr23_desktop1680847482080.jpg',
    'https://cdn.fcglcdn.com/brainbees/banners/hp_dp_mamypoko_f45_feb_994x3991677649268929.jpg',
    'https://cdn.fcglcdn.com/brainbees/banners/hp_mktg_p01_flat40_apr23_desktop1680593765228.jpg',
    'https://cdn.fcglcdn.com/brainbees/banners/babyteething-tracker_hp_desktop_1682587459896.jpg'
  ];

  String getImageLink(int index) {
    return (index % 2 == 0)
        ? "https://cdn.fcglcdn.com/brainbees/images/boutique/670x670/29724.jpg"
        : "https://cdn.fcglcdn.com/brainbees/images/boutique/670x670/29719.jpg";
  }
}
