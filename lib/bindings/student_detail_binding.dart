import 'package:datn/controller/student_detail_controller.dart';
import 'package:get/get.dart';

class StudentDetailBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StudentDetailController>(() => StudentDetailController());
  }
}