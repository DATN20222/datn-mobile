import 'package:datn/controller/student_detail_controller.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class StudentDetailScreen extends GetView<StudentDetailController> {
  const StudentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentDetailController controller = Get.find();
    return controller.obx((state) {
      return Scaffold(
          body: Stack(fit: StackFit.expand, children: [
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
          top: 50,
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
                        Get.offAndToNamed(Routes.HOME);
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
              ],
            ),
          ),
        ),
        Positioned(
          left: 21,
          top: 110,
          width: Get.width - 42,
          height: Get.height - 460,
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
                headerStyle: HeaderStyle(
                  formatButtonDecoration: const BoxDecoration(
                      border: Border.fromBorderSide(
                          BorderSide(color: Color(0xFF5955EE))),
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  leftChevronIcon:
                      const Icon(Icons.chevron_left, color: Color(0xFF5955EE)),
                  rightChevronIcon:
                      const Icon(Icons.chevron_right, color: Color(0xFF5955EE)),
                  formatButtonTextStyle: GoogleFonts.play(
                      textStyle: const TextStyle(
                          fontSize: 14.0, color: Color(0xFF5955EE))),
                  titleTextStyle: GoogleFonts.play(
                      textStyle: const TextStyle(
                          fontSize: 17.0, color: Color(0xFF5955EE))),
                ),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
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
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF5955EE), Color(0xFFC76DE8)]),
                      shape: BoxShape.circle),
                )),
          ),
        ),
      ]));
    });
  }
}
