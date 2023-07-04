import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomWidget extends StatelessWidget{
  RoomWidget(String name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 80,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFD3D3D3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(2, 4))
            ]),
        child: Center(child: Text("Camera phòng", style: GoogleFonts.play())));
  }

}