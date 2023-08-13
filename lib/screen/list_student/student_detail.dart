import 'package:datn/controller/student_detail_controller.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:datn/widgets/app_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

class StudentDetailScreen extends GetView<StudentDetailController> {
  const StudentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentDetailController controller = Get.find();

    return controller.obx((state) {
      TextEditingController emailController =
          TextEditingController(text: controller.user.value.email ?? "");
      TextEditingController nameController =
          TextEditingController(text: controller.user.value.name);
      TextEditingController codeController = TextEditingController(
          text: controller.user.value.code?.toString() ?? '0');
      TextEditingController phoneController =
          TextEditingController(text: controller.user.value.phone);
      return WillPopScope(
        onWillPop: () async {
          Get.offAndToNamed(Routes.STUDENTS);
          return false;
        },
        child: Scaffold(
          body: Stack(children: [
            Positioned(
              top: -642,
              left: -229,
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
              top: 30,
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
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_rounded,
                              color: Color(0xFF5141C7), size: 20)),
                    ),
                    // const SizedBox(width: 24),
                    Expanded(
                      child: Text(controller.user.value.name,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.play(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                          onTap: () {
                            Get.bottomSheet(
                                Stack(alignment: Alignment.topRight, children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.only(
                                        bottom: 20,
                                        left: 20,
                                        right: 20,
                                        top: 10),
                                    child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "User's information",
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
                                            SingleChildScrollView(
                                              child: Container(
                                                padding: const EdgeInsets.all(15),
                                                // margin: const EdgeInsets.all(10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    20,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color:
                                                              Color(0xFFD3D3D3),
                                                          spreadRadius: 1,
                                                          blurRadius: 7,
                                                          offset: Offset(2, 4))
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Column(children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Số điện thoại",
                                                              style: GoogleFonts.play(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          Text(
                                                              controller.user
                                                                  .value.phone,
                                                              style: GoogleFonts.play(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300)))
                                                        ]),
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
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Email",
                                                              style: GoogleFonts.play(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          Text(
                                                              controller.user
                                                                  .value.email!,
                                                              style: GoogleFonts.play(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300))),
                                                        ]),
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
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Mã số ",
                                                              style: GoogleFonts.play(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          Text(
                                                              controller
                                                                  .user.value.code
                                                                  .toString(),
                                                              style: GoogleFonts.play(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300))),
                                                        ]),
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
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Ngày sinh ",
                                                              style: GoogleFonts.play(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          Text(
                                                              DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(controller
                                                                          .user
                                                                          .value
                                                                          .birthday ??
                                                                      DateTime(
                                                                          2000,
                                                                          11,
                                                                          9)),
                                                              style: GoogleFonts.play(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300))),
                                                        ]),
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
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Vai trò",
                                                              style: GoogleFonts.play(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          Text(
                                                              controller
                                                                      .user
                                                                      .value
                                                                      .role ??
                                                                  "",
                                                              style: GoogleFonts.play(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300)))
                                                        ]),
                                                  ),
                                                ]),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            Color(0xFF5955EE),
                                                            Color(0xFFC76DE8)
                                                          ]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    margin: const EdgeInsets.only(
                                                        bottom: 32),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        shadowColor:
                                                            Colors.transparent,
                                                        // foregroundColor: Colors.transparent,
                                                        padding: EdgeInsets.zero,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                      ),
                                                      onPressed: () {
                                                        Get.bottomSheet(
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      "Update user",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: GoogleFonts
                                                                          .play(
                                                                              textStyle:
                                                                                  const TextStyle(
                                                                        color: Color(
                                                                            0xFF5955EE),
                                                                        fontSize:
                                                                            24,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                      )),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    AppTextField(
                                                                      hintText:
                                                                          'Phone...',
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .phone,
                                                                      controller:
                                                                          phoneController,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    AppTextField(
                                                                      hintText:
                                                                          'Name...',
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      controller:
                                                                          nameController,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    AppTextField(
                                                                      hintText:
                                                                          'Email...',
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .emailAddress,
                                                                      controller:
                                                                          emailController,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    AppTextField(
                                                                      hintText:
                                                                          'Code...',
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      controller:
                                                                          codeController,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    Obx(
                                                                      () =>
                                                                          AppTextField(
                                                                        readOnly:
                                                                            true,
                                                                        // hintText: 'Birthday...',
                                                                        // keyboardType: TextInputType.datetime,
                                                                        controller:
                                                                            controller
                                                                                .birthdayController,
                                                                        onTap:
                                                                            () async {
                                                                          await controller
                                                                              .selectDate();
                                                                        },
                                                                        hintText: DateFormat(
                                                                                'dd-MM-yyyy')
                                                                            .format(controller
                                                                                .selectedDate
                                                                                .value)
                                                                            .toString(),

                                                                        suffixIcon: IconButton(
                                                                            onPressed: () {
                                                                              controller.selectDate();
                                                                            },
                                                                            icon: const Icon(
                                                                              Icons.date_range_rounded,
                                                                              color:
                                                                                  Color(0xFFCCC8FF),
                                                                            )),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left: 20,
                                                                        right: 20,
                                                                        top: 0,
                                                                        bottom: 0,
                                                                      ),
                                                                      height:
                                                                          44.5,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  10),
                                                                          border: Border.all(
                                                                              color:
                                                                                  const Color(0xFFC4BFEF))),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            "Role...",
                                                                            style:
                                                                                GoogleFonts.play(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFFC4BFEF))),
                                                                          ),
                                                                          Obx(
                                                                            () => DropdownButton(
                                                                                padding: EdgeInsets.zero,
                                                                                iconEnabledColor: Color(0xFF5955EE),
                                                                                items: controller.dropdownText
                                                                                    .map((e) => DropdownMenuItem(
                                                                                          value: e,
                                                                                          child: Text(
                                                                                            e,
                                                                                            style: GoogleFonts.play(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFFC4BFEF))),
                                                                                          ),
                                                                                        ))
                                                                                    .toList(),
                                                                                onChanged: (newValue) {
                                                                                  controller.setSelectedValue(newValue ?? 'USER');
                                                                                },
                                                                                value: controller.selectedDrowpdown.value),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 20,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient:
                                                                                  const LinearGradient(colors: [
                                                                                Color(0xFF5955EE),
                                                                                Color(0xFFC76DE8),
                                                                              ]),
                                                                              borderRadius:
                                                                                  BorderRadius.circular(20),
                                                                            ),
                                                                            margin: const EdgeInsets.only(
                                                                                bottom:
                                                                                    32),
                                                                            child:
                                                                                ElevatedButton(
                                                                              style:
                                                                                  ElevatedButton.styleFrom(
                                                                                backgroundColor: Colors.transparent,
                                                                                shadowColor: Colors.transparent,
                                                                                // foregroundColor: Colors.transparent,
                                                                                padding: EdgeInsets.zero,
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                              ),
                                                                              onPressed:
                                                                                  () async {
                                                                                controller.updateUser(nameController.text, phoneController.text, controller.selectedDrowpdown.value, emailController.text, int.parse(codeController.text));

                                                                                Get.back();
                                                                                Get.back();
                                                                                },
                                                                              child:
                                                                                  SizedBox(
                                                                                width: 120,
                                                                                child: Text(
                                                                                  "Update",
                                                                                  style: GoogleFonts.play(
                                                                                    textStyle: const TextStyle(fontSize: 14),
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              ),
                                                                            )),
                                                                        Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient:
                                                                                  const LinearGradient(colors: [
                                                                                Color(0xFFC76DE8),
                                                                                Color(0xFF5955EE),
                                                                              ]),
                                                                              borderRadius:
                                                                                  BorderRadius.circular(20),
                                                                            ),
                                                                            margin: const EdgeInsets.only(
                                                                                bottom:
                                                                                    32),
                                                                            child:
                                                                                ElevatedButton(
                                                                              style:
                                                                                  ElevatedButton.styleFrom(
                                                                                backgroundColor: Colors.transparent,
                                                                                shadowColor: Colors.transparent,
                                                                                // foregroundColor: Colors.transparent,
                                                                                padding: EdgeInsets.zero,
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                              ),
                                                                              onPressed:
                                                                                  () async {
                                                                                Get.back();
                                                                              },
                                                                              child:
                                                                                  SizedBox(
                                                                                width: 120,
                                                                                child: Text(
                                                                                  "Cancel",
                                                                                  style: GoogleFonts.play(
                                                                                    textStyle: const TextStyle(fontSize: 14),
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              ),
                                                                            )),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            isScrollControlled:
                                                                true);
                                                      },
                                                      child: SizedBox(
                                                        width: 120,
                                                        child: Text(
                                                          "Chỉnh sửa",
                                                          style: GoogleFonts.play(
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize: 14),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    )),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            Color(0xFFC76DE8),
                                                            Color(0xFF5955EE),
                                                          ]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    margin: const EdgeInsets.only(
                                                        bottom: 32),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        shadowColor:
                                                            Colors.transparent,
                                                        // foregroundColor: Colors.transparent,
                                                        padding: EdgeInsets.zero,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                      ),
                                                      onPressed: () async {
                                                        await controller
                                                            .deleteUser();
                                                        Get.offAllNamed(
                                                            Routes.STUDENTS);
                                                      },
                                                      child: SizedBox(
                                                        width: 120,
                                                        child: Text(
                                                          "Xóa",
                                                          style: GoogleFonts.play(
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize: 14),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            // const SizedBox(height: 30),
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
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
                          child: const Icon(Icons.more_vert_rounded,
                              color: Colors.white, size: 20)),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Positioned(
                left: 21,
                top: 80,
                width: Get.width - 42,
                height: 200,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 21,
                            offset: Offset(3, 4),
                            color: Color.fromRGBO(111, 131, 231, 0.4)),
                      ]),
                  child: TableCalendar(
                    calendarFormat: CalendarFormat.twoWeeks,
                    rangeSelectionMode: controller.rangeSelectionMode.value,
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(
                          controller.selectTime.value, selectedDay)) {
                        controller.changeSelectAndFocusTime(selectedDay);
                      }
                    },
                    onPageChanged: (focusedDay) =>
                        controller.onPageChanged(focusedDay),
                    selectedDayPredicate: (day) =>
                        isSameDay(controller.selectTime.value, day),
                    headerStyle: HeaderStyle(
                      formatButtonDecoration: const BoxDecoration(
                          border: Border.fromBorderSide(
                              BorderSide(color: Color(0xFF5955EE))),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      leftChevronIcon: const Icon(Icons.chevron_left,
                          color: Color(0xFF5955EE)),
                      rightChevronIcon: const Icon(Icons.chevron_right,
                          color: Color(0xFF5955EE)),
                      formatButtonTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(
                              fontSize: 14.0, color: Color(0xFF5955EE))),
                      titleTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(
                              fontSize: 17.0, color: Color(0xFF5955EE))),
                    ),
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: controller.focusTime.value!,
                    calendarStyle: CalendarStyle(
                      tableBorder: TableBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      selectedDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF5955EE), Color(0xFFC76DE8)]),
                          shape: BoxShape.circle),
                      todayDecoration: const BoxDecoration(
                          border: Border.fromBorderSide(
                              BorderSide(color: Color(0xFF5955EE))),
                          shape: BoxShape.circle),
                      todayTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Color(0xFF5955EE))),
                      selectedTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Colors.white)),
                      rangeEndTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Colors.white)),
                      rangeStartTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Colors.white)),
                      rangeEndDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF5955EE), Color(0xFFC76DE8)]),
                          shape: BoxShape.circle),
                      rangeStartDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF5955EE), Color(0xFFC76DE8)]),
                          shape: BoxShape.circle),
                      weekendTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Color(0xFFBB99EA))),
                      withinRangeTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Color(0xFF5955EE))),
                      weekNumberTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Color(0xFFBB99EA))),
                      defaultTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Color(0xFF7632d6))),
                      holidayTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Color(0xFF884cdb))),
                      outsideTextStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Color(0xFFddccf4))),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Color(0xFF7632d6))),
                      weekendStyle: GoogleFonts.play(
                          textStyle: const TextStyle(color: Color(0xFF7632d6))),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                left: 21,
                top: 305,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Xuất hiện gần nhất:",
                        style: GoogleFonts.play(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5955EE)))),
                    const SizedBox(height: 10),
                    Text(
                      (controller.user.value.history.isEmpty)
                          ? "Người dùng chưa xuất hiện"
                          : "- Vị trí: ${controller.user.value.history[0].cameraId}",
                      style: GoogleFonts.play(
                          textStyle: const TextStyle(
                        fontSize: 15,
                      )),
                    ),
                    const SizedBox(height: 10),
                    (controller.user.value.history.isNotEmpty)
                        ? Text(
                            "- Thời gian: ${DateFormat().format(DateTime.fromMillisecondsSinceEpoch(controller.user.value.history[0].timeStamp.millisecondsSinceEpoch))}",
                            style: GoogleFonts.play(
                                textStyle: const TextStyle(fontSize: 15)))
                        : Container()
                  ],
                )),
            Positioned(
              left: 21,
              top: 390,
              bottom: 5,
              right: 21,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.cameraSum.value.isNotEmpty) ...[
                      Text(
                        "Thống kê thời gian: ",
                        style: GoogleFonts.play(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5955EE))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 180,
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
                            ]),
                        child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            series: [
                              BarSeries<CameraSumTime, String>(
                                  dataSource: controller.cameraSum?.value ??
                                      <CameraSumTime>[],
                                  xValueMapper: (CameraSumTime data, index) =>
                                      data.name,
                                  yValueMapper: (CameraSumTime data, index) =>
                                      data.total,
                                  // Width of the bars
                                  width: 0.6,
                                  color: const Color(0xFF6F83E7),
                                  // Spacing between the bars
                                  spacing: 0.3,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  dataLabelSettings:
                                      const DataLabelSettings(isVisible: true))
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
                      ),
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Chi tiết thời gian: ",
                      style: GoogleFonts.play(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5955EE))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 210,
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
                                  MaterialStateProperty.resolveWith(
                                      (Set states) {
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
                                controller.history.value.length,
                                (index) {
                                  var data = controller.history.value[index];
                                  return DataRow(cells: [
                                    // DataCell(
                                    //   Text(controller.user.value.code.toString()),
                                    // ),
                                    DataCell(
                                      Text(
                                        DateFormat(
                                                DateFormat.HOUR24_MINUTE_SECOND)
                                            .format(DateTime
                                                .fromMillisecondsSinceEpoch(data
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
                                          data.cameraId,
                                          style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFF5D51A6))),
                                        ), onTap: () {
                                      if (data.position != null) {
                                        final listXY = controller
                                            .parsePosition(data.position!);
                                        print(listXY[2]);
                                        Get.dialog(Dialog(
                                          insetPadding:
                                              const EdgeInsets.all(10),
                                          backgroundColor: Colors.transparent,
                                          child: Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Center(
                                                      child: Text(
                                                        "Chi tiết vị trí",
                                                        style: GoogleFonts.play(
                                                            textStyle:
                                                                const TextStyle(
                                                          color:
                                                              Color(0xFF5955EE),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300))),
                                                        Text(
                                                            data.userId
                                                                .toString(),
                                                            style: GoogleFonts.play(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        16,
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
                                                        color:
                                                            Color(0xFFCCC8FF),
                                                        thickness: 1),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300))),
                                                        Text(data.cameraId,
                                                            style: GoogleFonts.play(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        16,
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
                                                        color:
                                                            Color(0xFFCCC8FF),
                                                        thickness: 1),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0.0,
                                                            left: 12,
                                                            right: 12),
                                                    child: Text(
                                                        "Hình ảnh minh họa vị trí: ",
                                                        style: GoogleFonts.play(
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300))),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            border:
                                                                Border.all()),
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
                  ],
                ),
              ),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await controller.generateExcel();
            },
            backgroundColor: Colors.transparent,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFF704BFD), Color(0xFFC979FF)])),
              child: const Icon(Icons.save),
            ),
          ),
        ),
      );
    },
        onLoading: Container(
            color: Colors.white,
            child: const Center(
                child: CircularProgressIndicator(
              color: Color(0xFF5854E2),
            ))));
  }
}

class RectanglePainter extends CustomPainter {
  RectanglePainter(this.xmin, this.ymin, this.xmax, this.ymax);
  final double xmin;
  final double ymin;
  final double xmax;
  final double ymax;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Color(0xFFCCC8FF);

    canvas.drawRect(
        Rect.fromLTRB(xmin * (Get.width - 40), ymin * 192,
            xmax * (Get.width - 40), ymax * 192),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
