import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Fab extends GetxController {
  final ScrollController controller = ScrollController();
  var fabIsVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      fabIsVisible.value =
          controller.position.userScrollDirection == ScrollDirection.forward;
    });
  }
}
