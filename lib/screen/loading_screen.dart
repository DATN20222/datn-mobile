import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget{
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bgloading.png"),
            fit: BoxFit.cover,)
        ),
        child: const Center(child:  CircularProgressIndicator(
          color: Color(0xFF5854E2),
          strokeWidth: 4,
        )),
      ),
    );
  }

}