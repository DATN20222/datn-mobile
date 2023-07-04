import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PersonalController extends GetxController{
  final getStorage = GetStorage();
  RxString name = "name".obs;
  RxString phone = "phone".obs;
  RxInt code = 0.obs;
  RxString id = "id".obs;
  RxString email = "email".obs;
  RxString role = "ADMIN".obs;

  @override
  void onInit() {
    role.value = getStorage.read("role");
    name.value = getStorage.read("name");
    phone.value = getStorage.read("phone");
    code.value = getStorage.read("code");
    id.value = getStorage.read("id");
    email.value = getStorage.read("email");
    super.onInit();
  }
}