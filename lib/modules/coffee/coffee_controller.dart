import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/coffee/coffee_model.dart';

class CoffeeController extends GetxController {

  List<Coffee> coffeeList = Coffee.defaultList();
  RxList<Color> backgroundGradient = [].cast<Color>().obs;
  RxInt currentCoffee = 2.obs;
  PageController titlePageController;
  List<Map<String, dynamic>> coffeeProps = [];

  @override
  void onInit() {
    super.onInit();
    backgroundGradient.value = [Color(0xff7A4B26), Colors.white];
    titlePageController = PageController(initialPage: 3);
  }

  @override
  void onClose() {
    super.onClose();
    titlePageController.dispose();
  }

  void setCoffeeProps() {    
    if(currentCoffee.value == 2) {
      coffeeProps = [
        { 'top': Get.height - Get.height - 40, 'opacity': 1.0, 'scale': Tween<double>(begin: 0.45, end: 0.45)},
        { 'top': Get.height * 0.18, 'opacity': 1.0, 'scale': Tween<double>(begin: 0.76, end: 0.76)},
        { 'top': Get.height * 0.46, 'opacity': 1.0, 'scale': Tween<double>(begin: 1.45, end: 1.45)},
        { 'top': Get.height, 'opacity': 1.0, 'scale': Tween<double>(begin: 1.82, end: 1.82)},
        { 'top': Get.height, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 1)},
        { 'top': Get.height, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 1)},
      ];
    }
    else if(currentCoffee.value == 3) {
      coffeeProps = [
        { 'top': 0.0, 'opacity': 0.0, 'scale': Tween<double>(begin: 0.2, end: 0.2) },
        { 'top': Get.height - Get.height + 74, 'opacity': 1.0, 'scale': Tween<double>(begin: 0.3, end: 0.3) },
        { 'top': Get.height * 0.28, 'opacity': 1.0, 'scale': Tween<double>(begin: 0.75, end: 0.75) },
        { 'top': Get.height * 0.47, 'opacity': 1.0, 'scale': Tween<double>(begin: 1.12, end: 1.12) },
        { 'top': Get.height, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 1) },
        { 'top': Get.height, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 1) },
      ];
    }
    else if(currentCoffee.value == 4) {
      coffeeProps = [
        { 'top': 0.0, 'opacity': 0.0, 'scale': Tween<double>(begin: 1, end: 0.2) },
        { 'top': Get.height * 0.05, 'opacity': 0.0, 'scale': Tween<double>(begin: 1, end: 0.1) },
        { 'top': Get.height * 0.17, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 0.35) },
        { 'top': Get.height * 0.25, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 0.57) },
        { 'top': Get.height * 0.34, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 0.7) },
        { 'top': Get.height, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 1) },
      ];
    }
    else if(currentCoffee.value == 5) {
      coffeeProps = [
        { 'top': 0.0, 'opacity': 0.0, 'scale': Tween<double>(begin: 1, end: 0.2) },
        { 'top': Get.height * 0.05, 'opacity': 0.0, 'scale': Tween<double>(begin: 1, end: 0.1) },
        { 'top': Get.height * 0.17, 'opacity': 0.0, 'scale': Tween<double>(begin: 1, end: 0.3) },
        { 'top': Get.height * 0.15, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 0.35) },
        { 'top': Get.height * 0.16, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 0.5) },
        { 'top': Get.height * 0.28, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 0.7) },
      ];
    }
    else {
      coffeeProps = [
        { 'top': 0.0, 'opacity': 0.0, 'scale': Tween<double>(begin: 1, end: 0.2) },
        { 'top': Get.height * 0.05, 'opacity': 0.0, 'scale': Tween<double>(begin: 1, end: 0.1) },
        { 'top': Get.height * 0.17, 'opacity': 0.0, 'scale': Tween<double>(begin: 1, end: 0.3) },
        { 'top': Get.height * 0.15, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 0.35) },
        { 'top': Get.height * 0.16, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 0.5) },
        { 'top': Get.height * 0.28, 'opacity': 1.0, 'scale': Tween<double>(begin: 1, end: 0.7) },
      ];
    }
  }

  void updateCurrentCoffee(DragEndDetails details) {
    if(details.primaryVelocity < 0 && currentCoffee.value < 5) { currentCoffee.value++; }
    else if(details.primaryVelocity > 0 && currentCoffee.value > 2) { currentCoffee.value--; }
    
    if(currentCoffee.value != 2) { backgroundGradient.value = [Colors.white, Colors.white]; }
    else { backgroundGradient.value = [Color(0xff7A4B26), Colors.white]; }

    int page = currentCoffee.toInt();
    if(page <= 2) { page = 3; }
    titlePageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    
    setCoffeeProps();
  }
  
}