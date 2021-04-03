import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/modules/coffee/coffee_view.dart';
import 'package:portfolio/modules/home/dashboard_view.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: DashboardView(),
      home: CoffeeView(),
      theme: ThemeData(fontFamily: GoogleFonts.prompt().fontFamily),
    );
  }

}