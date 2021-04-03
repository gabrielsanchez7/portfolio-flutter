import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/modules/mountains/mountain_model.dart';

class MountainDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Mountain _mountain = Get.arguments;
    
    return Theme(
      data: ThemeData(fontFamily: GoogleFonts.nunito().fontFamily),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.centerLeft,
              colors: _mountain.colors
            )
          ),
          child: Stack(children: [
            Stack(children: [
              Positioned(
                top: 40 + MediaQuery.of(context).padding.top,
                left: 25,
                right: Get.width * 0.5 + 20,
                child: Text(_mountain.name.toUpperCase(), style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontFamily: GoogleFonts.fredokaOne().fontFamily,
                  height: 0.95
                ))
              )
            ]),
            Positioned(
              top: 0,
              left: 25,
              right: 25,
              bottom: 30,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 200, bottom: 160),
                child: Column(children: List<Widget>.generate(_mountain.information.split('\n').length, (index) {
                  String _text = _mountain.information.split('\n')[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: Text(_text, style: TextStyle(color: Colors.white, fontSize: 17)),
                  );
                })),
              ),
            ),
            Positioned(
              right: 0,
              top: 230,
              child: Transform.translate(
                offset: Offset(140, 0),
                child: Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Hero(
                    tag: 'Button${_mountain.name}',
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
              ),
            ),
            Positioned(
              top: 40,
              right: 25,
              child: SafeArea(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: FaIcon(FontAwesomeIcons.times, color: Colors.white, size: 18),
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.75,
              right: 0,
              left: 0,
              child: Hero(
                tag: 'Mountain${_mountain.name}',
                child: Image.asset('${Constants.imagePath}/mountains/${_mountain.images[0]}')
              ),
            )
          ]),
        ),
      ),
    );
  }
}