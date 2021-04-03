import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CoffeeDetailController extends GetxController {

  RxString sizeSelected = 'M'.obs;
  RxInt temperatureSelected = 1.obs;
  RxBool startAnimate = false.obs;

  @override
  void onInit() {
    super.onInit();
    startAnimate.value = true;
  }
  
}