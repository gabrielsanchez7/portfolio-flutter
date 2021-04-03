import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/modules/mountains/mountain_controller.dart';
import 'package:portfolio/modules/mountains/mountain_detail_view.dart';
import 'package:portfolio/modules/mountains/mountain_model.dart';

class MountainView extends StatelessWidget {

  final MountainController _controller = Get.put(MountainController());
  
  @override
  Widget build(BuildContext context) {

    _controller.setCardProps(context);
    
    return Theme(
      data: ThemeData(fontFamily: GoogleFonts.nunito().fontFamily),
      child: Scaffold(
        body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) => _controller.changeMountain(details, context),
          child: Obx(() => AnimatedContainer(
            duration: Duration(milliseconds: 150),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
                colors: _controller.mountain.value.colors
              )
            ),
            child: SafeArea(
              child: Stack(
                children: List<Widget>.generate(_controller.mountainslist.length, (int index) => _mountainCard(
                  mountain: _controller.mountainslist[index],
                  props: _controller.cardProps[index],
                  index: index,
                  heroTag: 'Mountain${_controller.mountainslist[index].name}',
                  buttonTag: 'Button${_controller.mountainslist[index].name}'
                )).reversed.toList(),
              )
            )
          ))
        ),
      )
    );
  }

  Widget _mountainCard({Mountain mountain, dynamic props, int index, String heroTag, String buttonTag}) {
    return Positioned(
      child: Stack(children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 250),
          bottom: 0,
          left: props['left'],
          top: props['top'],
          child: IgnorePointer(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 250),
              opacity: props['opacity'],
              child: Hero(
                tag: heroTag,
                child: Image.asset('${Constants.imagePath}/mountains/${mountain.images[0]}')
              )
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 250),
          top: props['top'] - 17,
          left: props['leftDot'],
          child: _summitDot(
            active: _controller.current.value == index,
            reversed: index == 2 ? true : false
          )
        ),
        Positioned(
          top: 40,
          left: 25,
          right: 25,
          bottom: 100,
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: AnimatedOpacity(
                  duration: Duration(milliseconds: 250),
                  opacity: index == _controller.current.value ? 1 : 0,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: _mountainName(mountain: mountain, index: index)
                  ),
                )),
                SizedBox(width: 5),
                Expanded(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 250),
                    opacity: index == _controller.current.value ? 1 : 0,
                    child: _mountainDetails(mountain: mountain, index: index, buttonTag: buttonTag)
                  ),
                )
              ]
            )]
          ),
        ),
      ])
    );
  }

  Widget _summitDot({bool active = false, bool reversed = false}) {

    List<Widget> children = [
      Container(
        height: 17,
        width: 17,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
      Container(
        height: 1,
        width: 60,
        color: Colors.white
      ),
      Image.asset('${Constants.imagePath}/mountains/picture.png', width: 35),
    ];
    
    return AnimatedOpacity(
      duration: Duration(milliseconds: 150),
      opacity: active ? 1 : 0,
      child: Row(
        children: !reversed ? children.toList() : children.reversed.toList()
      ),
    );
  }

  Widget _mountainName({Mountain mountain, int index}) {
    Tween<double> tween;
    if(index == _controller.current.value) {
      tween = Tween<double>(begin: 0.5, end: 1);
    }
    else if (index < _controller.current.value) {
      tween = Tween<double>(begin: 1, end: 1.5);
    }
    else {
      tween = Tween<double>(begin: 0.5, end: 0.5);
    }

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300),
      tween: tween,
      curve: Curves.easeInOut,
      builder: (BuildContext context, double value, Widget child) => Transform.scale(
        alignment: Alignment.bottomRight,
        scale: value,
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            mountain.name.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontFamily: GoogleFonts.fredokaOne().fontFamily,
              height: 0.95
            ),
          ),
        ),
      )
    );
  }

  Widget _mountainDetails({Mountain mountain, int index, String buttonTag}) {

    Tween<Offset> tween;
    if(index == _controller.current.value) {
      tween = Tween<Offset>(begin: Offset(-50, 0), end: Offset(0, 0));
    }
    else if (index < _controller.current.value) {
      tween = Tween<Offset>(begin: Offset(0, 0), end: Offset(-50, 0));
    }
    else {
      tween = Tween<Offset>(begin: Offset(50, 0), end: Offset(50, 0));
    }

    Widget _buttonInfo() {

      Tween<Offset> _tween;

      if(index == _controller.current.value) { _tween = Tween<Offset>(begin: Offset(300, 0), end: Offset(27, 0)); }
      else { _tween = Tween<Offset>(begin: Offset(27, 0), end: Offset(300, 0)); }
      
      return TweenAnimationBuilder(
        duration: Duration(milliseconds: 300),
        tween: _tween,
        curve: Curves.easeInOut,
        builder: (BuildContext context, Offset value, Widget child) => Transform.translate(
          offset: value,
          child: Container(
            height: 30,
            child: TextButton(
              onPressed: () => Get.to(MountainDetailView(), arguments: mountain, transition: Transition.fadeIn, duration: Duration(milliseconds: 500), curve: Curves.easeInOut),
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white.withOpacity(0.35)),
                padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
                shape: MaterialStateProperty.resolveWith((states) => BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)))
              ),
              child: Hero(
                tag: buttonTag,
                child: Material(
                  color: Colors.transparent,
                  child: Row(children: [
                    Text('Information'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.8)),
                    SizedBox(width: 3),
                    FaIcon(FontAwesomeIcons.angleDoubleRight, color: Colors.white, size: 11)
                  ]),
                ),
              ),
            ),
          )
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder(
          duration: Duration(milliseconds: 300),
          tween: tween,
          curve: Curves.easeInOut,
          builder: (BuildContext context, Offset value, Widget child) => Transform.translate(
            offset: value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45),
                Text('Elevation', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13)),
                Text('${mountain.elevation.toString()} / Ranked ${mountain.ranked}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                SizedBox(height: 7),
                Text('Coordinates', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13)),
                Text(mountain.coordinates, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                SizedBox(height: 40),
              ],
            ),
          )
        ),
        _buttonInfo()
      ]
    );
  }
}