import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Container(height: MediaQuery.of(context).size.height),
          Opacity(
            opacity: 0.8,
            child: Container(
                height: 199,
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
            width: MediaQuery.of(context).size.width,
            left: 0,
            top: 75,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("TS. Đặng Tuấn Linh",
                      style: GoogleFonts.play(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage("assets/lab_background4.png"),
                    backgroundColor: Colors.transparent,
                  )
                ]),
          ),
          Positioned(
            left: 24,
            top: 150,
            child: Container(
              height: 202,
              width: 342,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFD3D3D3),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(2, 4))
                  ],
                  color: Colors.white),
              child: Center(
                child: SizedBox(
                  width: 342,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text("24",
                                    style: GoogleFonts.play(
                                        color: const Color(0xFF6759ED),
                                        textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600))),
                                Text("độ C",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFFA3A3A3))))
                              ]),
                            ),
                            const VerticalDivider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text("24",
                                    style: GoogleFonts.play(
                                        color: const Color(0xFF6759ED),
                                        textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600))),
                                Text("độ C",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFFA3A3A3))))
                              ]),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text("24",
                                    style: GoogleFonts.play(
                                        color: const Color(0xFF6759ED),
                                        textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600))),
                                Text("độ C",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFFA3A3A3))))
                              ]),
                            ),
                            const VerticalDivider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text("24",
                                    style: GoogleFonts.play(
                                        color: const Color(0xFF6759ED),
                                        textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600))),
                                Text("độ C",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFFA3A3A3))))
                              ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 24,
              top: 375,
              child: Text("Rooms",
                  style: GoogleFonts.play(
                      textStyle: const TextStyle(
                          color: Color(0xFF6F83E7),
                          fontWeight: FontWeight.bold,
                          fontSize: 20)))),
          Positioned(
              left: 24,
              top: 410,
              child: InkWell(
                onTap: () {

                },
                child: Container(
                    height: 134,
                    width: 161,
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
                    child: const Center(child: Text("Camera phòng"))),
              )),
          Positioned(
              left: 200,
              top: 410,
              child: Container(
                  height: 134,
                  width: 161,
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
                  child: const Center(child: Text("Camera phòng")))),
        ]),
        bottomNavigationBar: Container(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 12, bottom: 12),
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 25),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF5854E2), Color(0xFFAA44D1)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.home, size: 24, color: Colors.white),
                  Icon(Icons.person, size: 24, color: Colors.white),
                  Icon(Icons.search, size: 24, color: Colors.white)
                ])));
  }
}
