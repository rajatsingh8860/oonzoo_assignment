import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oonzoo_assignment/app/utils/strings.dart';
import 'package:oonzoo_assignment/app/utils/urls.dart';

PreferredSizeWidget appBar({bool leading = false , bool actionRequired = false}) {
  return AppBar(
    elevation: 0.0,
    leading: leading
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
          )
        : null,
    backgroundColor: Colors.white,
    titleSpacing: 0,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(
          Urls.logo,height: 40,),
    ),
    actions: actionRequired ?  const [
      Icon(
        Icons.shopping_cart_checkout_outlined,
        color: Colors.black,
      ),
      Padding(
        padding: EdgeInsets.only(right: 12.0, left: 8.0),
        child: Center(
            child: Text(
           Strings.cart,
          style: TextStyle(color: Colors.black),
        )),
      )
    ] : null,
  );
}
