import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/icomoon.dart';
import 'package:portfolio/modules/coffee/coffee_controller.dart';
import 'package:portfolio/modules/coffee/coffee_detail_view.dart';
import 'package:portfolio/modules/coffee/coffee_model.dart';

class CoffeeView extends StatelessWidget {

  final CoffeeController _controller = Get.put(CoffeeController());
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: GoogleFonts.prompt().fontFamily),
      child: Scaffold(
        body: GestureDetector(
          onVerticalDragEnd: (DragEndDetails details) => _controller.updateCurrentCoffee(details),
          child: Obx(() => AnimatedContainer(
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: _controller.backgroundGradient.value
                )
              ),
              child: Stack(children: [
                Positioned(
                  bottom: -70,
                  left: 100,
                  right: 100,
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Color(0xff7A4B26),
                      boxShadow: [BoxShadow(
                        spreadRadius: 80,
                        blurRadius: 100,
                        color: Color(0xff7A4B26)
                      )]
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Obx(() => Stack(children: _previewCoffeeList()))
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 25,
                  left: 25,
                  right: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icomoon.chevronLeft, color: _controller.currentCoffee.value == 2 ? Colors.white : Color(0xff26120B)),
                      Icon(Icomoon.shoppingCart, color: _controller.currentCoffee.value == 2 ? Colors.white : Color(0xff26120B))
                    ],
                  )
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  top: _controller.currentCoffee < 3 ? 30 : MediaQuery.of(context).padding.top + 70,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: IgnorePointer(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 250),
                      opacity: _controller.currentCoffee >= 3 ? 1 : 0,
                      child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _controller.titlePageController,
                        itemCount: _controller.coffeeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Coffee _coffee = _controller.coffeeList[index];
                          return AnimatedOpacity(
                            duration: Duration(milliseconds: 250),
                            opacity: _coffee.id == index ? 1 : 0,
                            child: Column(children: [
                              Hero(
                                tag: 'title${_coffee.id}',
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(_coffee.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, height: 1.1), textAlign: TextAlign.center)
                                )
                              ),
                              SizedBox(height: 10),
                              Text(_coffee.price, style: TextStyle(fontSize: 30, height: 1.1, fontWeight: FontWeight.w800),)
                            ]),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _previewCoffeeList() => List<Widget>.generate(_controller.coffeeList.length, (index) {

    _controller.setCoffeeProps();
    Coffee _coffee = _controller.coffeeList[index];
    Map<String, dynamic> props = _controller.coffeeProps[index];

    return AnimatedPositioned(
      top: props['top'],
      right: 0,
      left: 0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: () => Get.to(() => CoffeeDetailView(), arguments: _coffee, transition: Transition.fadeIn, duration: Duration(milliseconds: 500), curve: Curves.easeInOut),
        child: Stack(
          alignment: Alignment.center,
          children: [
            TweenAnimationBuilder(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              tween: props['scale'],
              builder: (BuildContext context, double value, Widget child) => Transform.scale(
                scale: value,
                child: AnimatedOpacity(
                  opacity: props['opacity'],
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: Hero(
                    tag: 'image${_coffee.id}',
                    child: Image.asset('${Constants.imagePath}/coffee/${_coffee.image}')
                  )
                )
              ),
            ),
            if(index == 2) ... [
              Transform.translate(
                offset: Offset(0, 16),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  opacity: _controller.currentCoffee.value == 2 ? 1 : 0,
                  child: Image.asset('${Constants.imagePath}/coffee/logo_fika.png', width: Get.width * 0.55)
                )
              )
            ]
          ]
        ),
      ),
    );
  });
  
}