import 'package:datn/controller/add_student_controller.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:datn/widgets/app_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddStudent extends GetView<AddStudentController>{
  @override
  Widget build(BuildContext context) {
    AddStudentController controller = Get.find();
    TextEditingController codeController = TextEditingController();

    return controller.obx((state) {
      return WillPopScope(
          onWillPop: () async {
            Get.offAndToNamed(Routes.STUDENTS);
            return false;
          },
        child: Scaffold(
          body: Stack(
              fit: StackFit.expand,
              children: [
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
                                Text("Tên",
                                    style: GoogleFonts.play(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                                Text(controller.user.value.name,
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
                                Text(DateFormat('dd-MM-yyyy').format(controller.user.value.birthday ?? DateTime(2000, 11, 9)),
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
                        // Padding(
                        //   padding: const EdgeInsets.all(12.0),
                        //   child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("Vai trò",
                        //             style: GoogleFonts.play(
                        //                 textStyle: const TextStyle(
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.bold))),
                        //         // Text(controller.user.value.role ?? "",
                        //         //     style: GoogleFonts.play(
                        //         //         textStyle: const TextStyle(
                        //         //             fontSize: 16,
                        //         //             fontWeight: FontWeight.w300)))
                        //         Obx(
                        //               () => DropdownButton(
                        //               padding: EdgeInsets.zero,
                        //               iconEnabledColor: Color(0xFF5955EE),
                        //               items: controller.dropdownText
                        //                   .map((e) => DropdownMenuItem(
                        //                 value: e,
                        //                 child: Text(e, style:  GoogleFonts.play(
                        //                     textStyle: const TextStyle(
                        //                         fontSize: 14,
                        //                         fontWeight: FontWeight.w300,
                        //                         color: Color(0xFFC4BFEF)
                        //                     )
                        //                 ),),
                        //               ))
                        //                   .toList(),
                        //               onChanged: (newValue) {
                        //                 controller.setSelectedValue(
                        //                     newValue ?? 'USER');
                        //               },
                        //               value:
                        //               controller.selectedDrowpdown.value),
                        //         ),
                        //       ]),
                        // ),
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
                                Get.bottomSheet( Stack(alignment: Alignment.topRight, children: [
                                  SingleChildScrollView(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      margin: const EdgeInsets.only(
                                          bottom: 20, left: 20, right: 20, top: 10),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "UPDATE",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.play(
                                                  textStyle: const TextStyle(
                                                    color: Color(0xFF5955EE),
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            // AppTextField(
                                            //   hintText: 'Phone...',
                                            //   keyboardType: TextInputType.phone,
                                            //   controller: phoneController,
                                            // ),
                                            // const SizedBox(
                                            //   height: 10,
                                            // ),
                                            AppTextField(
                                              hintText: 'Code...',
                                              keyboardType: TextInputType.number,
                                              controller: codeController,
                                            ),
                                            // const SizedBox(
                                            //   height: 10,
                                            // ),
                                            // AppTextField(
                                            //   hintText: 'Password...',
                                            //   keyboardType: TextInputType.visiblePassword,
                                            //   controller: passwordController,
                                            // ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            // AppTextField(
                                            //   hintText: 'Email...',
                                            //   keyboardType: TextInputType.emailAddress,
                                            //   controller: emailController,
                                            // ),
                                            // const SizedBox(
                                            //   height: 10,
                                            // ),
                                            // AppTextField(
                                            //   hintText: 'Code...',
                                            //   keyboardType: TextInputType.number,
                                            //   controller: codeController,
                                            // ),
                                            // const SizedBox(
                                            //   height: 10,
                                            // ),
                                            // AppTextField(
                                            //   hintText: 'Role...',
                                            //   keyboardType: TextInputType.number,
                                            //   controller: roleController,
                                            // ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 0,
                                                bottom: 0,
                                              ),
                                              height: 44.5,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: const Color(0xFFC4BFEF))
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Role...",
                                                    style: GoogleFonts.play(
                                                        textStyle: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w300,
                                                            color: Color(0xFFC4BFEF))),
                                                  ),
                                                  Obx(
                                                        () => DropdownButton(
                                                        padding: EdgeInsets.zero,
                                                        iconEnabledColor: Color(0xFF5955EE),
                                                        items: controller.dropdownText
                                                            .map((e) => DropdownMenuItem(
                                                          value: e,
                                                          child: Text(e, style:  GoogleFonts.play(
                                                              textStyle: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w300,
                                                                  color: Color(0xFFC4BFEF)
                                                              )
                                                          ),),
                                                        ))
                                                            .toList(),
                                                        onChanged: (newValue) {
                                                          controller.setSelectedValue(
                                                              newValue ?? 'USER');
                                                        },
                                                        value:
                                                        controller.selectedDrowpdown.value),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  // signup();
                                                  var result =
                                                  await controller.updateRoleForUser(
                                                      int.parse(codeController.text),
                                                      );
                                                  if (result) {
                                                    Get.offAllNamed(Routes.STUDENTS);
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(10))),
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                      gradient: const LinearGradient(
                                                          begin: Alignment.topLeft,
                                                          end: Alignment.bottomRight,
                                                          colors: [
                                                            Color(0xFF5955EE),
                                                            Color(0xFFC76DE8)
                                                          ]),
                                                      borderRadius:
                                                      BorderRadius.circular(10)),
                                                  child: Container(
                                                    width: 270,
                                                    height: 42,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Cập nhật",
                                                      style: GoogleFonts.robotoMono(
                                                          textStyle: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.bold,
                                                              color: Color(0xFFF4E7CF))),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 30),
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white, shape: BoxShape.circle),
                                    child: InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          color: Color(0xFF704BFD),
                                          size: 30,
                                        )),
                                  )
                                ]),
                                    isScrollControlled: true);
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