import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/users.dart';
import 'package:get/get.dart';

class StudentController extends GetxController with StateMixin{
    RxList<User> users = <User>[].obs;

    @override
    Future<void> onInit() async{
      change(null, status:RxStatus.loading());
      users.value = await UserApi.instance.getListUser();
      change(null, status: RxStatus.success());
      super.onInit();
  }

}