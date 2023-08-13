import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/users.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignUpController extends GetxController{
    RxBool isLoading = false.obs;
    TextEditingController birthdayController = TextEditingController();
    var selectedDate = DateTime.now().obs;
    Future<void> selectDate() async {
        final DateTime? pickedDate = await showDatePicker(
            context: Get.context!,
            initialDate: selectedDate.value,
            firstDate: DateTime(1990),
            lastDate: DateTime(2025),
            builder: (context, child) {
                return Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                            primary: Color(0xFF5500CC), // header background color
                            onPrimary: Colors.white, // header text color
                            onSurface: Color(0xFF884cdb) , // body text color
                        ),
                        textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF7632d6), // button text color
                            ),
                        ),
                        dialogBackgroundColor:Colors.white,
                    ),
                    child: child!,
                );
            },
        );
        if (pickedDate != null && pickedDate != selectedDate.value) {
            birthdayController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
            selectedDate.value = pickedDate;
        }
    }
    signUp(String phone, String password, String email, String name) async{
        User user = User(name: name,
            password: password,
            email: email,
            phone: phone,
            birthday: selectedDate.value,
            history: []
        );
        isLoading.value = true;
        final res = await UserApi.instance.signUp(user);
        isLoading.value = false;
        if (res == 201) {
            Get.snackbar("Success", "Đăng ký thành công, đợi cán bộ cấp quyền để có thể truy cập!", backgroundColor: Colors.white);
            Future.delayed(const Duration(milliseconds: 2000), (){
                Get.offAllNamed(Routes.LOGIN);
            });
        } else {
            Get.snackbar("Error", "Có lỗi xảy ra!", backgroundColor: Colors.white);
        }
    }
}