import 'package:datn/bindings/auth_binding.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(GetApp());
}

class GetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        initialBinding: AuthBinding(),
        // home: Root(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.pages,
    );
  }
}