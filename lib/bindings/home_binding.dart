import 'package:datn/controller/home_controller.dart';
import 'package:datn/controller/personal_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<PersonalController>(
          () => PersonalController(),
    );
  }
}