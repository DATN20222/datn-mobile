import 'package:datn/controller/home_controller.dart';
import 'package:datn/models/camera.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:datn/screen/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();

    return homeController.obx((state) {
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
                    Text("Chào ${homeController.name.value}!",
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
                        name: controller.name.value,
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
              left: 12,
              top: 135 / 932 * Get.height,
              child: Container(
                height: 138 ,
                width: Get.width - 20,
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
                    width: Get.width - 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Column(children: [
                                    Text(controller.averageTemp.value.toStringAsFixed(2),
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
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Column(children: [
                                    Text("${controller.averageHud.value.toStringAsFixed(2)} %",
                                        style: GoogleFonts.play(
                                            color: const Color(0xFF6759ED),
                                            textStyle: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600))),
                                    Text("độ ẩm",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFFA3A3A3))))
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Column(children: [
                                    Text(
                                        homeController.listCamera?.length
                                                .toString() ??
                                            "0",
                                        style: GoogleFonts.play(
                                            color: const Color(0xFF6759ED),
                                            textStyle: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600))),
                                    Text("camera",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFFA3A3A3))))
                                  ]),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Column(children: [
                                    Text(
                                      controller.averagePpm.value.toStringAsFixed(2),
                                        style: GoogleFonts.play(
                                            color: const Color(0xFF6759ED),
                                            textStyle: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600))),
                                    Text("ppm",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFFA3A3A3))))
                                  ]),
                                ),
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
                top: 135 / 932 * Get.height + 145,
                child: Text("Cameras",
                    style: GoogleFonts.play(
                        textStyle: const TextStyle(
                            color: Color(0xFF6F83E7),
                            fontWeight: FontWeight.bold,
                            fontSize: 18)))),
            // Positioned(
            //     left: 24,
            //     top: 410,
            //     child: InkWell(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => ListStudentScreen()),
            //         );
            //       },
            //       child: Container(
            //           height: 60,
            //           width: 180,
            //           decoration: const BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.all(
            //                   Radius.circular(15)),
            //               boxShadow: [
            //                 BoxShadow(
            //                     color: Color(0xFFD3D3D3),
            //                     spreadRadius: 1,
            //                     blurRadius: 7,
            //                     offset: Offset(2, 4))
            //               ]),
            //           child: Center(child: Text(
            //               homeController.listCamera?.length.toString() ??
            //                   "", style: GoogleFonts.play()))),
            //     )),
            // Positioned(
            //     left: 200,
            //     top: 410,
            //     child: Container(
            //         height: 60,
            //         width: 180,
            //         decoration: const BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.all(Radius.circular(15)),
            //             boxShadow: [
            //               BoxShadow(
            //                   color: Color(0xFFD3D3D3),
            //                   spreadRadius: 1,
            //                   blurRadius: 7,
            //                   offset: Offset(2, 4))
            //             ]),
            //         child: Center(child: Text(
            //             "Camera phòng", style: GoogleFonts.play())))),
            if (homeController.listCamera != null &&
                homeController.listCamera!.isNotEmpty)
              Positioned(
                  top: 135 / 932 * Get.height + 156,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                      width: Get.width,
                      height: 90,
                      margin: const EdgeInsets.all(4),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.listCamera?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return UnconstrainedBox(
                            child: SizedBox(
                              height: 60,
                              child: InkWell(
                                onTap: () {
                                  Get.offAndToNamed("${Routes.CAMERADETAIL}/${homeController.listCamera?[index].ip}");
                                },
                                child: Container(
                                    width: 200,
                                    margin:
                                        const EdgeInsets.only(right: 12, left: 4),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(15)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xFFD3D3D3),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(2, 4))
                                        ]
                            ),
                                    child: Center(
                                        child: Text(
                                            homeController.listCamera?[index].name
                                                    .toString() ??
                                                "",
                                            style: GoogleFonts.play(
                                              fontSize: 14
                                            )))),
                              ),
                            ),
                          );
                        },
                      ))),
            Positioned(
                top:  135 / 932 * Get.height + 252,
                left: 20,
                child: Text("Số lượng người",
                    style: GoogleFonts.play(
                        textStyle: const TextStyle(
                            color: Color(0xFF6F83E7),
                            fontWeight: FontWeight.bold,
                            fontSize: 18)))),
            Positioned(
                top:  135 / 932 * Get.height + 282,
                left: 20,
                child: Container(
                  height: 200,
                  width: Get.width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFD3D3D3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(2, 4))
                    ]
                  ),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series:[
                      BarSeries<CameraModel, String>(
                          dataSource: controller.listRoomCamera?.value ?? <CameraModel>[],
                          xValueMapper: (CameraModel data, index) => data.name,
                          yValueMapper: (CameraModel data, index) => data.count,
                          // Width of the bars
                          width: 0.6,
                          color: const Color(0xFF6F83E7),
                          // Spacing between the bars
                          spacing: 0.3,
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          dataLabelSettings: const DataLabelSettings(isVisible: true)
                      )
                    ]
      // SfSparkBarChart.custom(
      // color: const Color(0xFF6F83E7),
      // axisLineColor: const Color(0xFF6F83E7),
      // dataCount: count.length,
      // borderWidth: 4,
      // xValueMapper: (int index) => count[index]["cam"],
      // yValueMapper: (int index) => count[index]["number"] as num,
      // ),
                  ),
                ))
          ]),
          bottomNavigationBar: Container(
              // width: 60,
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 12, bottom: 12),
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 0, bottom: 12),
              decoration: const BoxDecoration(

                  gradient: LinearGradient(
                      colors: [Color(0xFF5854E2), Color(0xFFAA44D1)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        child: const Icon(Icons.home,
                            size: 24, color: Colors.white),
                        onTap: () {
                          Get.offAndToNamed(Routes.HOME);
                        }),
                    InkWell(
                        child: const Icon(Icons.person,
                            size: 24, color: Colors.white),
                        onTap: () {
                          Get.offAllNamed(Routes.PERSONAL);
                        }),
                    InkWell(
                        child: const Icon(Icons.camera_alt_rounded,
                            size: 24, color: Colors.white),
                        onTap: () {
                          Get.offAndToNamed(Routes.CAMERAS);
                        }),
                    InkWell(
                        child: const Icon(Icons.list,
                            size: 24, color: Colors.white),
                        onTap: () {
                          Get.offAndToNamed(Routes.STUDENTS);
                        })
                  ])));
    }, onLoading: const LoadingScreen());
  }
}
