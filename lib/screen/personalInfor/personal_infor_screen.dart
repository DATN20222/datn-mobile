import 'package:datn/controller/personal_controller.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_avatar/random_avatar.dart';

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
            top: -682,
            left: -244,
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
            top: 30,
            left: 0,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
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
                    Get.offAndToNamed(Routes.HOME);
                  },
                      child: const Icon(Icons.arrow_back_rounded, color: Color(0xFF5141C7), size: 20)),
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
          Positioned(
              // left: Get.width/2 -90,
              top: 60,
              left: 0,
              child: SizedBox(
                width: Get.width,
                child: Center(
                  child: AdvancedAvatar(
                      name: controller.name.value,
                    // width: 180,
                    size: 150,
                    style: const TextStyle(
                      fontSize: 42
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFCCC8FF),
                      shape: BoxShape.circle
                    ),

                  ),
                ),
              )
              ),
          Positioned(
              top: 220,
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
              top: 260,
              left: 10,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  // margin: const EdgeInsets.all(10),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 0.0, left:12, right: 12),
                      child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 0.0, left:12, right: 12),
                      child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
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
                            Text(controller.code.value.toString(),
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300))),
                          ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 0.0, left:12, right: 12),
                      child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text("Ngày sinh ",
                    //             style: GoogleFonts.play(
                    //                 textStyle: const TextStyle(
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.bold))),
                    //         Text(controller.name.value,
                    //             style: GoogleFonts.play(
                    //                 textStyle: const TextStyle(
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.w300))),
                    //       ]),
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 0.0, left:12, right: 12),
                    //   child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Vai trò",
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                            Text(controller.role.value,
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w300)))
                          ]),
                    ),
                  ]),
                ),
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration:  BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFF5955EE), Color(0xFFC76DE8)
                    ]),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  margin: const EdgeInsets.only(bottom:22),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                        // foregroundColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                    ),
                      onPressed: () {
                    GetStorage().remove("token");
                    Get.offAndToNamed(Routes.LOGIN);
                  },
                  child:  SizedBox(
                    width: Get.width - 20,
                    child: Text("Đăng xuất", style: GoogleFonts.play(
                              textStyle: const TextStyle(
                                fontSize: 14
                              ),

                            ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  )
                )
              )
        ]),
        // bottomNavigationBar: Container(
        //     padding:
        //     const EdgeInsets.only(left: 40, right: 40, top: 12, bottom: 12),
        //     margin:
        //     const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 25),
        //     decoration: const BoxDecoration(
        //         gradient: LinearGradient(
        //             colors: [Color(0xFF5854E2), Color(0xFFAA44D1)],
        //             begin: Alignment.topCenter,
        //             end: Alignment.bottomCenter),
        //         borderRadius: BorderRadius.all(Radius.circular(16))),
        //     child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           InkWell(child: const Icon(Icons.home, size: 24, color: Colors.white), onTap: (){
        //             Get.toNamed(Routes.HOME);
        //           }),
        //           InkWell(child: const Icon(Icons.person, size: 24, color: Colors.white), onTap: (){
        //             Get.toNamed(Routes.PERSONAL);
        //           }),
        //           InkWell(child: const Icon(Icons.search, size: 24, color: Colors.white), onTap: (){
        //
        //           }),
        //           InkWell(child: const Icon(Icons.list, size: 24, color: Colors.white), onTap: (){
        //
        //           })
        //         ]))
    );
  }
}
