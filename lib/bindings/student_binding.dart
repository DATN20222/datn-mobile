import 'package:datn/controller/student_controller.dart';
import 'package:get/get.dart';

class StudentBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StudentController>(() => StudentController());
  }

}