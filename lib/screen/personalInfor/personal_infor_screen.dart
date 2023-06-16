import 'package:datn/controller/personal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  PersonalInfoScreenState createState() {
    return PersonalInfoScreenState();
  }
}

class PersonalInfoScreenState extends State<PersonalInfoScreen> {
  PersonalController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
            fit: StackFit.expand,
            // clipBehavior: Clip.none,
          // fit: StackFit.passthrough,
          // clipBehavior : Clip.hardEdge,
            children: [
          // Container(height: MediaQuery.of(context).size.height),
          Positioned(
            // top: 20,
            top: -642,
            left: -229,
            // left: 30,
            // alignment: const Alignment(0.1, 0.1),
            child:  Container(
                  height: 844,
                  width: 844,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF5955EE), Color(0xFFC76DE8)]),
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.only(
                      //     bottomLeft: Radius.circular(100),
                      //     bottomRight: Radius.circular(100))
                  ),
              // child: Text("hjsjs")
            ),

          ),
          Positioned(
            top: 60,
            left: 24,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 12,
                          offset: Offset(4,8),
                          color: Color(0xFFA3A3A3)
                        )
                      ]
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF5955EE),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100
                ),
                   Text(
                      "Hồ sơ",
                      style: GoogleFonts.play(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),


              ],
            ),
          ),
          const Positioned(
              left: 105,
              top: 96,
              child: CircleAvatar(
                radius: 90.0,
                backgroundImage: AssetImage("assets/lab_background4.png"),
                backgroundColor: Colors.transparent,
              )),
          Positioned(
              top: 290,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(controller.name.value,
                      style: GoogleFonts.play(
                          textStyle: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              // color: Colors.white
                              color: Color(0xFF5141EE)
                              ))),
                ),
              )),
          Positioned(
              top: 385,
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFD3D3D3),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(2, 4))
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Số điện thoại",
                              style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          Text(controller.phone.value,
                              style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w300)))
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email",
                              style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          Text(controller.email.value,
                              style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300))),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mã số ",
                              style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          Text("1",
                              style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300))),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ngày sinh ",
                              style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          Text("09/11/2000",
                              style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300))),
                        ]),
                  ),
                ]),
              )),
        ]),
    );
  }
}
