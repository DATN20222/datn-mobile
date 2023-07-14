import 'package:datn/controller/personal_controller.dart';
import 'package:get/get.dart';

class HomeUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalController>(
          () => PersonalController(),
    );
  }
}