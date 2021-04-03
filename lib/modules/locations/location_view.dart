import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/modules/locations/location_controller.dart';

class LocationView extends StatelessWidget {

  final LocationController _controller = Get.put(LocationController());
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Color(0xff333333),
          fontFamily: GoogleFonts.poppins().fontFamily
        )
      ),
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            child: Stack(children: [
              Positioned(
                top: 0,
                bottom: 0,
                child: Image.asset('${Constants.imagePath}/locations/background.png')
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: _headerOptions()
                ),
              ),
              SlideTransition(
                position: _controller.sheetTween.animate(_controller.sheetController),
                child: DraggableScrollableSheet(
                  minChildSize: 0.17,
                  maxChildSize: 0.8,
                  initialChildSize: 0.17,
                  builder: (BuildContext context, ScrollController controller) => DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                    ),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () => _controller.toggleSearchSheet(),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Container(
                            height: 4,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(2)
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          controller: controller,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(right: 30, left: 30, bottom: 40, top: 0),
                          children: [
                            Row(children: [
                              FaIcon(FontAwesomeIcons.search, size: 18, color: Colors.black26),
                              SizedBox(width: 20),
                              Flexible(child: TextField(
                                focusNode: _controller.searchFocus,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  hintText: 'Search by address',
                                  hintStyle: TextStyle(fontSize: 14, color: Colors.black26, fontWeight: FontWeight.w600)
                                ),
                              )),
                              Container(
                                height: 45,
                                width: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xff6A8AF1).withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child: IconButton(
                                  onPressed: null,
                                  icon: FaIcon(FontAwesomeIcons.microphone, size: 18, color: Color(0xff6A8AF1),),
                                ),
                              )
                            ])
                          ],
                        )
                      )
                    ]),
                  )
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _headerOptions() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2)
                )]
              ),
              child: IconButton(
                onPressed: () => _controller.toggleSearchSheet(),
                icon: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.black38, size: 20,),
              ),
            )
          ]
        ),
      )
    ]);
  }
  
}