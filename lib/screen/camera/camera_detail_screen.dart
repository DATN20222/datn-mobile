import 'dart:convert';

import 'package:datn/controller/camera_controller.dart';
import 'package:datn/models/events.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:datn/screen/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CameraScreen extends StatefulWidget {
  @override
  CameraScreenState createState() {
    return CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.purple[50]!);
    color.add(const Color(0xFF939CD8));
    color.add(const Color(0xFF6875C8));
    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return controller.obx((state) {
      return WillPopScope(
        onWillPop: () async {
          Get.offAndToNamed(Routes.HOME);
          return false;
        },
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
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
                              if (Get.isPopGestureEnable){
                                Get.back();
                              } else {
                                Get.offAndToNamed(Routes.HOME);
                              }
                            },
                            child: const Icon(Icons.arrow_back_rounded,
                                color: Color(0xFF5141C7), size: 20)),
                      ),
                      const SizedBox(width: 18),
                      Text(controller.camera.value.name,
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
              Positioned(
                left: 12,
                top: 70,
                // right: 5,
                // bottom: 5,
                child: Container(
                  height: 142,
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
                      width: Get.width - 30,
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
                                      Text(
                                          controller.temperature.value
                                              .toStringAsFixed(2),
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
                                      Text(
                                          "${controller.humidity.value.toStringAsFixed(2)} %",
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
                                          controller.camera.value.count
                                                  .toString() ??
                                              "0",
                                          style: GoogleFonts.play(
                                              color: const Color(0xFF6759ED),
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600))),
                                      Text("người",
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
                                          controller.ppm.value.toStringAsFixed(2),
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
              // Positioned(
              //   left: 0,
              //   top: 120,
              //   width: MediaQuery.of(context).size.width,
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //     Container(
              //       width: 161,
              //       height: 134,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(12),
              //           color: Colors.white,
              //         boxShadow: const [
              //           BoxShadow(
              //             blurRadius: 12,
              //             offset: Offset(6,4),
              //             color: Color.fromRGBO(111, 131, 231, 0.4)
              //           )
              //         ]
              //       ),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text("24", style: GoogleFonts.play(
              //             textStyle: const TextStyle(
              //               fontSize: 24,
              //               color:Color(0xFF6759ED)
              //             )
              //           )),
              //           Text("độ C", style: GoogleFonts.play(
              //             textStyle: const TextStyle(
              //               fontSize: 20,
              //               color: Color(0xFFA3A3A3)
              //             )
              //           ))
              //         ]
              //       )
              //     ),
              //     Container(
              //         width: 161,
              //         height: 134,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(12),
              //             color: Colors.white,
              //             boxShadow: const [
              //               BoxShadow(
              //                   blurRadius: 21,
              //                   offset: Offset(6,4),
              //                   color: Color.fromRGBO(111, 131, 231, 0.4)
              //               )
              //             ]
              //         ),
              //         child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text("75 %", style: GoogleFonts.play(
              //                   textStyle: const TextStyle(
              //                       fontSize: 24,
              //                       color:Color(0xFF6759ED)
              //                   )
              //               )),
              //               Text("độ ẩm", style: GoogleFonts.play(
              //                   textStyle: const TextStyle(
              //                       fontSize: 20,
              //                       color: Color(0xFFA3A3A3)
              //                   )
              //               ))
              //             ]
              //         )
              //     ),
              //   ]),
              // ),
              // Positioned(
              //     left: 20,
              //     top: 235,
              //     child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           boxShadow: const [
              //             BoxShadow(
              //                 color: Color(0xFFD3D3D3),
              //                 spreadRadius: 1,
              //                 blurRadius: 7,
              //                 offset: Offset(2, 4))
              //           ],
              //         ),
              //         child: Image.memory(base64Decode(controller.image.value),
              //             fit: BoxFit.fill, width: Get.width - 30, height: 192))),
              Positioned(
                  top: 235,
                  left: 12,
                  right: 5,
                  bottom: 5,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: Get.height - 40,
                      child: Column(
                        children: [
                          Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color(0xFFD3D3D3),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: Offset(2, 4))
                                      ],
                                    ),
                                    child: Image.memory(base64Decode(controller.image.value),
                                        fit: BoxFit.fill, width: Get.width - 30, height: 192)),
                          const SizedBox(height: 5),
                          if(controller.usersInRoom.isNotEmpty)
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Users", style: GoogleFonts.play(
                                  textStyle: const TextStyle(
                                    color: Color(0xFF6759ED),
                                    fontSize: 18
                                  )
                                )),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(30)),
                                      child: ListView(
                                        children: controller.usersInRoom.map((element) => ListTile(
                                          title: Text("User: ${element.name}", style: GoogleFonts.play()),
                                          subtitle: Text("Thời gian: ${DateFormat().format(DateTime.fromMillisecondsSinceEpoch(element.history[element.history.length - 1].timeStamp.millisecondsSinceEpoch))}")
                                        )).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              height: 250,
                              width: Get.width - 40,
                              child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(
                                      // labelStyle: TextStyle(fontSize: 20),
                                      // maximumLabels: 100,
                                      // autoScrollingDelta: 10,
                                      // majorGridLines: MajorGridLines(width: 0),
                                      // majorTickLines: MajorTickLines(width: 0),
                                      ),

                                  // Chart title
                                  title: ChartTitle(
                                      text: 'Temperature',
                                      alignment: ChartAlignment.near,
                                      textStyle: GoogleFonts.play(
                                          textStyle: const TextStyle(
                                        color: Color(0xFF6759ED),
                                      ))),
                                  // Enable legend
                                  // legend: Legend(isVisible: true),
                                  // Enable tooltip
                                  tooltipBehavior: TooltipBehavior(enable: true),
                                  series: <ChartSeries<EventModel, DateTime>>[
                                    AreaSeries<EventModel, DateTime>(
                                      gradient: gradientColors,
                                      dataSource: controller.events,
                                      xValueMapper: (EventModel event, _) =>
                                          event.timeStamp,
                                      yValueMapper: (EventModel event, _) =>
                                          event.temperature,
                                      name: 'Temperature',
                                      // dataLabelSettings: const DataLabelSettings(isVisible: true),
                                      // emptyPointSettings: EmptyPointSettings(
                                      //   // Mode of empty point
                                      //     mode: EmptyPointMode.average)
                                    ),
                                    // Enable data label
                                  ]),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              height: 250,
                              width: Get.width - 40,
                              child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(
                                    // labelStyle: TextStyle(fontSize: 20),
                                    // maximumLabels: 100,
                                    // autoScrollingDelta: 10,
                                    // majorGridLines: MajorGridLines(width: 0),
                                    // majorTickLines: MajorTickLines(width: 0),
                                  ),

                                  // Chart title
                                  title: ChartTitle(
                                      text: 'Humidity',
                                      alignment: ChartAlignment.near,
                                      textStyle: GoogleFonts.play(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF6759ED),
                                          ))),
                                  // Enable legend
                                  // legend: Legend(isVisible: true),
                                  // Enable tooltip
                                  tooltipBehavior: TooltipBehavior(enable: true),
                                  series: <ChartSeries<EventModel, DateTime>>[
                                    AreaSeries<EventModel, DateTime>(
                                      gradient: gradientColors,
                                      dataSource: controller.events,
                                      xValueMapper: (EventModel event, _) =>
                                      event.timeStamp,
                                      yValueMapper: (EventModel event, _) =>
                                      event.humidity,
                                      name: 'Humidity',
                                      // dataLabelSettings: const DataLabelSettings(isVisible: true),
                                      // emptyPointSettings: EmptyPointSettings(
                                      //   // Mode of empty point
                                      //     mode: EmptyPointMode.average)
                                    ),
                                    // Enable data label
                                  ]),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              height: 250,
                              width: Get.width - 40,
                              child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(
                                    // labelStyle: TextStyle(fontSize: 20),
                                    // maximumLabels: 100,
                                    // autoScrollingDelta: 10,
                                    // majorGridLines: MajorGridLines(width: 0),
                                    // majorTickLines: MajorTickLines(width: 0),
                                  ),

                                  // Chart title
                                  title: ChartTitle(
                                      text: 'PPM',
                                      alignment: ChartAlignment.near,
                                      textStyle: GoogleFonts.play(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF6759ED),
                                          ))),
                                  // Enable legend
                                  // legend: Legend(isVisible: true),
                                  // Enable tooltip
                                  tooltipBehavior: TooltipBehavior(enable: true),
                                  series: <ChartSeries<EventModel, String>>[
                                    AreaSeries<EventModel, String>(
                                      gradient: gradientColors,
                                      dataSource: controller.events,
                                      xValueMapper: (EventModel event, _) =>
                                          DateFormat(DateFormat.HOUR24_MINUTE_SECOND).format(DateTime.fromMillisecondsSinceEpoch(event.timeStamp!.millisecondsSinceEpoch)),
                                      yValueMapper: (EventModel event, _) =>
                                      event.ppm,
                                      name: 'PPM',
                                      // dataLabelSettings: const DataLabelSettings(isVisible: true),
                                      // emptyPointSettings: EmptyPointSettings(
                                      //   // Mode of empty point
                                      //     mode: EmptyPointMode.average)
                                    ),
                                    // Enable data label
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),

            ],
          ),
        ),
      );
    },
      onLoading: const LoadingScreen()
    );
  }
}
