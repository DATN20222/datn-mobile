import 'package:datn/controller/add_student_controller.dart';
import 'package:get/get.dart';

class AddStudentBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddStudentController>(() => AddStudentController());
  }

}