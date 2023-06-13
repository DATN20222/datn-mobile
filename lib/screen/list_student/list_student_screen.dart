import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListStudentScreen extends StatefulWidget {
  @override
  ListStudentScreenState createState() {
    return ListStudentScreenState();
  }
}

class ListStudentScreenState extends State<ListStudentScreen> {

  @override
  Widget build(BuildContext context) {
    String base64String = "";
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 50,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 21,
                          offset: Offset(3,4),
                          color: Color.fromRGBO(111, 131, 231, 0.4)
                      ),
                      ]
                    ),
                    width: 30,
                    height: 30,
                    child: InkWell(onTap: () {
                      Navigator.pop(context);
                    },
                        child: const Icon(Icons.arrow_back_rounded, color: Color(0xFF5141C7), size: 20)),
                  ),
                  const SizedBox(width: 18),
                  Text("Camera phòng chính",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.play(
                          textStyle: const TextStyle(
                              color: Color(0xFF5141C7),
                              fontWeight: FontWeight.bold,
                              fontSize: 20))),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 120,
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Container(
                width: 161,
                height: 134,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 12,
                      offset: Offset(6,4),
                      color: Color.fromRGBO(111, 131, 231, 0.4)
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("24", style: GoogleFonts.play(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color:Color(0xFF6759ED)
                      )
                    )),
                    Text("độ C", style: GoogleFonts.play(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFFA3A3A3)
                      )
                    ))
                  ]
                )
              ),
              Container(
                  width: 161,
                  height: 134,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 21,
                            offset: Offset(6,4),
                            color: Color.fromRGBO(111, 131, 231, 0.4)
                        )
                      ]
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("75 %", style: GoogleFonts.play(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                color:Color(0xFF6759ED)
                            )
                        )),
                        Text("độ ẩm", style: GoogleFonts.play(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFFA3A3A3)
                            )
                        ))
                      ]
                  )
              ),
            ]),
          ),
          Positioned(
            left: 20,
            top: 268,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Image.memory(base64Decode(base64String),
              fit: BoxFit.fill,
              width: 352,
              height: 192)
            )
          ),
          Positioned(child: Container(

          ))
        ],
      ),
    );
  }
}
