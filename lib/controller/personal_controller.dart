import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PersonalController extends GetxController{
  final getStorage = GetStorage();
  RxString name = "name".obs;
  RxString phone = "phone".obs;
  RxString code = "code".obs;
  RxString id = "id".obs;
  RxString email = "".obs;
  @override
  void onInit() {
    name.value = getStorage.read("name");
    phone.value = getStorage.read("phone");
    code.value = getStorage.read("code");
    id.value = getStorage.read("id");

    super.onInit();
  }
}