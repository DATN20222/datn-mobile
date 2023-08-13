import 'package:datn/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSplash,
      body: Stack(children: [
        SizedBox(height: Get.height,width: Get.width, child: Image.asset("assets/splash.png", fit: BoxFit.cover)),
        Opacity(
          opacity: 0.5,
          child: Container(decoration: const BoxDecoration(
            gradient:LinearGradient(colors: [
              Color(0xFF5754EE),
              Color(0xFFCA6EE8)
            ]
            )
          )),
        ),
        Center(
          child: Image.asset("assets/logo_trang.png", height: 300),
        ),
      ]),
    );
  }
}
