import 'package:datn/controller/camera_door_controller.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CameraDoor extends GetView<CameraDoorDetailController> {
  const CameraDoor({super.key});

  @override
  Widget build(BuildContext context) {
    CameraDoorDetailController controller = Get.find();
    return controller.obx((state) {
      return WillPopScope(
          onWillPop: () async {
            Get.offAndToNamed(Routes.HOME);
            return false;
          },
          child: Scaffold(
              body: Stack(fit: StackFit.expand, children: [
            Positioned(
              // top: 20,
              top: -672,
              left: -240,
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
              left: 0,
              top: 20,
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
                                offset: Offset(3, 4),
                                color: Color.fromRGBO(111, 131, 231, 0.4)),
                          ]),
                      width: 30,
                      height: 30,
                      child: InkWell(
                          onTap: () {
                            if (Get.isPopGestureEnable) {
                              Get.back();
                            } else {
                              Get.offAndToNamed(Routes.HOME);
                            }
                          },
                          child: const Icon(Icons.arrow_back_rounded,
                              color: Color(0xFF5141C7), size: 20)),
                    ),
                    const SizedBox(width: 18),
                    Text(controller.cameraModel.value.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.play(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20))),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70, left: 10, right: 10),
              height: 110,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 0.0, left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("IP: ",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300))),
                        Text(controller.cameraModel.value.ip,
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
                        Text("Room: ",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300))),
                        Text(controller.cameraModel.value.room,
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
            ),
            Positioned(
                top: 160,
                bottom: 5,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
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
                                    'User',
                                    style: GoogleFonts.play(
                                        textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ))),
                        ],
                        rows: List.generate(
                            controller.cameraModel.value.checkIn!.length,
                            (index) => DataRow(cells: [
                                  DataCell(
                                    Text(
                                      DateFormat('dd-MM-yyyy hh:ss').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              controller
                                                  .cameraModel
                                                  .value
                                                  .checkIn![index]
                                                  .timeStamp
                                                  .millisecondsSinceEpoch)),
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              color: Color(0xFF5D51A6))),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      controller.cameraModel.value
                                          .checkIn![index].userId,
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              color: Color(0xFF5D51A6))),
                                    ),
                                  ),
                                ]))),
                  ),
                ))
          ])));
    });
  }
}
