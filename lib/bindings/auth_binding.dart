import 'package:datn/controller/auth_controller.dart';
import 'package:datn/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
        AuthController(authRepo: AuthenticationRepositoryIml()),
        permanent: true);
  }
}
