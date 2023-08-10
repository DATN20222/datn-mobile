import 'package:datn/controller/add_student_controller.dart';
import 'package:datn/controller/student_detail_controller.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class AddStudent extends GetView<AddStudentController>{
  @override
  Widget build(BuildContext context) {
    AddStudentController controller = Get.find();

    return controller.obx((state) {
      return WillPopScope(
          onWillPop: () async {
            Get.offAndToNamed(Routes.STUDENTS);
            return false;
          },
        child: Scaffold(
          body: Stack(
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
                  child: Container(
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
                  left: 24,
                  child:
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 21,
                                  offset: Offset(3, 4),
                                  color: Color.fromRGBO(111, 131, 231, 0.4)
                              ),
                            ]
                        ),
                        width: 30,
                        height: 30,
                        child: InkWell(onTap: () {
                          Get.offAndToNamed(Routes.STUDENTS);
                        },
                            child: const Icon(Icons.arrow_back_rounded,
                                color: Color(0xFF5141C7), size: 20)),
                      ),


                  ),
                Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: Center(
                    child:  Text(
                        controller.user.value.name,
                        style: GoogleFonts.play(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),

                ),
                // Positioned(
                //     top: 290,
                //     child: SizedBox(
                //       width: MediaQuery
                //           .of(context)
                //           .size
                //           .width,
                //       child: Center(
                //         child: Text(controller.user.value.name,
                //             style: GoogleFonts.play(
                //                 textStyle: const TextStyle(
                //                     fontSize: 28,
                //                     fontWeight: FontWeight.bold,
                //                     // color: Colors.white
                //                     color: Color(0xFF5141EE)
                //                 ))),
                //       ),
                //     )),
                Positioned(
                    top: 60,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 20,
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
                                Text(controller.user.value.phone,
                                    style: GoogleFonts.play(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300)))
                              ]),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 0.0, left: 12, right: 12),
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
                                Text(controller.user.value.email ?? "",
                                    style: GoogleFonts.play(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300))),
                              ]),
                        ),
                        // const Padding(
                        //   padding: EdgeInsets.only(top: 0.0, left: 12, right: 12),
                        //   child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(12.0),
                        //   child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("Mã số ",
                        //             style: GoogleFonts.play(
                        //                 textStyle: const TextStyle(
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.bold))),
                        //         Text(controller.user.value.code.toString(),
                        //             style: GoogleFonts.play(
                        //                 textStyle: const TextStyle(
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w300))),
                        //       ]),
                        // ),
                        const Padding(
                          padding: EdgeInsets.only(top: 0.0, left: 12, right: 12),
                          child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
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
                        const Padding(
                          padding: EdgeInsets.only(top: 0.0, left: 12, right: 12),
                          child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
                        ),
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
                                Text(controller.user.value.role ?? "",
                                    style: GoogleFonts.play(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300)))
                              ]),
                        ),
                      ]),
                    )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xFF5955EE), Color(0xFFC76DE8)
                                ]),
                                borderRadius: BorderRadius.circular(20),

                            ),
                            margin: const EdgeInsets.only(bottom: 32),
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

                              },
                              child: SizedBox(
                                width: (Get.width - 40) / 2,
                                child: Text("Cấp quyền", style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                      fontSize: 14
                                  ),

                                ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                        ),
                        Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                   Color(0xFFC76DE8), Color(0xFF5955EE),
                                ]),
                                borderRadius: BorderRadius.circular(20),

                            ),
                            margin: const EdgeInsets.only(bottom: 32),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                // foregroundColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () async{
                                await controller.deleteUser();
                                Get.offAllNamed(Routes.STUDENTS);
                              },
                              child: SizedBox(
                                width: (Get.width - 40) / 2,
                                child: Text("Xóa", style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                      fontSize: 14
                                  ),
                                ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                        ),
                      ],
                    )
                )
              ])
        ),
      );
    });

  }

}