import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/icomoon.dart';
import 'package:portfolio/modules/coffee/coffee_detail_controller.dart';
import 'package:portfolio/modules/coffee/coffee_model.dart';

class CoffeeDetailView extends StatelessWidget {

  final Coffee _coffee = Get.arguments;
  final CoffeeDetailController _controller = Get.put(CoffeeDetailController());
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: GoogleFonts.prompt().fontFamily),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icomoon.chevronLeft, color: Color(0xff26120B))
                    ),
                    Icon(Icomoon.shoppingCart, color: Color(0xff26120B))
                  ],
                ),
              ),
              Hero(
                tag: 'title${_coffee.id}',
                child: Material(
                  color: Colors.transparent,
                  child: Text(_coffee.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, height: 1.1), textAlign: TextAlign.center)
                )
              ),
              Container(
                width: Get.width,
                height: 400,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Hero(
                      tag: 'image${_coffee.id}',
                      child: Image.asset('${Constants.imagePath}/coffee/${_coffee.image}', width: _coffee.id == 2 || _coffee.id == 3 ? Get.width * 0.8 : Get.width * 0.5),
                    ),
                    Positioned(
                      top: 30,
                      right: 55,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            color: Color(0xff26120B).withOpacity(0.05)
                          )]
                        ),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(Icomoon.plus, color: Colors.black)
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 50,
                      right: 0,
                      child: TweenAnimationBuilder(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        tween: Tween<Offset>(begin: Offset(-100, 100), end: Offset(0, 0)),
                        child: Text(
                          _coffee.detailPrice,
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.w900,
                            height: 1,
                            color: Colors.white,
                            shadows: [Shadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 20
                            )]
                          )
                        ),
                        builder: (BuildContext context, Offset value, Widget child) => Transform.translate(
                          offset: value,
                          child: child,
                        )
                      ),
                    )
                  ]
                ),
              ),
              SizedBox(height: 30),
              TweenAnimationBuilder(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                tween: Tween<Offset>(begin: Offset(0, 100), end: Offset(0, 0)),
                child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: _controller.sizeSelected.value == 'S' ? 1 : 0.3,
                      child: GestureDetector(
                        onTap: () => _controller.sizeSelected.value = 'S',
                        child: Column(children: [
                          FaIcon(FontAwesomeIcons.mugHot, size: 40, color: _controller.sizeSelected.value == 'S' ? Color(0xffD17418) : Colors.black),
                          Text('S', style: TextStyle(fontSize: 26, color: _controller.sizeSelected.value == 'S' ? Color(0xffD17418) : Colors.black))
                        ]),
                      )
                    ),
                    SizedBox(width: 30),
                    Opacity(
                      opacity: _controller.sizeSelected.value == 'M' ? 1 : 0.3,
                      child: GestureDetector(
                        onTap: () => _controller.sizeSelected.value = 'M',
                        child: Column(children: [
                          FaIcon(FontAwesomeIcons.glassWhiskey, size: 40, color: _controller.sizeSelected.value == 'M' ? Color(0xffD17418) : Colors.black,),
                          Text('M', style: TextStyle(fontSize: 26, color: _controller.sizeSelected.value == 'M' ? Color(0xffD17418) : Colors.black))
                        ]),
                      )
                    ),
                    SizedBox(width: 30),
                    Opacity(
                      opacity: _controller.sizeSelected.value == 'L' ? 1 : 0.3,
                      child: GestureDetector(
                        onTap: () => _controller.sizeSelected.value = 'L',
                        child: Column(children: [
                          FaIcon(FontAwesomeIcons.prescriptionBottle, size: 40, color: _controller.sizeSelected.value == 'L' ? Color(0xffD17418) : Colors.black),
                          Text('L', style: TextStyle(fontSize: 26, color: _controller.sizeSelected.value == 'L' ? Color(0xffD17418) : Colors.black))
                        ]),
                      )
                    ),
                  ]
                )),
                builder: (BuildContext context, Offset value, Widget child) => Transform.translate(
                  offset: value,
                  child: child
                ),
              ),
              SizedBox(height: 25),
              TweenAnimationBuilder(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                tween: Tween<Offset>(begin: Offset(0, 100), end: Offset(0, 0)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: ClipRRect(
                    child: Container(
                      height: 70,
                      color: Colors.white,
                      child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                opacity: _controller.temperatureSelected.value == 1 ? 1 : 0.3,
                                child: TextButton(
                                  onPressed: () => _controller.temperatureSelected.value = 1,
                                  child: Text('Hot / Warm', style: TextStyle(fontSize: 20, color: Colors.black), textAlign: TextAlign.center,),
                                  style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
                                ),
                              ),
                            ),
                            ClipRRect(
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                width: 40,
                                height: 70,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: _controller.temperatureSelected.value == 1 ? 0 : 20, right: _controller.temperatureSelected.value == 1 ? 20 : 0),
                                child: Container(
                                  height: 70,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      offset: Offset(_controller.temperatureSelected.value == 1 ? 10 : -10, 0),
                                      blurRadius: 10,
                                      spreadRadius: -8
                                    )]
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                opacity: _controller.temperatureSelected.value == 2 ? 1 : 0.3,
                                child: TextButton(
                                  onPressed: () => _controller.temperatureSelected.value = 2,
                                  child: Text('Cold / Ice', style: TextStyle(fontSize: 20, color: Colors.black), textAlign: TextAlign.center,),
                                  style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
                                ),
                              ),
                            ),
                          ]
                        ),
                      ),
                    ),
                  ),
                ),
                builder: (BuildContext context, Offset value, Widget child) => Transform.translate(
                  offset: value,
                  child: child
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}