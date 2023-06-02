import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  PersonalInfoScreenState createState() {
    return PersonalInfoScreenState();
  }
}

class PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Container(height: MediaQuery.of(context).size.height),
        Opacity(
          opacity: 0.8,
          child: Container(
              height: 200,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF5955EE), Color(0xFFC76DE8)]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)))),
        ),
        Positioned(
          top: 55,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "Hồ sơ",
                style: GoogleFonts.play(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        const Positioned(
            left: 105,
            top: 100,
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
                child: Text("TS. Đặng Tuấn Linh",
                    style: GoogleFonts.play(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5141C7)))),
              ),
            )),
        Positioned(
            top: 315,
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 20,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Color(0xFFD3D3D3),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(2, 4))
              ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Số điện thoại",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold))),
                        Text("0962548909",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300)))
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold))),
                        Text("linh.dt@hust.edu.vn",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300))),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mã số ",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold))),
                        Text("1",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300))),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ngày sinh ",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold))),
                        Text("09/11/2000",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300))),
                      ]),
                ),
              ]),
            )),
      ]),
    );
  }
}
