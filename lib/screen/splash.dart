import 'package:datn/constants/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSplash,
      body: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
  
}