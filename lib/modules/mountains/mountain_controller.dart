import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/mountains/mountain_model.dart';

class MountainController extends GetxController {

  RxInt current = 0.obs;
  List<Mountain> mountainslist = Mountain.defaultList();
  Rx<Mountain> mountain = Mountain().obs;
  List<dynamic> cardProps = [];
  
  @override
  void onInit() {
    super.onInit();
    mountain.value = mountainslist[current.value];
  }

  void setCardProps(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    
    if(current.value == 0) {
      cardProps = [
        {
          'top': screenSize.height * 0.32,
          'left': -(screenSize.width * 0.27),
          'leftDot': screenSize.width * 0.12,
          'opacity': 1.0,
        },
        {
          'top': screenSize.height * 0.37,
          'left': screenSize.width * 0.14,
          'leftDot': screenSize.width * 0.58,
          'opacity': 0.4,
        },
        {
          'top': screenSize.height * 0.42,
          'left': screenSize.width * 0.25,
          'leftDot': screenSize.width * 0.62,
          'opacity': 0.1,
        }
      ];
    }
    else if(current.value == 1) {
      cardProps = [
        {
          'top': screenSize.height * 0.2,
          'left': -(screenSize.width * 0.69),
          'leftDot': -(screenSize.width * 0.15),
          'opacity': 0.0,
        },
        {
          'top': screenSize.height * 0.32,
          'left': -screenSize.width * 0.28,
          'leftDot': screenSize.width * 0.20,
          'opacity': 1.0,
        },
        {
          'top': screenSize.height * 0.37,
          'left': screenSize.width * 0.07,
          'leftDot': screenSize.width * 0.48,
          'opacity': 0.4,
        }
      ];
    }
    else {
      cardProps = [
        {
          'top': screenSize.height * 0.2,
          'left': -(screenSize.width * 0.69),
          'leftDot': -(screenSize.width * 0.15),
          'opacity': 0.0,
        },
        {
          'top': screenSize.height * 0.2,
          'left': -screenSize.width * 0.7,
          'leftDot': -(screenSize.width * 0.1),
          'opacity': 0.0,
        },
        {
          'top': screenSize.height * 0.32,
          'left': -(screenSize.width * 0.25),
          'leftDot': screenSize.width * 0.2,
          'opacity': 1.0,
        }
      ];
    }
  }
  
  void changeMountain(DragEndDetails details, BuildContext context) {
    if(details.primaryVelocity < 0 && current.value < 2) { current.value++; }
    else if(details.primaryVelocity > 0 && current.value > 0) { current.value--; }
    mountain.value = Mountain.defaultList()[current.value];
    setCardProps(context);
  }
  
}