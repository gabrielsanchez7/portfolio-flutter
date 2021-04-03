import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {

  FocusNode searchFocus = FocusNode();
  AnimationController sheetController;
  Tween<Offset> sheetTween = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0));
  
  @override
  void onInit() {
    super.onInit();
    sheetController = AnimationController(vsync: NavigatorState(), duration: Duration(milliseconds: 300));
    searchFocus.addListener(() {});
    toggleSearchSheet();
  }

  @override
  void onClose() {
    super.onClose();
    sheetController.dispose();
  }

  void toggleSearchSheet() {
    if(sheetController.isDismissed) { sheetController.forward(); }
    else if(sheetController.isCompleted) { sheetController.reverse(); }
  }
  
}