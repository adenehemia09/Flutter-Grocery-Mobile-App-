import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/main/page/main_page.dart';

class SplashScrean extends StatefulWidget {
  const SplashScrean({Key? key}) : super(key: key);

  @override
  State<SplashScrean> createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: keyGreenColor,
      body: Stack(
        children: [
          Center(
            child: Text(
              "grocery",
              style: whiteTextStyle.copyWith(
                fontSize: 40,
                fontWeight: bold,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
