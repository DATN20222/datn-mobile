import 'package:datn/controller/home_user_controller.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:datn/screen/list_student/student_detail.dart';
import 'package:datn/screen/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeUserScreen extends GetView<HomeUserController>{
  const HomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeUserController controller = Get.find();

    return controller.obx((state) {
      return Scaffold(
          body: Stack(fit: StackFit.expand, children: [
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
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width - 80,
              left: 40,
              top: 65 / 932 * Get.height,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Chào ${controller.user.value.name}!",
                        style: GoogleFonts.play(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                    InkWell(
                        onTap: () {
                          Get.offAndToNamed(Routes.PERSONAL);
                        },
                        child: AdvancedAvatar(
                          name: controller.user.value.name,
                          // width: 180,
                          // size: 180,
                          style: const TextStyle(
                            // fontSize: 42
                          ),
                          decoration: const BoxDecoration(
                              color: Color(0xFFCCC8FF),
                              shape: BoxShape.circle
                          ),

                        )
                    )
                  ]),
            ),
            Positioned(
              left: 24,
                top: 65 / 932 * Get.height + 50,
                child: Container(
                  height: 180,
                  width: Get.width - 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFD3D3D3),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(2, 4))
                    ]
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 0.0, left: 12, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Phone: ",
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300))),
                            Text(controller.user.value.phone,
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w300)))
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 0.0, left: 12, right: 12),
                        child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 0.0, left: 12, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Email: ",
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300))),
                            Text(controller.user.value.email ?? "",
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w300)))
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 0.0, left: 12, right: 12),
                        child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 0.0, left: 12, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Code: ",
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300))),
                            Text(controller.user.value.code?.toString() ?? "",
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w300)))
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 0.0, left: 12, right: 12),
                        child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 0.0, left: 12, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Birthday: ",
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300))),
                            Text(DateFormat('dd-MM-yyyy').format(controller.user.value.birthday ?? DateTime(2000, 11, 09)) ?? "",
                                style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w300)))
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 0.0, left: 12, right: 12),
                        child: Divider(color: Color(0xFFCCC8FF), thickness: 1),
                      ),
                    ],
                  ),
                )),
            Positioned(
                left: 24,
                top: 135 / 932 * Get.height + 210,
                child: Text("Thời gian chi tiết",
                    style: GoogleFonts.play(
                        textStyle: const TextStyle(
                            color: Color(0xFF6F83E7),
                            fontWeight: FontWeight.bold,
                            fontSize: 18)))),
            Positioned(
              left: 24,
              top: 135 / 932 * Get.height + 235,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  height: Get.height - (135 / 932 * Get.height + 165),
                  width: Get.width - 10,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 21,
                            offset: Offset(6, 4),
                            color: Color.fromRGBO(111, 131, 231, 0.4)),
                      ]),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowHeight: 25,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7)),
                        ),
                        horizontalMargin: 15,
                        headingRowColor:
                        MaterialStateProperty.resolveWith((Set states) {
                          // if (states.contains(MaterialState.hovered)) {
                          //   return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                          // }
                          // return null;  // Use the default value.
                          return const Color(0xFFEAE2FF);
                        }),
                        headingTextStyle: const TextStyle(
                          color: Color(0xFF5955EE),
                        ),
                        columnSpacing: 30,
                        dataRowMinHeight: 15,
                        dataRowMaxHeight: 25,
                        columns: [
                          DataColumn(
                              label: SizedBox(
                                width: 50,
                                child: Text(
                                  'Time',
                                  style: GoogleFonts.play(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )),
                          DataColumn(
                              label: SizedBox(
                                  width: Get.width - 152,
                                  child: Text(
                                    'Camera',
                                    style: GoogleFonts.play(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ))),
                        ],
                        rows: List.generate(
                          controller.user.value.history.length,
                              (index) {
                            var data = controller.user.value.history[index];
                            return DataRow(cells: [
                              // DataCell(
                              //   Text(controller.user.value.code.toString()),
                              // ),
                              DataCell(
                                Text(
                                  DateFormat(DateFormat.HOUR24_MINUTE_SECOND)
                                      .format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          data.timeStamp
                                              .millisecondsSinceEpoch)),
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF5D51A6))),
                                ),
                              ),
                              DataCell(
                                  Text(
                                    data.cameraId,
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF5D51A6))),
                                  ), onTap: () {
                                if (data.position != null) {
                                  final listXY =
                                  controller.parsePosition(data.position!);
                                  Get.dialog(Dialog(
                                    insetPadding: const EdgeInsets.all(10),
                                    backgroundColor: Colors.transparent,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)

                                        ),
                                        height: 350,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text(
                                                  "Chi tiết vị trí",
                                                  style: GoogleFonts.play(
                                                      textStyle:
                                                      const TextStyle(
                                                        color: Color(0xFF5955EE),
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      )),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0,
                                                  left: 12,
                                                  right: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text("UserId: ",
                                                      style: GoogleFonts.play(
                                                          textStyle:
                                                          const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w300))),
                                                  Text(data.userId.toString(),
                                                      style: GoogleFonts.play(
                                                          textStyle:
                                                          const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w300)))
                                                ],
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0,
                                                  left: 12,
                                                  right: 12),
                                              child: Divider(
                                                  color: Color(0xFFCCC8FF),
                                                  thickness: 1),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0,
                                                  left: 12,
                                                  right: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text("Camera: ",
                                                      style: GoogleFonts.play(
                                                          textStyle:
                                                          const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w300))),
                                                  Text(data.cameraId,
                                                      style: GoogleFonts.play(
                                                          textStyle:
                                                          const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w300)))
                                                ],
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0,
                                                  left: 12,
                                                  right: 12),
                                              child: Divider(
                                                  color: Color(0xFFCCC8FF),
                                                  thickness: 1),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0,
                                                  left: 12,
                                                  right: 12),
                                              child:
                                              Text("Hình ảnh minh họa vị trí: ",
                                                  style: GoogleFonts.play(
                                                      textStyle:
                                                      const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight
                                                              .w300))),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: CustomPaint(
                                                painter: RectanglePainter(
                                                    listXY[0],
                                                    listXY[1],
                                                    listXY[2],
                                                    listXY[3]),
                                                child: Container(
                                                  height: 192,
                                                  width: Get.width - 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                      border: Border.all()),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                                }
                              }),
                            ]);
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ])
      );
    }, onLoading: const LoadingScreen());
  }

}